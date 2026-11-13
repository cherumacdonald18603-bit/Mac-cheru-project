


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE OR REPLACE FUNCTION "public"."handle_new_user"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
BEGIN
  INSERT INTO public.profiles (id, email, role)
  VALUES (
    NEW.id,
    NEW.email,
    CASE
      WHEN NEW.raw_user_meta_data->>'role' IN ('buyer', 'seller')
        THEN NEW.raw_user_meta_data->>'role'
      ELSE 'buyer'
    END
  );

  RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."handle_new_user"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."is_admin"() RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  select exists (
    select 1
    from public.profiles
    where id = auth.uid()
    and role = 'admin'
  );
$$;


ALTER FUNCTION "public"."is_admin"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."admin_withdrawals" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "admin_id" "uuid" NOT NULL,
    "amount" numeric(12,2) NOT NULL,
    "mpesa_number" "text" NOT NULL,
    "status" "text" DEFAULT 'pending'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "admin_withdrawals_amount_check" CHECK (("amount" > (0)::numeric)),
    CONSTRAINT "admin_withdrawals_status_check" CHECK (("status" = ANY (ARRAY['pending'::"text", 'approved'::"text", 'paid'::"text", 'rejected'::"text", 'failed'::"text"])))
);


ALTER TABLE "public"."admin_withdrawals" OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."request_admin_withdrawal"("p_amount" numeric, "p_mpesa_number" "text") RETURNS "public"."admin_withdrawals"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public', 'pg_temp'
    AS $_$
declare
  v_admin_id uuid;
  v_role text;
  v_commission numeric;
  v_reserved numeric;
  v_withdrawal public.admin_withdrawals;
begin
  v_admin_id := auth.uid();

  if v_admin_id is null then
    raise exception 'You must be logged in.';
  end if;

  -- Lock the admin profile to serialize withdrawal requests.
  select lower(role)
    into v_role
  from public.profiles
  where id = v_admin_id
  for update;

  if v_role is distinct from 'admin' then
    raise exception 'Only administrators can request withdrawals.';
  end if;

  if p_amount is null or p_amount <= 0 then
    raise exception 'Enter a valid withdrawal amount.';
  end if;

  if p_mpesa_number is null
     or p_mpesa_number !~ '^254(7|1)[0-9]{8}$' then
    raise exception 'Enter a valid Kenyan M-Pesa number.';
  end if;

  select coalesce(sum(commission), 0)
    into v_commission
  from public.payments
  where lower(trim(status)) = 'paid';

  select coalesce(sum(amount), 0)
    into v_reserved
  from public.admin_withdrawals
  where status in ('pending', 'approved', 'paid');

  if p_amount > v_commission - v_reserved then
    raise exception 'Insufficient available commission balance.';
  end if;

  insert into public.admin_withdrawals (
    admin_id, amount, mpesa_number, status
  )
  values (
    v_admin_id, p_amount, p_mpesa_number, 'pending'
  )
  returning * into v_withdrawal;

  return v_withdrawal;
end;
$_$;


ALTER FUNCTION "public"."request_admin_withdrawal"("p_amount" numeric, "p_mpesa_number" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."save_checkout_request"("p_order_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
begin
  update public.orders
  set status = 'pending'
  where id = p_order_id;
end;
$$;


ALTER FUNCTION "public"."save_checkout_request"("p_order_id" "uuid") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."save_checkout_request"("p_order_id" "uuid", "p_checkout_request_id" "text") RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
begin
  update public.orders
  set checkout_request_id = p_checkout_request_id
  where id = p_order_id;
end;
$$;


ALTER FUNCTION "public"."save_checkout_request"("p_order_id" "uuid", "p_checkout_request_id" "text") OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."marketplace_settings" (
    "id" integer DEFAULT 1 NOT NULL,
    "is_open" boolean DEFAULT true NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    CONSTRAINT "marketplace_settings_id_check" CHECK (("id" = 1))
);


ALTER TABLE "public"."marketplace_settings" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."orders" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "buyer_id" "uuid",
    "product_id" "uuid",
    "quantity" integer DEFAULT 1,
    "status" "text" DEFAULT 'pending'::"text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "checkout_request_id" "text",
    "payment_status" "text" DEFAULT 'pending'::"text"
);


ALTER TABLE "public"."orders" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."payments" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid",
    "buyer_id" "uuid",
    "seller_id" "uuid",
    "amount" numeric,
    "commission" numeric DEFAULT 0,
    "seller_amount" numeric,
    "status" "text" DEFAULT 'pending'::"text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "checkout_request_id" "text"
);


ALTER TABLE "public"."payments" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."payments_old" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "order_id" "uuid",
    "buyer_id" "uuid",
    "seller_id" "uuid",
    "amout" numeric,
    "commission" numeric DEFAULT '0'::numeric,
    "seller_amount" numeric,
    "status" "text" DEFAULT 'pending'::"text",
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."payments_old" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."products" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "seller_id" "uuid",
    "name" "text" NOT NULL,
    "description" "text",
    "price" numeric(10,2) NOT NULL,
    "image_url" "text",
    "status" "text" DEFAULT 'active'::"text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "is_active" boolean DEFAULT true NOT NULL
);


ALTER TABLE "public"."products" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."profiles" (
    "id" "uuid" NOT NULL,
    "email" "text",
    "full_name" "text",
    "role" "text" DEFAULT 'buyer'::"text" NOT NULL,
    "status" "text" DEFAULT 'active'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "phone" "text",
    CONSTRAINT "profiles_role_check" CHECK (("role" = ANY (ARRAY['buyer'::"text", 'seller'::"text", 'admin'::"text"]))),
    CONSTRAINT "profiles_status_check" CHECK (("status" = ANY (ARRAY['active'::"text", 'suspended'::"text", 'pending'::"text"])))
);


ALTER TABLE "public"."profiles" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."reports" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid",
    "user_role" "text",
    "type" "text",
    "subject" "text",
    "description" "text",
    "status" "text" DEFAULT 'pending'::"text",
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."reports" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."reports & complaints" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "user_role" "text" NOT NULL,
    "type" "text" NOT NULL,
    "subject" "text" NOT NULL,
    "description" "text" NOT NULL,
    "status" "text" DEFAULT 'pending'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."reports & complaints" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."settings" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "commission_rate" numeric NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."settings" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."stores" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "seller_id" "uuid" NOT NULL,
    "store_name" "text" NOT NULL,
    "description" "text",
    "phone" "text",
    "status" "text" DEFAULT 'active'::"text",
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."stores" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."withdrawals" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "seller_id" "uuid" NOT NULL,
    "phone" "text" NOT NULL,
    "amount" numeric NOT NULL,
    "status" "text" DEFAULT 'pending'::"text",
    "created_at" timestamp with time zone DEFAULT "now"()
);


ALTER TABLE "public"."withdrawals" OWNER TO "postgres";


ALTER TABLE ONLY "public"."payments_old"
    ADD CONSTRAINT "Payments_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."admin_withdrawals"
    ADD CONSTRAINT "admin_withdrawals_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."marketplace_settings"
    ADD CONSTRAINT "marketplace_settings_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."payments"
    ADD CONSTRAINT "payments_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."products"
    ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "profiles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."reports & complaints"
    ADD CONSTRAINT "reports & complaints_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."reports"
    ADD CONSTRAINT "reports_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."settings"
    ADD CONSTRAINT "settings_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."stores"
    ADD CONSTRAINT "stores_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."withdrawals"
    ADD CONSTRAINT "withdrawals_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."admin_withdrawals"
    ADD CONSTRAINT "admin_withdrawals_admin_id_fkey" FOREIGN KEY ("admin_id") REFERENCES "auth"."users"("id");



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_buyer_id_fkey" FOREIGN KEY ("buyer_id") REFERENCES "public"."profiles"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."products"
    ADD CONSTRAINT "products_seller_id_fkey" FOREIGN KEY ("seller_id") REFERENCES "public"."profiles"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "profiles_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."reports"
    ADD CONSTRAINT "reports_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id");



ALTER TABLE ONLY "public"."stores"
    ADD CONSTRAINT "stores_seller_id_fkey" FOREIGN KEY ("seller_id") REFERENCES "auth"."users"("id");



ALTER TABLE ONLY "public"."withdrawals"
    ADD CONSTRAINT "withdrawals_seller_id_fkey" FOREIGN KEY ("seller_id") REFERENCES "auth"."users"("id");



CREATE POLICY "Admins can create their own withdrawals" ON "public"."admin_withdrawals" FOR INSERT TO "authenticated" WITH CHECK ((("admin_id" = ( SELECT "auth"."uid"() AS "uid")) AND (EXISTS ( SELECT 1
   FROM "public"."profiles" "p"
  WHERE (("p"."id" = ( SELECT "auth"."uid"() AS "uid")) AND ("lower"("p"."role") = 'admin'::"text"))))));



CREATE POLICY "Admins can update all profiles" ON "public"."profiles" FOR UPDATE TO "authenticated" USING ("public"."is_admin"()) WITH CHECK ("public"."is_admin"());



CREATE POLICY "Admins can update orders" ON "public"."orders" FOR UPDATE TO "authenticated" USING (( SELECT "public"."is_admin"() AS "is_admin")) WITH CHECK (( SELECT "public"."is_admin"() AS "is_admin"));



CREATE POLICY "Admins can update settings" ON "public"."settings" FOR UPDATE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = "auth"."uid"()) AND ("profiles"."role" = 'admin'::"text"))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = "auth"."uid"()) AND ("profiles"."role" = 'admin'::"text")))));



CREATE POLICY "Admins can view all payments" ON "public"."payments" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = "auth"."uid"()) AND ("profiles"."role" = 'admin'::"text")))));



CREATE POLICY "Admins can view all payments" ON "public"."payments_old" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = "auth"."uid"()) AND ("profiles"."role" = 'admin'::"text")))));



CREATE POLICY "Admins can view all profiles" ON "public"."profiles" FOR SELECT TO "authenticated" USING ("public"."is_admin"());



CREATE POLICY "Admins can view their own withdrawals" ON "public"."admin_withdrawals" FOR SELECT TO "authenticated" USING ((("admin_id" = ( SELECT "auth"."uid"() AS "uid")) AND (EXISTS ( SELECT 1
   FROM "public"."profiles" "p"
  WHERE (("p"."id" = ( SELECT "auth"."uid"() AS "uid")) AND ("lower"("p"."role") = 'admin'::"text"))))));



CREATE POLICY "Authenticated buyers can create payments" ON "public"."payments" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "buyer_id"));



CREATE POLICY "Authenticated users can submit reports" ON "public"."reports" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "user_id"));



CREATE POLICY "Authenticated users can update reports" ON "public"."reports" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Authenticated users can update withdrawals" ON "public"."withdrawals" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Authenticated users can view active stores" ON "public"."stores" FOR SELECT TO "authenticated" USING (("status" = 'active'::"text"));



CREATE POLICY "Authenticated users can view marketplace settings" ON "public"."marketplace_settings" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Authenticated users can view reports" ON "public"."reports" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Authenticated users can view withdrawals" ON "public"."withdrawals" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Buyers can cancel pending orders" ON "public"."orders" FOR UPDATE TO "authenticated" USING ((("buyer_id" = ( SELECT "auth"."uid"() AS "uid")) AND ("status" = 'pending'::"text"))) WITH CHECK ((("buyer_id" = ( SELECT "auth"."uid"() AS "uid")) AND ("status" = 'cancelled'::"text")));



CREATE POLICY "Buyers can create their own orders" ON "public"."orders" FOR INSERT TO "authenticated" WITH CHECK ((("buyer_id" = ( SELECT "auth"."uid"() AS "uid")) AND (EXISTS ( SELECT 1
   FROM "public"."products" "p"
  WHERE (("p"."id" = "orders"."product_id") AND ("p"."is_active" = true)))) AND (EXISTS ( SELECT 1
   FROM "public"."marketplace_settings" "ms"
  WHERE (("ms"."id" = 1) AND ("ms"."is_open" = true))))));



CREATE POLICY "Buyers can view their payments" ON "public"."payments" FOR SELECT TO "authenticated" USING (("auth"."uid"() = "buyer_id"));



CREATE POLICY "Enable authenticated users to view orders" ON "public"."orders" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Enable buyers to create orders" ON "public"."orders" FOR INSERT TO "authenticated" WITH CHECK (true);



CREATE POLICY "Enable insert for authenticated users only" ON "public"."payments_old" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "buyer_id"));



CREATE POLICY "Enable insert for authenticated users only" ON "public"."products" FOR INSERT TO "authenticated" WITH CHECK (true);



CREATE POLICY "Enable sellers to update orders" ON "public"."orders" FOR UPDATE TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Enable users to view their own data only" ON "public"."payments_old" FOR SELECT TO "authenticated" USING ((( SELECT "auth"."uid"() AS "uid") = "buyer_id"));



CREATE POLICY "Enable users to view their own data only" ON "public"."products" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Enable users to view their own data only" ON "public"."settings" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Only admins can update marketplace settings" ON "public"."marketplace_settings" FOR UPDATE TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = "auth"."uid"()) AND ("profiles"."role" = 'admin'::"text"))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = "auth"."uid"()) AND ("profiles"."role" = 'admin'::"text")))));



CREATE POLICY "Sellers can create their own store" ON "public"."stores" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "seller_id"));



CREATE POLICY "Sellers can create withdrawals" ON "public"."withdrawals" FOR INSERT TO "authenticated" WITH CHECK (("auth"."uid"() = "seller_id"));



CREATE POLICY "Sellers can respond to pending orders" ON "public"."orders" FOR UPDATE TO "authenticated" USING ((("status" = 'pending'::"text") AND (EXISTS ( SELECT 1
   FROM "public"."products" "p"
  WHERE (("p"."id" = "orders"."product_id") AND ("p"."seller_id" = ( SELECT "auth"."uid"() AS "uid"))))))) WITH CHECK ((("status" = ANY (ARRAY['accepted'::"text", 'rejected'::"text"])) AND (EXISTS ( SELECT 1
   FROM "public"."products" "p"
  WHERE (("p"."id" = "orders"."product_id") AND ("p"."seller_id" = ( SELECT "auth"."uid"() AS "uid")))))));



CREATE POLICY "Sellers can update their own products" ON "public"."products" FOR UPDATE TO "authenticated" USING (("auth"."uid"() = "seller_id")) WITH CHECK (("auth"."uid"() = "seller_id"));



CREATE POLICY "Sellers can update their own store" ON "public"."stores" FOR UPDATE TO "authenticated" USING (("auth"."uid"() = "seller_id"));



CREATE POLICY "Sellers can view their own store" ON "public"."stores" FOR SELECT TO "authenticated" USING (("auth"."uid"() = "seller_id"));



CREATE POLICY "Sellers can view their payments" ON "public"."payments" FOR SELECT TO "authenticated" USING (("auth"."uid"() = "seller_id"));



CREATE POLICY "Sellers can view their payments" ON "public"."payments_old" FOR SELECT TO "authenticated" USING ((( SELECT "auth"."uid"() AS "uid") = "seller_id"));



CREATE POLICY "Sellers can view their withdrawals" ON "public"."withdrawals" FOR SELECT TO "authenticated" USING (("auth"."uid"() = "seller_id"));



CREATE POLICY "Users can read relevant orders" ON "public"."orders" FOR SELECT TO "authenticated" USING ((("buyer_id" = ( SELECT "auth"."uid"() AS "uid")) OR (EXISTS ( SELECT 1
   FROM "public"."products" "p"
  WHERE (("p"."id" = "orders"."product_id") AND ("p"."seller_id" = ( SELECT "auth"."uid"() AS "uid"))))) OR ( SELECT "public"."is_admin"() AS "is_admin")));



CREATE POLICY "Users can update own profile" ON "public"."profiles" FOR UPDATE TO "authenticated" USING (("id" = "auth"."uid"())) WITH CHECK (("id" = "auth"."uid"()));



CREATE POLICY "Users can view own profile" ON "public"."profiles" FOR SELECT TO "authenticated" USING (("id" = "auth"."uid"()));



ALTER TABLE "public"."admin_withdrawals" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."marketplace_settings" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."orders" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."payments" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."payments_old" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."products" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."profiles" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."reports" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."reports & complaints" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "seller_insert_own_products_policy_v2" ON "public"."products" FOR INSERT TO "authenticated" WITH CHECK ((("seller_id" = ( SELECT "auth"."uid"() AS "uid")) AND (EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = ( SELECT "auth"."uid"() AS "uid")) AND ("profiles"."role" = 'seller'::"text"))))));



ALTER TABLE "public"."settings" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."stores" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."withdrawals" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";






















































































































































GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "anon";
GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."handle_new_user"() TO "service_role";



GRANT ALL ON FUNCTION "public"."is_admin"() TO "anon";
GRANT ALL ON FUNCTION "public"."is_admin"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_admin"() TO "service_role";



GRANT ALL ON TABLE "public"."admin_withdrawals" TO "anon";
GRANT ALL ON TABLE "public"."admin_withdrawals" TO "authenticated";
GRANT ALL ON TABLE "public"."admin_withdrawals" TO "service_role";



REVOKE ALL ON FUNCTION "public"."request_admin_withdrawal"("p_amount" numeric, "p_mpesa_number" "text") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."request_admin_withdrawal"("p_amount" numeric, "p_mpesa_number" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."request_admin_withdrawal"("p_amount" numeric, "p_mpesa_number" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."save_checkout_request"("p_order_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."save_checkout_request"("p_order_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."save_checkout_request"("p_order_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."save_checkout_request"("p_order_id" "uuid", "p_checkout_request_id" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."save_checkout_request"("p_order_id" "uuid", "p_checkout_request_id" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."save_checkout_request"("p_order_id" "uuid", "p_checkout_request_id" "text") TO "service_role";


















GRANT ALL ON TABLE "public"."marketplace_settings" TO "anon";
GRANT ALL ON TABLE "public"."marketplace_settings" TO "authenticated";
GRANT ALL ON TABLE "public"."marketplace_settings" TO "service_role";



GRANT ALL ON TABLE "public"."orders" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."orders" TO "authenticated";
GRANT ALL ON TABLE "public"."orders" TO "service_role";



GRANT UPDATE("status") ON TABLE "public"."orders" TO "authenticated";



GRANT ALL ON TABLE "public"."payments" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."payments" TO "authenticated";
GRANT ALL ON TABLE "public"."payments" TO "service_role";



GRANT ALL ON TABLE "public"."payments_old" TO "anon";
GRANT ALL ON TABLE "public"."payments_old" TO "authenticated";
GRANT ALL ON TABLE "public"."payments_old" TO "service_role";



GRANT ALL ON TABLE "public"."products" TO "anon";
GRANT ALL ON TABLE "public"."products" TO "authenticated";
GRANT ALL ON TABLE "public"."products" TO "service_role";



GRANT ALL ON TABLE "public"."profiles" TO "anon";
GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."profiles" TO "authenticated";
GRANT ALL ON TABLE "public"."profiles" TO "service_role";



GRANT UPDATE("full_name") ON TABLE "public"."profiles" TO "authenticated";



GRANT UPDATE("status") ON TABLE "public"."profiles" TO "authenticated";



GRANT UPDATE("phone") ON TABLE "public"."profiles" TO "authenticated";



GRANT ALL ON TABLE "public"."reports" TO "anon";
GRANT ALL ON TABLE "public"."reports" TO "authenticated";
GRANT ALL ON TABLE "public"."reports" TO "service_role";



GRANT ALL ON TABLE "public"."reports & complaints" TO "anon";
GRANT ALL ON TABLE "public"."reports & complaints" TO "authenticated";
GRANT ALL ON TABLE "public"."reports & complaints" TO "service_role";



GRANT ALL ON TABLE "public"."settings" TO "anon";
GRANT ALL ON TABLE "public"."settings" TO "authenticated";
GRANT ALL ON TABLE "public"."settings" TO "service_role";



GRANT ALL ON TABLE "public"."stores" TO "anon";
GRANT ALL ON TABLE "public"."stores" TO "authenticated";
GRANT ALL ON TABLE "public"."stores" TO "service_role";



GRANT ALL ON TABLE "public"."withdrawals" TO "anon";
GRANT ALL ON TABLE "public"."withdrawals" TO "authenticated";
GRANT ALL ON TABLE "public"."withdrawals" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";
































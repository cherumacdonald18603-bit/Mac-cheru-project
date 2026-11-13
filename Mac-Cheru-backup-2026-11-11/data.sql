SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict uyARytxB5Nfq9O51tRXDaUepgOpWHEHnVcC0m2Iw1YMAiYSmfZ5v0h5w9hWKIfo

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") FROM stdin;
\.


--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."custom_oauth_providers" ("id", "provider_type", "identifier", "name", "client_id", "client_secret", "acceptable_client_ids", "scopes", "pkce_enabled", "attribute_mapping", "authorization_params", "enabled", "email_optional", "issuer", "discovery_url", "skip_nonce_check", "cached_discovery", "discovery_cached_at", "authorization_url", "token_url", "userinfo_url", "jwks_uri", "created_at", "updated_at", "custom_claims_allowlist") FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at", "invite_token", "referrer", "oauth_client_state_id", "linking_target_id", "email_optional") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") FROM stdin;
00000000-0000-0000-0000-000000000000	c4c69450-28cc-42be-9504-d996447434ac	authenticated	authenticated	cherumacdonald18603@gmail.com	$2a$10$RlqtREMVtxnHiAZtCkRq5.sMr9iM/SbXUqgmB.sKGXiKNuzF62/0u	2026-10-01 10:03:27.766921+00	\N		2026-10-01 10:00:28.96168+00		\N			\N	2026-11-12 12:13:32.546248+00	{"provider": "email", "providers": ["email"]}	{"sub": "c4c69450-28cc-42be-9504-d996447434ac", "email": "cherumacdonald18603@gmail.com", "email_verified": true, "phone_verified": false}	\N	2026-10-01 10:00:28.900764+00	2026-11-12 12:13:32.549345+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	55922adc-b83d-4add-af23-13af5af5393e	authenticated	authenticated	elizahwambugu096@gmail.com	$2a$10$EUdMT7OHZ2BVi0rtx6dOUuWXWnCyL2TJSurbC2tm9a1cmtjG5xPcS	2026-11-11 05:21:04.308699+00	\N		2026-11-11 05:20:37.551794+00		\N			\N	2026-11-11 05:21:44.911903+00	{"provider": "email", "providers": ["email"]}	{"sub": "55922adc-b83d-4add-af23-13af5af5393e", "role": "buyer", "email": "elizahwambugu096@gmail.com", "email_verified": true, "phone_verified": false}	\N	2026-11-11 05:20:37.521018+00	2026-11-11 05:21:44.914101+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	b63205b7-4903-4728-b1f8-bcb0dac0234e	authenticated	authenticated	keirancheruiyot@gmail.com	$2a$10$fPeXic4CZHjMMzKIn9.o/.P8LFRYkHIdAZ7fMGCWR9U7dyQYMEnvS	2026-10-02 13:25:00.808414+00	\N		2026-10-02 13:24:43.751838+00		\N			\N	2026-11-11 12:40:01.691205+00	{"provider": "email", "providers": ["email"]}	{"sub": "b63205b7-4903-4728-b1f8-bcb0dac0234e", "role": "buyer", "email": "keirancheruiyot@gmail.com", "email_verified": true, "phone_verified": false}	\N	2026-10-02 13:24:43.702982+00	2026-11-11 12:40:01.701084+00	\N	\N			\N		0	\N		\N	f	\N	f
00000000-0000-0000-0000-000000000000	4f1a06ac-c24e-4f9b-a182-452005a974a5	authenticated	authenticated	cherumacdonald@gmail.com	$2a$10$cOEAD1ydu3BAu27OH9a7puq2x0GfbGNS4eljskZ7uggZYZtz1veBi	2026-10-01 14:36:16.522894+00	\N		2026-10-01 14:35:38.545614+00		\N			\N	2026-11-11 12:42:13.213637+00	{"provider": "email", "providers": ["email"]}	{"sub": "4f1a06ac-c24e-4f9b-a182-452005a974a5", "role": "seller", "email": "cherumacdonald@gmail.com", "email_verified": true, "phone_verified": false}	\N	2026-10-01 14:35:38.488874+00	2026-11-11 14:39:18.641714+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") FROM stdin;
c4c69450-28cc-42be-9504-d996447434ac	c4c69450-28cc-42be-9504-d996447434ac	{"sub": "c4c69450-28cc-42be-9504-d996447434ac", "email": "cherumacdonald18603@gmail.com", "email_verified": true, "phone_verified": false}	email	2026-10-01 10:00:28.944951+00	2026-10-01 10:00:28.945007+00	2026-10-01 10:00:28.945007+00	bf3a73ee-3bb3-4592-892e-9eaf74fb238e
4f1a06ac-c24e-4f9b-a182-452005a974a5	4f1a06ac-c24e-4f9b-a182-452005a974a5	{"sub": "4f1a06ac-c24e-4f9b-a182-452005a974a5", "role": "seller", "email": "cherumacdonald@gmail.com", "email_verified": true, "phone_verified": false}	email	2026-10-01 14:35:38.534794+00	2026-10-01 14:35:38.534843+00	2026-10-01 14:35:38.534843+00	103a2e70-771a-4477-b1a2-1f43a8e93475
b63205b7-4903-4728-b1f8-bcb0dac0234e	b63205b7-4903-4728-b1f8-bcb0dac0234e	{"sub": "b63205b7-4903-4728-b1f8-bcb0dac0234e", "role": "buyer", "email": "keirancheruiyot@gmail.com", "email_verified": true, "phone_verified": false}	email	2026-10-02 13:24:43.740983+00	2026-10-02 13:24:43.741028+00	2026-10-02 13:24:43.741028+00	a6d91f3a-ec36-4a2e-b337-985c907c4694
55922adc-b83d-4add-af23-13af5af5393e	55922adc-b83d-4add-af23-13af5af5393e	{"sub": "55922adc-b83d-4add-af23-13af5af5393e", "role": "buyer", "email": "elizahwambugu096@gmail.com", "email_verified": true, "phone_verified": false}	email	2026-11-11 05:20:37.543444+00	2026-11-11 05:20:37.543499+00	2026-11-11 05:20:37.543499+00	e261b2dd-5176-491c-a9f7-275a7fa09525
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."instances" ("id", "uuid", "raw_base_config", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_clients" ("id", "client_secret_hash", "registration_type", "redirect_uris", "grant_types", "client_name", "client_uri", "logo_uri", "created_at", "updated_at", "deleted_at", "client_type", "token_endpoint_auth_method") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag", "oauth_client_id", "refresh_token_hmac_key", "refresh_token_counter", "scopes") FROM stdin;
d09b4a53-f951-42a5-bb5e-09754356f525	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 10:03:27.789016+00	2026-10-01 10:03:27.789016+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Mobile Safari/537.36	217.21.123.14	\N	\N	\N	\N	\N
ac992873-7784-4557-a608-1ee93c47958b	c4c69450-28cc-42be-9504-d996447434ac	2026-10-19 19:33:04.304508+00	2026-10-19 19:33:04.304508+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36	154.159.237.242	\N	\N	\N	\N	\N
b80a3bb3-e0d4-485b-85fe-a29cd9a66b3b	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 10:12:13.767456+00	2026-10-01 10:12:13.767456+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
88d7f3f3-6466-46af-8c65-46ff06b97e45	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 10:12:29.72415+00	2026-10-01 10:12:29.72415+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
70a58934-8b42-4633-80ec-334def757193	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 10:28:58.934695+00	2026-10-01 10:28:58.934695+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
edbabd4e-c8c6-4cfc-aa6d-512101e0c868	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 10:29:26.285023+00	2026-10-01 10:29:26.285023+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
bab1a278-3004-42a9-91d0-6a263b8f0d10	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 10:43:57.366681+00	2026-10-01 14:32:00.421051+00	\N	aal1	\N	2026-10-01 14:32:00.420942	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
1fb223db-8983-4d07-b19d-2a4c9a6e536b	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-01 14:36:16.527415+00	2026-10-01 14:36:16.527415+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Mobile Safari/537.36	217.21.123.14	\N	\N	\N	\N	\N
725fa976-dbb0-4240-a012-86267ac5f50d	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-01 15:05:34.196885+00	2026-10-01 15:05:34.196885+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
3ebcb427-923e-4caa-95c1-6b88feb1cefd	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 15:35:56.172018+00	2026-10-01 16:56:56.833784+00	\N	aal1	\N	2026-10-01 16:56:56.833687	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	105.161.135.192	\N	\N	\N	\N	\N
8790d6d2-03ff-4962-b9b4-d33a833899dd	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 16:57:18.24618+00	2026-10-01 16:57:18.24618+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	105.161.135.192	\N	\N	\N	\N	\N
12ab05a3-601c-4192-b717-cde6137b9606	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 17:12:07.84858+00	2026-10-01 17:12:07.84858+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	105.161.135.192	\N	\N	\N	\N	\N
ec262398-5bae-4142-b1de-4d8456fa942c	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 17:45:36.778304+00	2026-10-01 17:45:36.778304+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	105.161.135.192	\N	\N	\N	\N	\N
2e23ae4a-478b-4781-b893-a967244ee193	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 18:01:03.569232+00	2026-10-02 04:59:09.185649+00	\N	aal1	\N	2026-10-02 04:59:09.185552	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
acb1eeaa-01e4-4686-89a9-c913d85da4e5	c4c69450-28cc-42be-9504-d996447434ac	2026-10-02 04:59:24.989791+00	2026-10-02 08:19:28.706175+00	\N	aal1	\N	2026-10-02 08:19:28.706084	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
8ad00532-81ba-4d51-a94a-15a3fed1e294	c4c69450-28cc-42be-9504-d996447434ac	2026-10-19 19:33:58.171232+00	2026-10-19 19:33:58.171232+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36	154.159.237.242	\N	\N	\N	\N	\N
916b70c9-aae2-41d7-a88b-c05585bb63ae	c4c69450-28cc-42be-9504-d996447434ac	2026-10-02 08:19:32.999468+00	2026-10-02 11:25:45.680241+00	\N	aal1	\N	2026-10-02 11:25:45.680146	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
2350b235-dc0d-43f0-8ce0-5a89736873bf	c4c69450-28cc-42be-9504-d996447434ac	2026-10-02 11:26:17.207872+00	2026-10-02 12:44:33.454771+00	\N	aal1	\N	2026-10-02 12:44:33.454662	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
50b573d6-9909-4027-b283-6cce2a7ae723	c4c69450-28cc-42be-9504-d996447434ac	2026-10-02 12:45:12.397771+00	2026-10-02 12:45:12.397771+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
d512471d-51cb-44eb-a9b2-1843c63af10d	c4c69450-28cc-42be-9504-d996447434ac	2026-10-02 12:55:41.008118+00	2026-10-02 12:55:41.008118+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
42e84ec3-da29-4163-b1c1-fe5a8229534f	c4c69450-28cc-42be-9504-d996447434ac	2026-10-02 13:09:40.065963+00	2026-10-02 13:09:40.065963+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
b8f04710-38bf-4684-9c07-5bc2200af4cb	c4c69450-28cc-42be-9504-d996447434ac	2026-10-02 13:18:13.879696+00	2026-10-02 13:18:13.879696+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
98dbc0a3-2db5-4014-8723-54ca5d36ac52	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-01 14:47:09.001804+00	2026-10-02 13:20:16.042429+00	\N	aal1	\N	2026-10-02 13:20:16.042326	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36	217.21.123.14	\N	\N	\N	\N	\N
e9752531-06e4-4b2c-9e85-a9a303da0394	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 13:20:19.963982+00	2026-10-02 13:20:19.963982+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36	217.21.123.14	\N	\N	\N	\N	\N
7a456797-aa86-4b44-9603-3737ff0b063f	c4c69450-28cc-42be-9504-d996447434ac	2026-11-10 12:29:33.375941+00	2026-11-10 12:29:33.375941+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0	154.159.238.168	\N	\N	\N	\N	\N
aff9f2c7-92e8-42f6-a739-89f9fc82f773	c4c69450-28cc-42be-9504-d996447434ac	2026-10-02 13:26:25.531247+00	2026-10-02 13:26:25.531247+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
11642e0b-2032-4122-aaf8-ff6eec0038c1	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 06:36:36.238785+00	2026-11-11 06:36:36.238785+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36	154.159.237.175	\N	\N	\N	\N	\N
4cb51e8b-cc45-4333-8adb-1e1360dda7b5	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 13:28:17.06847+00	2026-10-02 13:28:17.06847+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
1dcb99cc-333b-474b-825b-3e65ce6881f7	c4c69450-28cc-42be-9504-d996447434ac	2026-10-02 13:31:52.872306+00	2026-10-02 13:31:52.872306+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
b8d5df3a-809f-4a23-84f5-6e7b3b3ce64e	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 13:57:39.794595+00	2026-10-02 13:57:39.794595+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
1ac316bf-26b3-440f-afe0-b6d276e7e5bf	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 14:11:15.510103+00	2026-10-02 14:11:15.510103+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
2a1d7c0c-34c6-4bb3-935f-c797f5417468	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 14:22:31.720231+00	2026-10-02 14:22:31.720231+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
13b6f527-404a-42a1-a062-1c20c64f3b48	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 14:39:46.013196+00	2026-10-02 14:39:46.013196+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
ad4221da-2b5b-44cf-a4bf-2a9c07a4e65d	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 14:57:34.026627+00	2026-10-02 14:57:34.026627+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
d726d3c5-fec8-4af3-bb82-1f13db4aee09	c4c69450-28cc-42be-9504-d996447434ac	2026-11-12 12:13:22.515608+00	2026-11-12 12:13:22.515608+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	197.248.162.214	\N	\N	\N	\N	\N
6f5efa03-84f2-4e3b-80cc-0d08aba8f224	c4c69450-28cc-42be-9504-d996447434ac	2026-11-12 12:13:32.546351+00	2026-11-12 12:13:32.546351+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	197.248.162.214	\N	\N	\N	\N	\N
5a3f491f-e516-44f3-8990-2e8076d639ce	c4c69450-28cc-42be-9504-d996447434ac	2026-10-02 14:57:49.450407+00	2026-10-02 14:57:49.450407+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
b5a77ef9-0242-4652-8655-4503998c15d5	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 14:59:18.223517+00	2026-10-02 14:59:18.223517+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
b1a95302-6c07-48c6-8fea-aa883a90cac7	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 15:05:29.287457+00	2026-10-02 15:05:29.287457+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
cfa28041-6456-439b-a1bd-122c7966cf3e	c4c69450-28cc-42be-9504-d996447434ac	2026-10-19 19:38:28.640372+00	2026-10-19 19:38:28.640372+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36	154.159.237.242	\N	\N	\N	\N	\N
0ddfc4ca-9fcc-4d1b-8bc1-08115fb4c232	c4c69450-28cc-42be-9504-d996447434ac	2026-11-10 13:18:16.018745+00	2026-11-10 14:43:53.413455+00	\N	aal1	\N	2026-11-10 14:43:53.413334	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0	154.159.252.112	\N	\N	\N	\N	\N
fd0d4510-716f-49c5-a7ab-b9ce98eb1fc4	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 15:47:53.566602+00	2026-10-02 15:47:53.566602+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
7cc04f1f-ea99-43ff-ba5a-3c93d9f89247	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 15:52:05.256246+00	2026-10-02 15:52:05.256246+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
eac8ce35-f811-4381-b33e-1d2818008601	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 15:55:01.770867+00	2026-10-02 15:55:01.770867+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
fb06cd9f-2590-41e6-96a6-75fe9d3b809d	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-02 15:55:32.213625+00	2026-10-03 08:36:28.350167+00	\N	aal1	\N	2026-10-03 08:36:28.350066	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
80e7fb92-a4b9-4181-b90a-5264a4233f89	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-03 08:36:48.531809+00	2026-10-03 08:36:48.531809+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
f2c3b864-78a5-4020-b871-961158cd0cba	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 06:36:36.245301+00	2026-11-11 06:36:36.245301+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36	154.159.237.175	\N	\N	\N	\N	\N
a1dc30de-6d58-47df-961c-744714bd3733	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-03 09:06:48.765017+00	2026-10-03 09:06:48.765017+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
9b836567-48c5-4769-8152-ec5d32492dc2	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 06:37:32.776093+00	2026-11-11 06:37:32.776093+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	154.159.237.175	\N	\N	\N	\N	\N
7976d2b8-e808-4b73-b737-9883a56e48bb	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 06:37:44.356255+00	2026-11-11 06:37:44.356255+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	154.159.237.175	\N	\N	\N	\N	\N
f6e5ba86-1a31-4605-85e2-41d8c49ee560	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-03 09:18:35.580362+00	2026-10-03 09:18:35.580362+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
e3e3349f-adff-4700-94ae-bdeeb2680b39	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-11-10 12:30:23.855091+00	2026-11-11 06:38:22.384904+00	\N	aal1	\N	2026-11-11 06:38:22.384819	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0	154.159.237.175	\N	\N	\N	\N	\N
1d5d0c0a-3674-405b-8b2c-ad55c393ab65	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 09:41:13.98491+00	2026-10-03 09:41:13.98491+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
5a7f5ff9-838e-4cc2-8a45-7fe717e42f4d	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 10:05:57.590676+00	2026-10-03 10:05:57.590676+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
492818ea-e719-4d86-aa85-09c22704202d	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 10:13:27.459204+00	2026-10-03 10:13:27.459204+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
ae167278-7876-461d-92dd-58bcdf3e0ab6	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 10:19:57.099364+00	2026-10-03 10:19:57.099364+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
0fa0492d-4ae0-4ce5-bbfb-c6c266f619ba	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 06:38:27.043134+00	2026-11-11 06:38:27.043134+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0	154.159.237.175	\N	\N	\N	\N	\N
ab1feeb4-c09b-49f8-8910-7cdafe7b4d0c	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-03 10:30:25.24924+00	2026-10-03 10:30:25.24924+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
beda3b1b-83a8-4dd1-9326-113bbc4280e6	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-03 10:31:24.959078+00	2026-10-03 10:31:24.959078+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
6a4d429e-a8da-4ce1-b3f7-151ff696c98b	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 10:32:04.597195+00	2026-10-03 10:32:04.597195+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
80cda575-42dd-4764-8326-3912c146ee65	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-03 11:08:26.650221+00	2026-10-03 11:08:26.650221+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
2b1e80ee-5dd9-447c-80c5-6bc3ca983d89	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-03 11:10:08.186369+00	2026-10-03 11:10:08.186369+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
31305d80-4e13-46c9-82ef-40ec070be83d	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 11:10:49.956987+00	2026-10-03 11:10:49.956987+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
cdbb30e8-39fa-4680-9c70-803a137924f3	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 11:25:55.034+00	2026-10-03 11:25:55.034+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
74539d49-ac4d-425a-87ca-a013bf9956b7	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 11:43:14.384965+00	2026-10-03 11:43:14.384965+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
326eb931-3b23-4161-aae8-9b79189c0ccc	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 11:49:11.493248+00	2026-10-03 11:49:11.493248+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
20c6b2e4-efa4-4872-a278-5ff45b957f68	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 11:52:32.047699+00	2026-10-03 11:52:32.047699+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
d1c3e14e-557b-46a3-b917-e448806a9e31	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-03 12:08:44.164574+00	2026-10-03 12:08:44.164574+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
b648d219-42d2-4df7-84cc-2f3093a25194	c4c69450-28cc-42be-9504-d996447434ac	2026-11-10 14:56:21.112284+00	2026-11-10 17:36:23.707852+00	\N	aal1	\N	2026-11-10 17:36:23.70777	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36	154.159.252.112	\N	\N	\N	\N	\N
d7f8dcf3-5390-492e-8a43-205cb0891dd9	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-03 12:20:51.305826+00	2026-10-03 12:20:51.305826+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
0fc1a666-5b89-4225-bba2-4e0f3fad6f84	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 06:46:23.783154+00	2026-11-11 06:46:23.783154+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	154.159.237.175	\N	\N	\N	\N	\N
afa17a86-39f4-4e8a-ad45-2a45bb12b133	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 12:31:20.553248+00	2026-10-03 13:35:15.602769+00	\N	aal1	\N	2026-10-03 13:35:15.602683	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
e641a462-d895-4e7b-8abc-c1f4281f345d	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 06:46:38.020495+00	2026-11-11 12:38:15.657569+00	\N	aal1	\N	2026-11-11 12:38:15.657482	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	196.96.235.248	\N	\N	\N	\N	\N
330665d1-1cbf-427d-851b-5de42bc3d269	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 14:17:54.335614+00	2026-10-03 14:17:54.335614+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
0f21f9ab-09b6-46f4-951f-e97324f7229b	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 14:33:03.113819+00	2026-10-03 14:33:03.113819+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
4ad2dd70-c6c1-4c6e-b51c-bef57ec6ded3	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 14:33:43.626577+00	2026-10-03 14:33:43.626577+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
ea0cb053-3991-47e3-abe3-4fccea468f8e	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 14:41:16.243926+00	2026-10-03 14:41:16.243926+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
f47b48d0-0d47-4d5a-8a72-766e7778a22b	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 14:41:39.625055+00	2026-10-03 14:41:39.625055+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
b40e60aa-074b-410b-96bd-bc88e6fe2bba	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 14:42:26.623838+00	2026-10-03 14:42:26.623838+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
8fe078c7-7f81-4d6e-8b86-b27199ddd597	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 14:44:52.499148+00	2026-10-03 14:44:52.499148+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
832d8f56-dd1a-46bb-9ee4-1589347029fa	c4c69450-28cc-42be-9504-d996447434ac	2026-10-03 14:46:15.256427+00	2026-10-03 17:24:30.448619+00	\N	aal1	\N	2026-10-03 17:24:30.448526	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
9113de67-7b4a-4562-a135-5751e7a91b8b	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 12:25:28.470031+00	2026-10-04 12:25:28.470031+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
5f807f02-16c1-439b-9094-32d7e1443bae	c4c69450-28cc-42be-9504-d996447434ac	2026-10-04 12:50:54.614642+00	2026-10-04 12:50:54.614642+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
1a5f323c-3b32-4f5d-808e-0d3bb4a9e949	c4c69450-28cc-42be-9504-d996447434ac	2026-11-10 17:01:30.608464+00	2026-11-10 17:01:30.608464+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	154.159.252.112	\N	\N	\N	\N	\N
001e65ea-d5d5-4464-8b19-9bccffddddeb	c4c69450-28cc-42be-9504-d996447434ac	2026-11-10 17:01:33.465321+00	2026-11-10 17:01:33.465321+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	154.159.252.112	\N	\N	\N	\N	\N
7f8b3c80-313a-4262-a710-45062f8f3815	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 12:38:21.749475+00	2026-11-11 12:38:21.749475+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	196.96.235.248	\N	\N	\N	\N	\N
9619c98e-451f-4eef-b00d-62acb991f641	c4c69450-28cc-42be-9504-d996447434ac	2026-10-04 14:12:11.189174+00	2026-10-04 14:12:11.189174+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
99ebf234-20f4-4609-8052-cf11b2f13686	c4c69450-28cc-42be-9504-d996447434ac	2026-10-04 14:17:42.196835+00	2026-10-04 14:17:42.196835+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
20fbc2aa-a99f-406d-a1e8-32c3bad10704	c4c69450-28cc-42be-9504-d996447434ac	2026-10-04 14:17:57.865248+00	2026-10-04 14:17:57.865248+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
aa6c33a3-e06d-4f37-9de8-aa561ceb6544	c4c69450-28cc-42be-9504-d996447434ac	2026-10-04 14:18:44.031783+00	2026-10-04 14:18:44.031783+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
549e310f-721e-489c-9218-eb655f145f13	c4c69450-28cc-42be-9504-d996447434ac	2026-10-04 14:19:46.157343+00	2026-10-04 14:19:46.157343+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
85410700-193e-423d-b792-86b00a7a6ba2	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 14:36:59.05605+00	2026-10-04 14:36:59.05605+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
82c506c6-88d8-465c-b086-595c87f5cea7	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 14:37:09.315761+00	2026-10-04 14:37:09.315761+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
eae2cced-5d3d-43c8-abb7-71d0f146577d	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 14:42:08.265028+00	2026-10-04 14:42:08.265028+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
5d2556b2-96cb-4f24-8067-8dbd43f0530b	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 14:50:15.444033+00	2026-10-04 14:50:15.444033+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
729fa231-cc2c-4783-a70a-02e6a854dba0	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 15:02:18.501375+00	2026-10-04 15:02:18.501375+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
f8f4d2b5-4cdb-4fb2-bb8f-94bb804fc47e	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 15:02:31.16677+00	2026-10-04 15:02:31.16677+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
568437b1-7d6f-40bd-acc0-82087a75d01a	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 15:02:52.561166+00	2026-10-04 15:02:52.561166+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
26994e7e-d9f4-47c7-b77f-7108f0457826	c4c69450-28cc-42be-9504-d996447434ac	2026-10-04 15:03:30.153416+00	2026-10-04 15:03:30.153416+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
8c42e873-9a26-4d58-a61a-3127fb569881	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 15:15:13.79241+00	2026-10-04 15:15:13.79241+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
67070928-72e5-4809-bb4e-ebd3074a41ed	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 15:15:57.566026+00	2026-10-04 15:15:57.566026+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
7ac06bf4-b5ed-49c3-9143-33100491fac5	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 15:20:49.804976+00	2026-10-04 15:20:49.804976+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
7da5ddc2-d6e6-41fa-becd-feaad7894f9d	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 15:21:06.893703+00	2026-10-04 15:21:06.893703+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
09f11da7-875d-4432-861f-8092d3ecb0b8	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 15:36:29.163735+00	2026-10-04 15:36:29.163735+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
4570c472-c181-41ae-a037-19337ae83385	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 15:45:39.884368+00	2026-10-04 15:45:39.884368+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
1bddb0b2-12fe-4e5f-b73a-78b9d056f6b0	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 16:05:25.459273+00	2026-10-04 16:05:25.459273+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
9f6e4c46-d1b4-4b98-9f2f-774a835f5daa	c4c69450-28cc-42be-9504-d996447434ac	2026-10-04 16:28:49.082856+00	2026-10-04 16:28:49.082856+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
5bbc6824-73b6-4ae3-a356-556bdaa53516	c4c69450-28cc-42be-9504-d996447434ac	2026-10-04 17:18:01.060899+00	2026-10-04 17:18:01.060899+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
cced56a7-58cf-4dd0-b3a2-60d90653854e	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-04 17:18:25.242639+00	2026-10-04 17:18:25.242639+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
cabba20f-5329-4da4-981f-76bfb3f883b5	c4c69450-28cc-42be-9504-d996447434ac	2026-10-05 04:34:41.975163+00	2026-10-05 04:34:41.975163+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
b2fe3032-3d3c-45d1-8a4a-eead94a8cb59	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-05 04:39:43.460151+00	2026-10-05 04:39:43.460151+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
dfcd9080-c014-48e8-a1db-360c92cdfaf8	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-05 05:15:39.89959+00	2026-10-05 05:15:39.89959+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
e52aec42-67b4-4db5-9d46-3fa07842ecec	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-11-10 17:06:15.133101+00	2026-11-10 17:06:15.133101+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0	154.159.252.112	\N	\N	\N	\N	\N
d7ae4270-6b90-4f43-a594-33d7435d6603	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-05 05:17:02.038927+00	2026-10-05 05:17:02.038927+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
ca3244ec-e10e-4a91-9729-51d72b745a01	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 12:39:45.237436+00	2026-11-11 12:39:45.237436+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	196.96.235.248	\N	\N	\N	\N	\N
25321602-17e4-4289-9a92-d25403e3d452	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 06:38:25.527346+00	2026-10-06 06:38:25.527346+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
e5458796-ba2b-45df-89f0-f9784374bf5e	c4c69450-28cc-42be-9504-d996447434ac	2026-10-05 05:17:25.708625+00	2026-10-05 08:12:46.166259+00	\N	aal1	\N	2026-10-05 08:12:46.166159	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	197.248.162.214	\N	\N	\N	\N	\N
6b759e5f-9fb8-45d3-a317-07b1d9b497e7	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-05 08:14:49.098838+00	2026-10-05 08:14:49.098838+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	197.248.162.214	\N	\N	\N	\N	\N
b231d35a-6002-422c-8466-1e323df1da5e	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-11-11 12:42:13.214537+00	2026-11-11 14:39:18.667056+00	\N	aal1	\N	2026-11-11 14:39:18.666965	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	196.96.234.109	\N	\N	\N	\N	\N
68b2e11f-93bb-431a-8f1e-bcf99ee7df94	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-05 08:22:59.967818+00	2026-10-05 08:22:59.967818+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	197.248.162.214	\N	\N	\N	\N	\N
94cc688a-9a56-45be-b442-a4867ace16da	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-05 08:23:33.933471+00	2026-10-05 08:23:33.933471+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	197.248.162.214	\N	\N	\N	\N	\N
3314b28b-4dbf-46de-8339-d40ea6b6a7ef	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-05 08:25:48.820509+00	2026-10-05 08:25:48.820509+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	197.248.162.214	\N	\N	\N	\N	\N
3d0d5200-dcb1-4fed-b959-3009fcf8eda3	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-05 08:35:25.102345+00	2026-10-05 08:35:25.102345+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	197.248.162.214	\N	\N	\N	\N	\N
bdbbe16f-14a5-4d9e-9537-c67940c77436	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-05 08:36:59.349395+00	2026-10-05 08:36:59.349395+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	197.248.162.214	\N	\N	\N	\N	\N
8655c5ac-372e-4514-bbd1-57f859a1e3f6	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-05 08:38:07.292812+00	2026-10-05 08:38:07.292812+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	197.248.162.214	\N	\N	\N	\N	\N
a168e756-c665-45c1-8887-f7d120de6cba	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-05 08:38:35.365117+00	2026-10-05 08:38:35.365117+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	197.248.162.214	\N	\N	\N	\N	\N
8b074cbe-bf1e-40bd-a580-968939ee7b2a	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 06:24:49.125679+00	2026-10-06 06:24:49.125679+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
5aa2cd3d-e57c-4fa8-8087-9d6bd8048413	c4c69450-28cc-42be-9504-d996447434ac	2026-10-06 06:26:47.664783+00	2026-10-06 06:26:47.664783+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
776cec92-66eb-453b-b3f6-6e0be8280b34	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 06:27:24.211985+00	2026-10-06 06:27:24.211985+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
382525eb-2410-405c-b3b1-0430a2a04171	c4c69450-28cc-42be-9504-d996447434ac	2026-10-06 06:30:41.469667+00	2026-10-06 06:30:41.469667+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
e31abfbc-2d91-4972-a0b8-4b0c56bc0cb3	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 06:31:33.275593+00	2026-10-06 06:31:33.275593+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
58f04d13-7dc9-484f-999b-48f27fe217a9	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 06:35:38.967657+00	2026-10-06 06:35:38.967657+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
ede92149-0c8c-4c88-bee7-bbe7f7522804	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 06:55:12.879657+00	2026-10-06 06:55:12.879657+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
31c3ee89-925d-4089-9851-a70f4aa9fb61	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 06:58:20.53783+00	2026-10-06 06:58:20.53783+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
77994cad-76f4-44e8-b6c2-c0e20f582962	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 07:09:21.944143+00	2026-10-06 07:09:21.944143+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
55b708f3-40dd-465a-aa7f-5526398ee7ed	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 07:09:36.527168+00	2026-10-06 07:09:36.527168+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
e35d5324-8b82-4880-b238-8ece0555005c	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 07:19:50.236603+00	2026-10-06 07:19:50.236603+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
93b5ca69-d2cc-436e-8328-2010f8e566d0	c4c69450-28cc-42be-9504-d996447434ac	2026-11-10 17:11:30.122535+00	2026-11-10 17:11:30.122535+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	154.159.252.112	\N	\N	\N	\N	\N
630f9b48-9e80-44dc-bc1e-17cec65c1901	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 07:35:53.462168+00	2026-10-06 07:35:53.462168+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
84d2ddd5-9e6c-4a1e-bb24-9456296161ad	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 07:35:53.460279+00	2026-10-06 07:35:53.460279+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
83a65ae7-53c5-4b1f-9c31-94321c4869c7	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 07:35:53.472236+00	2026-10-06 07:35:53.472236+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
eddafa2f-81ac-4806-9515-624fe086384f	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 07:35:53.469709+00	2026-10-06 07:35:53.469709+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
78ae9374-87fb-49ce-bcd6-dc76cb3ef781	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 14:39:37.722853+00	2026-11-11 17:11:50.310885+00	\N	aal1	\N	2026-11-11 17:11:50.310785	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	196.96.233.70	\N	\N	\N	\N	\N
b9143f7e-a644-4f73-a45e-8d4dfd736e6a	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 08:26:33.851266+00	2026-10-06 08:26:33.851266+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
ec9ac37e-4c8c-4c3d-950f-53ca0a4a8448	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-06 08:26:50.022412+00	2026-10-06 08:26:50.022412+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
71b60e40-665f-4e14-988e-7f2b75f771c4	c4c69450-28cc-42be-9504-d996447434ac	2026-10-01 10:05:55.999605+00	2026-10-08 07:21:25.181102+00	\N	aal1	\N	2026-10-08 07:21:25.181008	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36	41.203.213.5	\N	\N	\N	\N	\N
52fda7cc-edff-4e8f-944b-019238f8948b	c4c69450-28cc-42be-9504-d996447434ac	2026-10-08 07:21:39.179532+00	2026-10-08 07:21:39.179532+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36	41.203.213.5	\N	\N	\N	\N	\N
6c08c2df-5a5f-476f-a098-de6f0786e3f6	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-08 07:22:38.679724+00	2026-10-08 07:22:38.679724+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36	41.203.213.5	\N	\N	\N	\N	\N
281e2147-79b1-41f1-9b7f-698b8539dced	c4c69450-28cc-42be-9504-d996447434ac	2026-10-06 08:28:01.596764+00	2026-10-08 07:32:59.56838+00	\N	aal1	\N	2026-10-08 07:32:59.568291	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
a4c910a7-b1d7-45f8-b6d1-1d9ea6268cc9	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 00:42:30.794619+00	2026-10-09 00:42:30.794619+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
f698bc02-62b2-427f-b404-ceac702c6ae7	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 00:42:45.80971+00	2026-10-09 00:42:45.80971+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
6f53b655-7386-48ea-8470-129d0628b635	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 00:43:08.833698+00	2026-10-09 00:43:08.833698+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
86b6251d-c28d-4b9b-acdb-af942f2f0225	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 00:44:05.819829+00	2026-10-09 00:44:05.819829+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
9e13db4f-d8c6-490b-99d5-b61a35b3b537	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 01:08:34.753278+00	2026-10-09 01:08:34.753278+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
a0eb411d-1fa6-42c3-bc5e-ff2b92a5e760	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 01:14:17.971577+00	2026-10-09 01:14:17.971577+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
2abeb091-5f53-4944-b3e3-e50714c18968	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 01:22:26.49556+00	2026-10-09 01:22:26.49556+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
822b05da-838c-429b-a28b-f07140ff8de8	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 01:39:54.345611+00	2026-10-09 01:39:54.345611+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
47530875-9fef-4b02-b0d9-25e5b288be2b	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 01:52:58.106073+00	2026-10-09 01:52:58.106073+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
9c43fc60-03e5-4b11-b20a-939c1afc3243	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:00:47.675524+00	2026-10-09 02:00:47.675524+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
723973a5-51e9-43c6-9d75-86937a7f0929	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:07:29.476617+00	2026-10-09 02:07:29.476617+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
2d494578-53b4-4598-98a8-dd8afb819cea	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:15:12.888456+00	2026-10-09 02:15:12.888456+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
d24d0d05-4e58-4b28-acf4-f10d060b26c0	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:15:24.344429+00	2026-10-09 02:15:24.344429+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
f7e895a4-14c6-4e94-919a-2c74cf0f9772	c4c69450-28cc-42be-9504-d996447434ac	2026-11-10 17:35:53.230168+00	2026-11-11 04:24:10.563794+00	\N	aal1	\N	2026-11-11 04:24:10.563703	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	154.159.252.112	\N	\N	\N	\N	\N
c3a0b8d9-3055-486f-9ab5-cb5f4b184048	c4c69450-28cc-42be-9504-d996447434ac	2026-11-10 17:36:26.433736+00	2026-11-11 06:33:40.200997+00	\N	aal1	\N	2026-11-11 06:33:40.200868	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36	154.159.237.175	\N	\N	\N	\N	\N
36d33bbe-d986-4c49-8d57-005684a4f5c1	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:16:31.286961+00	2026-10-09 02:16:31.286961+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
80b020ff-081b-481b-93ea-11dd2cc30afc	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:16:45.78438+00	2026-10-09 02:16:45.78438+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
1d0b1b82-e112-40da-8faa-1865baf14ceb	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:17:08.586564+00	2026-10-09 02:17:08.586564+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
17146ab2-ae18-4d31-b9f1-9d4f5ae0e7f3	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:17:26.055125+00	2026-10-09 02:17:26.055125+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
52475bd3-7f7e-4e1d-b26d-f722da09d7d4	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:24:34.869305+00	2026-10-09 02:24:34.869305+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
5b811826-0e8a-4af8-9dfa-e4cb9472ed77	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:29:04.454429+00	2026-10-09 02:29:04.454429+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
95ebc9b9-6357-4c9d-8dbf-5c09e335e82d	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:34:01.660578+00	2026-10-09 02:34:01.660578+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
8f8dff8b-6461-4639-8cbc-1adef1309bba	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:35:12.165035+00	2026-10-09 02:35:12.165035+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
09059048-ae1b-4ab3-a96a-35d3623cabb3	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:36:11.671144+00	2026-10-09 02:36:11.671144+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
9ade7d36-d2e8-4189-af4d-37cbcc5ec210	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 02:36:24.993062+00	2026-10-09 02:36:24.993062+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
1ec6d22a-0831-43e5-a132-40049a31608b	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 17:11:54.371772+00	2026-11-12 05:10:14.790383+00	\N	aal1	\N	2026-11-12 05:10:14.790258	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	196.96.233.46	\N	\N	\N	\N	\N
7b471fa9-93e6-41ae-8a68-c24dbbce5d92	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 02:37:57.702298+00	2026-10-09 02:37:57.702298+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
9d65a986-36d4-41fa-bb85-22990074d2bf	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 02:48:41.754875+00	2026-10-09 02:48:41.754875+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
cba073f6-2a06-490f-9c15-d4c429a2b143	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 02:54:33.447958+00	2026-10-09 02:54:33.447958+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
be765b0a-d140-4f3c-8601-cfd3cea2dd1d	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 02:57:55.821202+00	2026-10-09 02:57:55.821202+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
55323181-75f1-4c55-addc-70c059727d6c	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 03:06:28.010886+00	2026-10-09 03:06:28.010886+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
c88151f2-6df2-4012-93db-c6b0739558a2	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 03:11:38.671096+00	2026-10-09 03:11:38.671096+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.81	\N	\N	\N	\N	\N
70fbbcc4-e82c-4c28-9559-377f46574411	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 03:34:53.962029+00	2026-10-09 05:35:47.205023+00	\N	aal1	\N	2026-10-09 05:35:47.204948	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.223	\N	\N	\N	\N	\N
33cc5a9a-5c45-423c-a083-3b5b4724485d	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 05:36:15.797533+00	2026-10-09 05:36:15.797533+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.223	\N	\N	\N	\N	\N
15a16863-5c6c-40b8-b56b-e7099529b009	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 05:37:47.910329+00	2026-10-09 05:37:47.910329+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.223	\N	\N	\N	\N	\N
3030d61c-8b04-4512-92fd-a736c1578b07	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 05:42:21.076108+00	2026-10-09 05:42:21.076108+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.223	\N	\N	\N	\N	\N
eb1dc3f7-4c2d-4d84-8058-1ca8f15658df	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 05:47:40.511627+00	2026-10-09 05:47:40.511627+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.223	\N	\N	\N	\N	\N
8a913bdc-b155-45d5-a071-d9af21a8e405	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 05:19:18.322932+00	2026-11-11 05:19:18.322932+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	154.159.252.112	\N	\N	\N	\N	\N
7707aeb5-3b48-4fb8-a88f-ec2f96d6a1bd	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 05:19:20.560483+00	2026-11-11 05:19:20.560483+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	154.159.252.112	\N	\N	\N	\N	\N
43010dc1-8f51-4642-9301-afc68bc037bc	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 05:54:37.260615+00	2026-10-09 05:54:37.260615+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	154.159.237.223	\N	\N	\N	\N	\N
1c49526f-9140-43cc-b5c0-94a201d63091	55922adc-b83d-4add-af23-13af5af5393e	2026-11-11 05:21:04.313327+00	2026-11-11 05:21:04.313327+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/30.0 Chrome/143.0.0.0 Mobile Safari/537.36	197.248.162.214	\N	\N	\N	\N	\N
9d9e5540-9752-4d65-85be-347f9eb1f677	55922adc-b83d-4add-af23-13af5af5393e	2026-11-11 05:21:44.911987+00	2026-11-11 05:21:44.911987+00	\N	aal1	\N	\N	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/30.0 Chrome/143.0.0.0 Mobile Safari/537.36	197.248.162.214	\N	\N	\N	\N	\N
3453bc56-9c8f-4bed-a748-f8fa75e04878	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 07:24:31.799531+00	2026-10-09 07:24:31.799531+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
2eded737-d339-45ad-89a2-2bdbe1f4bfec	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 07:24:41.91425+00	2026-10-09 07:24:41.91425+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
6672c9b3-3dcb-48b4-a421-d4f27c1e1c6a	c4c69450-28cc-42be-9504-d996447434ac	2026-11-12 05:10:17.141097+00	2026-11-12 09:28:15.852003+00	\N	aal1	\N	2026-11-12 09:28:15.851896	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	196.96.232.230	\N	\N	\N	\N	\N
1a6650cb-4c0c-4359-814a-796d84cc53da	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 09:33:51.28315+00	2026-10-09 09:33:51.28315+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
ac0e8157-dc8a-46e3-aa2d-82cfa7b00838	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 09:59:22.769925+00	2026-10-09 09:59:22.769925+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
604d2f9a-b216-4d7e-ba86-d1dec751291d	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 09:59:43.161225+00	2026-10-09 09:59:43.161225+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
c8ec3d73-1359-4336-8507-ccb8a6d086a9	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 09:59:45.399242+00	2026-10-09 09:59:45.399242+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
4d9afe23-bfb0-467d-b8a5-0ee9bdbf38d4	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 09:59:45.40579+00	2026-10-09 09:59:45.40579+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
e1e08d92-3b0c-4145-81fb-b38480e2dab3	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 09:59:45.870692+00	2026-10-09 09:59:45.870692+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
5560f5c5-860b-4096-a155-53ad7dc3bdd9	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 09:59:45.882381+00	2026-10-09 09:59:45.882381+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
70f311ab-9418-4aa4-8955-ea2f3db9608d	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 10:00:01.179935+00	2026-10-09 10:00:01.179935+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
7d0edeec-bee8-4ee7-86fd-47e94617ea7b	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 10:37:21.688003+00	2026-10-09 10:37:21.688003+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
c5343cf4-e771-45ec-877a-f84f3d1f3173	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 10:40:51.002842+00	2026-10-09 10:40:51.002842+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
e2d67019-8c79-4e05-9460-97f2229d1466	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 11:30:27.673749+00	2026-10-09 11:30:27.673749+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
740744d2-1f14-4099-a8f3-d90136c50705	c4c69450-28cc-42be-9504-d996447434ac	2026-11-11 06:33:57.938795+00	2026-11-11 06:33:57.938795+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36	154.159.237.175	\N	\N	\N	\N	\N
21cf489a-e712-4784-aa72-9adf0b190e26	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 11:45:08.119944+00	2026-10-09 11:45:08.119944+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
5d7bce46-dc4d-4519-9c10-b1e25f216dbc	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 12:16:02.932894+00	2026-10-09 12:16:02.932894+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
82f8fe17-d275-41e3-a2a4-e15dcf529a61	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 12:16:03.757207+00	2026-10-09 12:16:03.757207+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
545c700d-26f9-4421-b1e5-292e422a4c68	c4c69450-28cc-42be-9504-d996447434ac	2026-11-12 09:28:18.14609+00	2026-11-12 12:12:42.942988+00	\N	aal1	\N	2026-11-12 12:12:42.942838	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Mobile Safari/537.36	197.248.162.214	\N	\N	\N	\N	\N
55762370-4454-491e-8322-5d84dd513856	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 12:17:28.589182+00	2026-10-09 12:17:28.589182+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
be9ba2f9-2de5-4c32-bb1e-9e41c8e48e00	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 12:47:18.224425+00	2026-10-09 12:47:18.224425+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
c5800cf5-548b-48bf-a2aa-79af2724565a	c4c69450-28cc-42be-9504-d996447434ac	2026-10-09 12:53:13.759099+00	2026-10-09 12:53:13.759099+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
fa1e8932-8d4a-47df-b3c2-58707186ab65	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-09 12:55:27.570157+00	2026-10-09 12:55:27.570157+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	217.21.123.14	\N	\N	\N	\N	\N
3188f819-6911-4316-b778-ca9c2228fe5a	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 08:48:20.776112+00	2026-10-10 08:48:20.776112+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
e84a3ef7-f56a-4f6b-a26f-ee32a4500f18	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 08:49:20.902141+00	2026-10-10 08:49:20.902141+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
ef49e121-f829-47e2-83a9-ef525f744d66	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 09:05:36.916322+00	2026-10-10 09:05:36.916322+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
ef5ef78d-fb3e-41bc-b958-485254354c13	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 09:18:14.275979+00	2026-10-10 09:18:14.275979+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
75897a10-d028-42ec-9687-6f3e6c9ef9e9	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 09:21:36.682948+00	2026-10-10 09:21:36.682948+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
2f86ab72-c08b-467b-a58d-1c826dc40d9f	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 09:28:52.186564+00	2026-10-10 09:28:52.186564+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
6379a083-1fcc-4be4-a384-0cbb31367a74	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 09:41:17.775897+00	2026-10-10 09:41:17.775897+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
d2501c94-cc86-4c8c-a6d8-bc785da7b821	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 09:49:43.085895+00	2026-10-10 09:49:43.085895+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
6885cb11-5cad-4026-82d3-5d716f30f95a	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 10:18:21.553611+00	2026-10-10 10:18:21.553611+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
8692aae5-bf7a-45e7-bf17-686b9bf02390	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 10:41:45.200324+00	2026-10-10 10:41:45.200324+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
baac4fb3-cd4b-4f78-a166-5bfc9e9ea2af	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 10:41:46.133177+00	2026-10-10 10:41:46.133177+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
71952066-686c-4e79-9a26-d519b328c62a	c4c69450-28cc-42be-9504-d996447434ac	2026-10-10 10:52:52.993093+00	2026-10-12 09:59:17.901956+00	\N	aal1	\N	2026-10-12 09:59:17.901866	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
29c2f637-b821-421c-87a9-89e160b0b765	c4c69450-28cc-42be-9504-d996447434ac	2026-10-12 09:59:18.303787+00	2026-10-12 09:59:18.303787+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
0efed4e5-d669-40bf-84bd-0a839702e94f	c4c69450-28cc-42be-9504-d996447434ac	2026-10-12 10:04:08.240745+00	2026-10-12 10:04:08.240745+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
083dc0f8-ab95-41e5-adb9-2ad0a6a2a7d3	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-12 10:06:45.612675+00	2026-10-12 10:06:45.612675+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
1cfb3f9e-de00-4c88-b141-f8853ba74a63	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-12 10:07:01.530308+00	2026-10-12 10:07:01.530308+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0	41.203.213.5	\N	\N	\N	\N	\N
62447468-8207-4084-b2d4-46c4c700cf62	c4c69450-28cc-42be-9504-d996447434ac	2026-10-19 08:51:35.099442+00	2026-10-19 08:51:35.099442+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0	197.248.162.214	\N	\N	\N	\N	\N
ea669ab5-61de-432d-b4f5-2d552075d50f	4f1a06ac-c24e-4f9b-a182-452005a974a5	2026-10-19 08:55:42.331682+00	2026-10-19 08:55:42.331682+00	\N	aal1	\N	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0	197.248.162.214	\N	\N	\N	\N	\N
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") FROM stdin;
d09b4a53-f951-42a5-bb5e-09754356f525	2026-10-01 10:03:27.825682+00	2026-10-01 10:03:27.825682+00	otp	5037a707-3782-4285-bde3-2d68106bb108
71b60e40-665f-4e14-988e-7f2b75f771c4	2026-10-01 10:05:56.006638+00	2026-10-01 10:05:56.006638+00	password	ee19b462-ae92-428b-bab7-a2a9c047b617
b80a3bb3-e0d4-485b-85fe-a29cd9a66b3b	2026-10-01 10:12:13.771689+00	2026-10-01 10:12:13.771689+00	password	8adb5252-4c0a-4f7a-8ebd-c12687f9bb11
88d7f3f3-6466-46af-8c65-46ff06b97e45	2026-10-01 10:12:29.726739+00	2026-10-01 10:12:29.726739+00	password	71c0eef4-9404-4416-849b-07a31fd30d1d
70a58934-8b42-4633-80ec-334def757193	2026-10-01 10:28:58.946168+00	2026-10-01 10:28:58.946168+00	password	1349dcd2-e42c-4f6c-bc0b-55ff3bd24939
edbabd4e-c8c6-4cfc-aa6d-512101e0c868	2026-10-01 10:29:26.289749+00	2026-10-01 10:29:26.289749+00	password	964e8330-ceb7-4214-8e97-445990e11f84
bab1a278-3004-42a9-91d0-6a263b8f0d10	2026-10-01 10:43:57.382772+00	2026-10-01 10:43:57.382772+00	password	5999ee69-75e1-46cf-8e32-c842664f619e
1fb223db-8983-4d07-b19d-2a4c9a6e536b	2026-10-01 14:36:16.535662+00	2026-10-01 14:36:16.535662+00	otp	f8ea2e28-c347-45d1-81a6-b4e137d7ae9e
98dbc0a3-2db5-4014-8723-54ca5d36ac52	2026-10-01 14:47:09.034703+00	2026-10-01 14:47:09.034703+00	password	64f6925a-c4ed-49de-9f7e-1406e9ef6423
725fa976-dbb0-4240-a012-86267ac5f50d	2026-10-01 15:05:34.218454+00	2026-10-01 15:05:34.218454+00	password	3e98bed5-c109-4f84-8d43-0d88a69d92ad
3ebcb427-923e-4caa-95c1-6b88feb1cefd	2026-10-01 15:35:56.189171+00	2026-10-01 15:35:56.189171+00	password	98d2fd66-e165-4950-8846-dba88cc75735
8790d6d2-03ff-4962-b9b4-d33a833899dd	2026-10-01 16:57:18.257799+00	2026-10-01 16:57:18.257799+00	password	26736636-590f-4138-91b0-1f4aa23a3e04
12ab05a3-601c-4192-b717-cde6137b9606	2026-10-01 17:12:07.862722+00	2026-10-01 17:12:07.862722+00	password	38735cc5-25e9-4a7f-81b6-b82ad3389b7b
ec262398-5bae-4142-b1de-4d8456fa942c	2026-10-01 17:45:36.845626+00	2026-10-01 17:45:36.845626+00	password	3e9aca86-f73f-4520-a97c-b0f10577495c
2e23ae4a-478b-4781-b893-a967244ee193	2026-10-01 18:01:03.586139+00	2026-10-01 18:01:03.586139+00	password	8a95e84e-56a8-4e78-b6bf-aa062857e66b
acb1eeaa-01e4-4686-89a9-c913d85da4e5	2026-10-02 04:59:25.009684+00	2026-10-02 04:59:25.009684+00	password	46d64833-1df2-4793-b89c-0755202d0b1f
916b70c9-aae2-41d7-a88b-c05585bb63ae	2026-10-02 08:19:33.01355+00	2026-10-02 08:19:33.01355+00	password	e7837746-f7bf-400c-b58c-fca11baf2748
2350b235-dc0d-43f0-8ce0-5a89736873bf	2026-10-02 11:26:17.231349+00	2026-10-02 11:26:17.231349+00	password	1a598db4-7969-4aee-bc28-02f356f07e66
50b573d6-9909-4027-b283-6cce2a7ae723	2026-10-02 12:45:12.407431+00	2026-10-02 12:45:12.407431+00	password	43e9f354-b5a2-407b-a110-d24ff6cbaf55
d512471d-51cb-44eb-a9b2-1843c63af10d	2026-10-02 12:55:41.021766+00	2026-10-02 12:55:41.021766+00	password	a48ed085-faea-441b-b31a-4d4c864e6fae
42e84ec3-da29-4163-b1c1-fe5a8229534f	2026-10-02 13:09:40.080302+00	2026-10-02 13:09:40.080302+00	password	71830916-0c7e-440f-a451-8858b94c961a
b8f04710-38bf-4684-9c07-5bc2200af4cb	2026-10-02 13:18:13.892923+00	2026-10-02 13:18:13.892923+00	password	64efacbc-b9bb-497a-b2fa-18438617d9f3
e9752531-06e4-4b2c-9e85-a9a303da0394	2026-10-02 13:20:19.972639+00	2026-10-02 13:20:19.972639+00	password	075e90fc-d52e-42d3-9b62-479366c7d4b7
ac992873-7784-4557-a608-1ee93c47958b	2026-10-19 19:33:04.360611+00	2026-10-19 19:33:04.360611+00	password	f37ac412-dd60-496d-9931-a39140733f1f
8ad00532-81ba-4d51-a94a-15a3fed1e294	2026-10-19 19:33:58.180207+00	2026-10-19 19:33:58.180207+00	password	a89ca5bd-7da0-4e13-b56f-91e7df80aac9
7a456797-aa86-4b44-9603-3737ff0b063f	2026-11-10 12:29:33.421739+00	2026-11-10 12:29:33.421739+00	password	a467cc18-6bcf-4425-8303-1cbf298657b4
aff9f2c7-92e8-42f6-a739-89f9fc82f773	2026-10-02 13:26:25.538976+00	2026-10-02 13:26:25.538976+00	password	977c29d5-2159-4b32-87df-170d1ea891bf
e3e3349f-adff-4700-94ae-bdeeb2680b39	2026-11-10 12:30:23.857938+00	2026-11-10 12:30:23.857938+00	password	02d257ec-bd06-4db0-89bb-50a1630e5653
4cb51e8b-cc45-4333-8adb-1e1360dda7b5	2026-10-02 13:28:17.072234+00	2026-10-02 13:28:17.072234+00	password	04f028a0-13ef-4e4b-a8ca-9fdf2feab7f6
1dcb99cc-333b-474b-825b-3e65ce6881f7	2026-10-02 13:31:52.876896+00	2026-10-02 13:31:52.876896+00	password	7963905b-ed47-4a5e-b2ab-6b4426af3dad
b8d5df3a-809f-4a23-84f5-6e7b3b3ce64e	2026-10-02 13:57:39.825851+00	2026-10-02 13:57:39.825851+00	password	6dd06bbf-b657-465c-82d8-1e44111b7d54
1ac316bf-26b3-440f-afe0-b6d276e7e5bf	2026-10-02 14:11:15.529945+00	2026-10-02 14:11:15.529945+00	password	970a2635-ad11-414d-9ec8-86e3c0080495
2a1d7c0c-34c6-4bb3-935f-c797f5417468	2026-10-02 14:22:31.735997+00	2026-10-02 14:22:31.735997+00	password	1503ae3c-e8ce-4d6d-9906-57e78ff5aa5b
13b6f527-404a-42a1-a062-1c20c64f3b48	2026-10-02 14:39:46.025766+00	2026-10-02 14:39:46.025766+00	password	bf95c7fb-087a-473b-a252-170441918d14
ad4221da-2b5b-44cf-a4bf-2a9c07a4e65d	2026-10-02 14:57:34.064721+00	2026-10-02 14:57:34.064721+00	password	377d9ff2-424a-43f6-b639-09d566807217
5a3f491f-e516-44f3-8990-2e8076d639ce	2026-10-02 14:57:49.455692+00	2026-10-02 14:57:49.455692+00	password	7d1aea2f-c961-43ad-aa8a-2d2cfd30ce4a
b5a77ef9-0242-4652-8655-4503998c15d5	2026-10-02 14:59:18.235893+00	2026-10-02 14:59:18.235893+00	password	51700cf2-aaa1-4cd3-8002-094ab59c1ea3
b1a95302-6c07-48c6-8fea-aa883a90cac7	2026-10-02 15:05:29.304759+00	2026-10-02 15:05:29.304759+00	password	09513de7-af49-404a-bce6-243a897adc20
e52aec42-67b4-4db5-9d46-3fa07842ecec	2026-11-10 17:06:15.156912+00	2026-11-10 17:06:15.156912+00	password	72a1e042-015a-44fd-aa1a-03968af5e99d
740744d2-1f14-4099-a8f3-d90136c50705	2026-11-11 06:33:57.957434+00	2026-11-11 06:33:57.957434+00	password	c424735e-3ae6-40c0-86db-31fa1d368871
7f8b3c80-313a-4262-a710-45062f8f3815	2026-11-11 12:38:21.769735+00	2026-11-11 12:38:21.769735+00	password	650b15b2-621a-4d9a-b080-d11286387975
fd0d4510-716f-49c5-a7ab-b9ce98eb1fc4	2026-10-02 15:47:53.588295+00	2026-10-02 15:47:53.588295+00	password	a93634e3-8a64-4f8c-9b9f-83b2bf3b098e
7cc04f1f-ea99-43ff-ba5a-3c93d9f89247	2026-10-02 15:52:05.26657+00	2026-10-02 15:52:05.26657+00	password	ea838352-27cf-402a-9e3d-4e11bacf9648
eac8ce35-f811-4381-b33e-1d2818008601	2026-10-02 15:55:01.787785+00	2026-10-02 15:55:01.787785+00	password	f46b6dc9-0914-440c-9f4a-9d923ffb7672
fb06cd9f-2590-41e6-96a6-75fe9d3b809d	2026-10-02 15:55:32.216725+00	2026-10-02 15:55:32.216725+00	password	ff98b585-0eeb-46ed-b1b6-f1aad0bd6ae4
80e7fb92-a4b9-4181-b90a-5264a4233f89	2026-10-03 08:36:48.54219+00	2026-10-03 08:36:48.54219+00	password	a2211849-8238-46b8-9d45-45c850844986
6672c9b3-3dcb-48b4-a421-d4f27c1e1c6a	2026-11-12 05:10:17.161242+00	2026-11-12 05:10:17.161242+00	password	c3b97dc8-18ae-4158-b845-f35f5494e104
a1dc30de-6d58-47df-961c-744714bd3733	2026-10-03 09:06:48.785637+00	2026-10-03 09:06:48.785637+00	password	a8e9b534-d4e2-4455-84ee-a9148786d5c5
f6e5ba86-1a31-4605-85e2-41d8c49ee560	2026-10-03 09:18:35.582732+00	2026-10-03 09:18:35.582732+00	password	48d74f95-90e0-45b2-9c5d-4b4bee56bd06
1d5d0c0a-3674-405b-8b2c-ad55c393ab65	2026-10-03 09:41:14.000686+00	2026-10-03 09:41:14.000686+00	password	3ff5cbd1-daaa-4a20-949c-a187824a2ec0
5a7f5ff9-838e-4cc2-8a45-7fe717e42f4d	2026-10-03 10:05:57.611514+00	2026-10-03 10:05:57.611514+00	password	d3860c3e-5533-4968-a77b-0f5814d8610f
492818ea-e719-4d86-aa85-09c22704202d	2026-10-03 10:13:27.498222+00	2026-10-03 10:13:27.498222+00	password	d1167ea7-5ea5-410c-86c6-1b2dc987c15b
ae167278-7876-461d-92dd-58bcdf3e0ab6	2026-10-03 10:19:57.108306+00	2026-10-03 10:19:57.108306+00	password	bb4e5f00-0e48-4c7b-8ca0-c8194e5dace5
ab1feeb4-c09b-49f8-8910-7cdafe7b4d0c	2026-10-03 10:30:25.252516+00	2026-10-03 10:30:25.252516+00	password	86afd5e8-56f2-44e6-9bee-9071fe492614
beda3b1b-83a8-4dd1-9326-113bbc4280e6	2026-10-03 10:31:24.962428+00	2026-10-03 10:31:24.962428+00	password	9ec6964a-83ca-48de-8f58-3db803e6fd9b
6a4d429e-a8da-4ce1-b3f7-151ff696c98b	2026-10-03 10:32:04.599865+00	2026-10-03 10:32:04.599865+00	password	a10d8276-015f-4a35-82eb-8d59db46b9af
80cda575-42dd-4764-8326-3912c146ee65	2026-10-03 11:08:26.712345+00	2026-10-03 11:08:26.712345+00	password	1fd7b8cb-3981-4e24-81b5-36fec502a902
2b1e80ee-5dd9-447c-80c5-6bc3ca983d89	2026-10-03 11:10:08.190713+00	2026-10-03 11:10:08.190713+00	password	00e13265-cb58-4021-8c74-ec35f07d4803
31305d80-4e13-46c9-82ef-40ec070be83d	2026-10-03 11:10:49.960372+00	2026-10-03 11:10:49.960372+00	password	a884c6f5-36b2-4d28-8633-b56ff846a100
cdbb30e8-39fa-4680-9c70-803a137924f3	2026-10-03 11:25:55.046962+00	2026-10-03 11:25:55.046962+00	password	a4d86b57-5578-4c73-b8bf-62e0f09ee1e7
74539d49-ac4d-425a-87ca-a013bf9956b7	2026-10-03 11:43:14.412159+00	2026-10-03 11:43:14.412159+00	password	13be2b42-1fb9-41b0-81f7-9c84997d4640
326eb931-3b23-4161-aae8-9b79189c0ccc	2026-10-03 11:49:11.502575+00	2026-10-03 11:49:11.502575+00	password	68eced31-69d2-4fa4-a412-9fff82a6131b
20c6b2e4-efa4-4872-a278-5ff45b957f68	2026-10-03 11:52:32.05876+00	2026-10-03 11:52:32.05876+00	password	702a2f58-0dad-4c13-8a35-72d119aa4d75
d1c3e14e-557b-46a3-b917-e448806a9e31	2026-10-03 12:08:44.175321+00	2026-10-03 12:08:44.175321+00	password	b5957814-9490-4cb7-ac95-04c96edf6ce8
d7f8dcf3-5390-492e-8a43-205cb0891dd9	2026-10-03 12:20:51.316365+00	2026-10-03 12:20:51.316365+00	password	3538de8f-27fe-40c0-a048-fdd01315bd6d
afa17a86-39f4-4e8a-ad45-2a45bb12b133	2026-10-03 12:31:20.555725+00	2026-10-03 12:31:20.555725+00	password	78de6c23-2b39-4a8d-82f0-b5d6c8c35cf0
330665d1-1cbf-427d-851b-5de42bc3d269	2026-10-03 14:17:54.352827+00	2026-10-03 14:17:54.352827+00	password	b3d86ac4-1f29-4074-b478-08b384e6e115
0f21f9ab-09b6-46f4-951f-e97324f7229b	2026-10-03 14:33:03.131068+00	2026-10-03 14:33:03.131068+00	password	9d47a975-2bb5-4247-aae7-a3ee48d458c2
4ad2dd70-c6c1-4c6e-b51c-bef57ec6ded3	2026-10-03 14:33:43.641817+00	2026-10-03 14:33:43.641817+00	password	ed6ebc28-f030-479b-9d28-dcfa32fd75a1
ea0cb053-3991-47e3-abe3-4fccea468f8e	2026-10-03 14:41:16.263349+00	2026-10-03 14:41:16.263349+00	password	013b76d2-dcb8-49da-a757-512699e506f2
f47b48d0-0d47-4d5a-8a72-766e7778a22b	2026-10-03 14:41:39.627422+00	2026-10-03 14:41:39.627422+00	password	a3e30e71-365f-44c4-9c70-76c55a7c3e07
b40e60aa-074b-410b-96bd-bc88e6fe2bba	2026-10-03 14:42:26.630382+00	2026-10-03 14:42:26.630382+00	password	1bd7687d-ce8f-4483-b4a5-10f6a8724c6d
8fe078c7-7f81-4d6e-8b86-b27199ddd597	2026-10-03 14:44:52.507669+00	2026-10-03 14:44:52.507669+00	password	b155f818-c73b-4333-bdf8-5e73b763a524
832d8f56-dd1a-46bb-9ee4-1589347029fa	2026-10-03 14:46:15.259879+00	2026-10-03 14:46:15.259879+00	password	d8a12da4-c79a-4229-b5db-ee6a78b1d912
cfa28041-6456-439b-a1bd-122c7966cf3e	2026-10-19 19:38:28.670671+00	2026-10-19 19:38:28.670671+00	password	521a2edf-fc77-4503-add9-f15a6a5cb20a
0ddfc4ca-9fcc-4d1b-8bc1-08115fb4c232	2026-11-10 13:18:16.063574+00	2026-11-10 13:18:16.063574+00	password	c647c089-dff8-4636-8e2f-7b7212acf1d4
93b5ca69-d2cc-436e-8328-2010f8e566d0	2026-11-10 17:11:30.154029+00	2026-11-10 17:11:30.154029+00	password	07f3aa6c-8000-4f28-91a5-dceddf10f82d
11642e0b-2032-4122-aaf8-ff6eec0038c1	2026-11-11 06:36:36.259668+00	2026-11-11 06:36:36.259668+00	password	c779fbb5-4fb5-4b16-8446-5bd5f15303ad
ca3244ec-e10e-4a91-9729-51d72b745a01	2026-11-11 12:39:45.244847+00	2026-11-11 12:39:45.244847+00	password	ea3237e4-9c9b-4414-8904-6d6f093fa1fc
b231d35a-6002-422c-8466-1e323df1da5e	2026-11-11 12:42:13.230572+00	2026-11-11 12:42:13.230572+00	password	4b989c32-fa17-47dc-9917-6d587d575f41
9113de67-7b4a-4562-a135-5751e7a91b8b	2026-10-04 12:25:28.490037+00	2026-10-04 12:25:28.490037+00	password	270b2874-d501-47ad-a9fc-f08e213b0258
545c700d-26f9-4421-b1e5-292e422a4c68	2026-11-12 09:28:18.163615+00	2026-11-12 09:28:18.163615+00	password	e02be793-3fc3-4641-b37f-6d89acbddfef
5f807f02-16c1-439b-9094-32d7e1443bae	2026-10-04 12:50:54.632666+00	2026-10-04 12:50:54.632666+00	password	318229c5-c8e4-4701-af77-b690f699a5b0
9619c98e-451f-4eef-b00d-62acb991f641	2026-10-04 14:12:11.207891+00	2026-10-04 14:12:11.207891+00	password	5ce492bc-5ac6-4833-b7f5-35f1569a4ef9
99ebf234-20f4-4609-8052-cf11b2f13686	2026-10-04 14:17:42.222546+00	2026-10-04 14:17:42.222546+00	password	3e20171c-4706-4e4a-b8fd-988aaa83db38
20fbc2aa-a99f-406d-a1e8-32c3bad10704	2026-10-04 14:17:57.867692+00	2026-10-04 14:17:57.867692+00	password	a0955128-f085-47a9-ba61-d8500d1c46dc
aa6c33a3-e06d-4f37-9de8-aa561ceb6544	2026-10-04 14:18:44.036947+00	2026-10-04 14:18:44.036947+00	password	e237ed51-6c42-422a-96ed-826d03aebb49
549e310f-721e-489c-9218-eb655f145f13	2026-10-04 14:19:46.161839+00	2026-10-04 14:19:46.161839+00	password	2d20e5a7-6170-4834-82de-d598babdb92d
85410700-193e-423d-b792-86b00a7a6ba2	2026-10-04 14:36:59.097456+00	2026-10-04 14:36:59.097456+00	password	759d936d-6453-4b75-a12a-306805839546
82c506c6-88d8-465c-b086-595c87f5cea7	2026-10-04 14:37:09.321828+00	2026-10-04 14:37:09.321828+00	password	c1a521e3-a4a1-47d3-b364-a3b8544bc590
eae2cced-5d3d-43c8-abb7-71d0f146577d	2026-10-04 14:42:08.277352+00	2026-10-04 14:42:08.277352+00	password	09b1e98c-2d53-423d-8ddd-f04329622804
5d2556b2-96cb-4f24-8067-8dbd43f0530b	2026-10-04 14:50:15.458989+00	2026-10-04 14:50:15.458989+00	password	ae01ddce-d2f5-4d31-9b0c-970cde761881
729fa231-cc2c-4783-a70a-02e6a854dba0	2026-10-04 15:02:18.519073+00	2026-10-04 15:02:18.519073+00	password	0740c8de-2388-4902-9d4c-95d6f43f38e9
f8f4d2b5-4cdb-4fb2-bb8f-94bb804fc47e	2026-10-04 15:02:31.169369+00	2026-10-04 15:02:31.169369+00	password	71db4fd9-c9ab-46fa-8150-141e86a363dd
568437b1-7d6f-40bd-acc0-82087a75d01a	2026-10-04 15:02:52.56357+00	2026-10-04 15:02:52.56357+00	password	3ae586ee-a04b-411b-bc6b-b225e1e67cbb
26994e7e-d9f4-47c7-b77f-7108f0457826	2026-10-04 15:03:30.159622+00	2026-10-04 15:03:30.159622+00	password	c4799e45-8027-4dba-83f1-a73a5d72b954
8c42e873-9a26-4d58-a61a-3127fb569881	2026-10-04 15:15:13.816213+00	2026-10-04 15:15:13.816213+00	password	d9552658-9b50-4e44-85a0-b921a305cfae
67070928-72e5-4809-bb4e-ebd3074a41ed	2026-10-04 15:15:57.576264+00	2026-10-04 15:15:57.576264+00	password	9f134c70-3b8f-43bc-98df-4d87831f563d
7ac06bf4-b5ed-49c3-9143-33100491fac5	2026-10-04 15:20:49.81591+00	2026-10-04 15:20:49.81591+00	password	496906f0-a12b-41a0-bba7-1ec7d38b6aaa
7da5ddc2-d6e6-41fa-becd-feaad7894f9d	2026-10-04 15:21:06.896012+00	2026-10-04 15:21:06.896012+00	password	74eb9b56-35b2-4175-b4f5-b461532ff66d
09f11da7-875d-4432-861f-8092d3ecb0b8	2026-10-04 15:36:29.179491+00	2026-10-04 15:36:29.179491+00	password	33a7a4b9-279d-48ba-8e16-a4561ed5224f
4570c472-c181-41ae-a037-19337ae83385	2026-10-04 15:45:39.898886+00	2026-10-04 15:45:39.898886+00	password	4a5c54f5-0914-4179-9234-934408bf5594
1bddb0b2-12fe-4e5f-b73a-78b9d056f6b0	2026-10-04 16:05:25.476346+00	2026-10-04 16:05:25.476346+00	password	367c9b3c-0ed1-46ba-b26a-65102a693f70
9f6e4c46-d1b4-4b98-9f2f-774a835f5daa	2026-10-04 16:28:49.115208+00	2026-10-04 16:28:49.115208+00	password	159e697d-3c0c-4e29-b11b-5f9c0d9f1548
5bbc6824-73b6-4ae3-a356-556bdaa53516	2026-10-04 17:18:01.078695+00	2026-10-04 17:18:01.078695+00	password	d038a57c-4e05-4c45-9a0b-cc9cb211ae42
cced56a7-58cf-4dd0-b3a2-60d90653854e	2026-10-04 17:18:25.245213+00	2026-10-04 17:18:25.245213+00	password	e361fd6b-5d91-4ca7-9690-ac5ee0a09714
cabba20f-5329-4da4-981f-76bfb3f883b5	2026-10-05 04:34:41.992674+00	2026-10-05 04:34:41.992674+00	password	60026e49-b505-4727-b897-63314cbc6911
b2fe3032-3d3c-45d1-8a4a-eead94a8cb59	2026-10-05 04:39:43.493133+00	2026-10-05 04:39:43.493133+00	password	50708606-daa7-4aa6-82b7-0995a50f905c
dfcd9080-c014-48e8-a1db-360c92cdfaf8	2026-10-05 05:15:39.940221+00	2026-10-05 05:15:39.940221+00	password	8cdd12c5-b58a-4750-b00e-cd44fea483b7
d7ae4270-6b90-4f43-a594-33d7435d6603	2026-10-05 05:17:02.047038+00	2026-10-05 05:17:02.047038+00	password	50ebf836-cd2a-4a40-84e8-144d62cf6b25
e5458796-ba2b-45df-89f0-f9784374bf5e	2026-10-05 05:17:25.711222+00	2026-10-05 05:17:25.711222+00	password	bdda1559-fcd6-4926-9fcc-72a7164685ca
6b759e5f-9fb8-45d3-a317-07b1d9b497e7	2026-10-05 08:14:49.102871+00	2026-10-05 08:14:49.102871+00	password	a49e2628-b8b6-440f-a03b-86e26def7237
68b2e11f-93bb-431a-8f1e-bcf99ee7df94	2026-10-05 08:23:00.051739+00	2026-10-05 08:23:00.051739+00	password	77e53e90-4730-4022-9af9-6c8161977a87
94cc688a-9a56-45be-b442-a4867ace16da	2026-10-05 08:23:33.936202+00	2026-10-05 08:23:33.936202+00	password	8ca94ed1-2118-4b64-a36a-3b3971d05bbf
3314b28b-4dbf-46de-8339-d40ea6b6a7ef	2026-10-05 08:25:48.831799+00	2026-10-05 08:25:48.831799+00	password	92586f7e-34bc-4bef-a051-0cd5fc04e30a
3d0d5200-dcb1-4fed-b959-3009fcf8eda3	2026-10-05 08:35:25.120605+00	2026-10-05 08:35:25.120605+00	password	2798b5f5-4896-4b05-b180-dd2484ba5caf
bdbbe16f-14a5-4d9e-9537-c67940c77436	2026-10-05 08:36:59.368868+00	2026-10-05 08:36:59.368868+00	password	c23cff95-7b88-4662-8e9a-f32009eed700
8655c5ac-372e-4514-bbd1-57f859a1e3f6	2026-10-05 08:38:07.295491+00	2026-10-05 08:38:07.295491+00	password	fcf5ba2c-9343-4005-ba84-fd20f64a7b47
a168e756-c665-45c1-8887-f7d120de6cba	2026-10-05 08:38:35.367282+00	2026-10-05 08:38:35.367282+00	password	976de1d3-19c8-44d4-8da4-30aa9ebe63a8
8b074cbe-bf1e-40bd-a580-968939ee7b2a	2026-10-06 06:24:49.149759+00	2026-10-06 06:24:49.149759+00	password	6c6f5034-c0c6-4c46-88bc-659d7cc93864
5aa2cd3d-e57c-4fa8-8087-9d6bd8048413	2026-10-06 06:26:47.681732+00	2026-10-06 06:26:47.681732+00	password	9ac0cc4e-544f-4587-a88c-109c3e5b3b99
776cec92-66eb-453b-b3f6-6e0be8280b34	2026-10-06 06:27:24.21707+00	2026-10-06 06:27:24.21707+00	password	dc0ad473-eaf0-4869-a612-3e30a09862f2
382525eb-2410-405c-b3b1-0430a2a04171	2026-10-06 06:30:41.475107+00	2026-10-06 06:30:41.475107+00	password	56459846-1e2d-4305-ae14-fe3932f0e33b
e31abfbc-2d91-4972-a0b8-4b0c56bc0cb3	2026-10-06 06:31:33.278453+00	2026-10-06 06:31:33.278453+00	password	d78fbd8f-70a9-415a-af90-add564539ebb
58f04d13-7dc9-484f-999b-48f27fe217a9	2026-10-06 06:35:38.975832+00	2026-10-06 06:35:38.975832+00	password	688ccef7-03f6-4001-9794-9aac06085c50
25321602-17e4-4289-9a92-d25403e3d452	2026-10-06 06:38:25.535089+00	2026-10-06 06:38:25.535089+00	password	1f66388d-90c9-48eb-bf78-ebf62dab55ca
ede92149-0c8c-4c88-bee7-bbe7f7522804	2026-10-06 06:55:12.904431+00	2026-10-06 06:55:12.904431+00	password	b9157dbe-958a-454b-b9a3-e97e1aec57e8
31c3ee89-925d-4089-9851-a70f4aa9fb61	2026-10-06 06:58:20.543968+00	2026-10-06 06:58:20.543968+00	password	38fcc816-5c70-43fa-bbe8-82a0f74c5140
77994cad-76f4-44e8-b6c2-c0e20f582962	2026-10-06 07:09:21.95723+00	2026-10-06 07:09:21.95723+00	password	ca0dcc6c-e3a3-4a0b-8707-41d3386bf650
55b708f3-40dd-465a-aa7f-5526398ee7ed	2026-10-06 07:09:36.532952+00	2026-10-06 07:09:36.532952+00	password	d07a2e48-0304-4b3c-acbb-dbcc19417cb5
e35d5324-8b82-4880-b238-8ece0555005c	2026-10-06 07:19:50.250913+00	2026-10-06 07:19:50.250913+00	password	03116e83-1e75-4671-b9ec-67be497eb4e2
83a65ae7-53c5-4b1f-9c31-94321c4869c7	2026-10-06 07:35:53.481845+00	2026-10-06 07:35:53.481845+00	password	acf9875b-7791-4a33-84b2-6c449380019a
630f9b48-9e80-44dc-bc1e-17cec65c1901	2026-10-06 07:35:53.486678+00	2026-10-06 07:35:53.486678+00	password	1c5789de-47c3-4f00-ad5f-ff2fe25aaa80
84d2ddd5-9e6c-4a1e-bb24-9456296161ad	2026-10-06 07:35:53.48901+00	2026-10-06 07:35:53.48901+00	password	5db0bbe7-ceaa-40e8-8d20-e08bf53ea00c
eddafa2f-81ac-4806-9515-624fe086384f	2026-10-06 07:35:53.492761+00	2026-10-06 07:35:53.492761+00	password	1961ec67-0a63-4377-90aa-cda5ffcde91d
b648d219-42d2-4df7-84cc-2f3093a25194	2026-11-10 14:56:21.158651+00	2026-11-10 14:56:21.158651+00	password	3aabf562-9c9b-4cb1-9988-8ee592019129
f7e895a4-14c6-4e94-919a-2c74cf0f9772	2026-11-10 17:35:53.247475+00	2026-11-10 17:35:53.247475+00	password	51a808ba-ba67-4d22-a869-6a691ff4821c
c3a0b8d9-3055-486f-9ab5-cb5f4b184048	2026-11-10 17:36:26.43677+00	2026-11-10 17:36:26.43677+00	password	707dd95f-3f82-41d4-b5b1-50dad098293f
f2c3b864-78a5-4020-b871-961158cd0cba	2026-11-11 06:36:36.267322+00	2026-11-11 06:36:36.267322+00	password	1a7f34a2-4ac9-4735-8e26-6391d6769190
9b836567-48c5-4769-8152-ec5d32492dc2	2026-11-11 06:37:32.779032+00	2026-11-11 06:37:32.779032+00	password	31693239-0863-4c15-91b5-befd726813d1
7976d2b8-e808-4b73-b737-9883a56e48bb	2026-11-11 06:37:44.35888+00	2026-11-11 06:37:44.35888+00	password	bc9a087e-6c42-46db-a444-f8009cc1c604
0fa0492d-4ae0-4ce5-bbfb-c6c266f619ba	2026-11-11 06:38:27.046511+00	2026-11-11 06:38:27.046511+00	password	b711b917-ecf1-475f-9a38-1be5524b3eb7
78ae9374-87fb-49ce-bcd6-dc76cb3ef781	2026-11-11 14:39:37.734034+00	2026-11-11 14:39:37.734034+00	password	2402fd95-88d2-4232-abe8-0aa9ac6e9707
d726d3c5-fec8-4af3-bb82-1f13db4aee09	2026-11-12 12:13:22.53871+00	2026-11-12 12:13:22.53871+00	password	43cd0c6d-d8ba-4fa3-9d66-0ec66f0c707d
6f5efa03-84f2-4e3b-80cc-0d08aba8f224	2026-11-12 12:13:32.549752+00	2026-11-12 12:13:32.549752+00	password	384e6711-5df7-4796-9e00-ee0f9156917e
b9143f7e-a644-4f73-a45e-8d4dfd736e6a	2026-10-06 08:26:33.865331+00	2026-10-06 08:26:33.865331+00	password	b5841a14-3a2e-4fc3-8fba-a76df68b1c87
ec9ac37e-4c8c-4c3d-950f-53ca0a4a8448	2026-10-06 08:26:50.041377+00	2026-10-06 08:26:50.041377+00	password	bbbae728-26e4-4fc7-bebe-0c8ea0d30342
281e2147-79b1-41f1-9b7f-698b8539dced	2026-10-06 08:28:01.602828+00	2026-10-06 08:28:01.602828+00	password	f25bfaee-4653-44a2-8ed8-1f3c99f352a8
52fda7cc-edff-4e8f-944b-019238f8948b	2026-10-08 07:21:39.186666+00	2026-10-08 07:21:39.186666+00	password	84072368-b0eb-4823-bda8-c9ddf6194d3c
6c08c2df-5a5f-476f-a098-de6f0786e3f6	2026-10-08 07:22:38.693301+00	2026-10-08 07:22:38.693301+00	password	a2cae2df-2a58-4688-b9f4-62815f8bf1ff
a4c910a7-b1d7-45f8-b6d1-1d9ea6268cc9	2026-10-09 00:42:30.818183+00	2026-10-09 00:42:30.818183+00	password	904deb12-157f-45d6-9fa3-c6394d36c90b
f698bc02-62b2-427f-b404-ceac702c6ae7	2026-10-09 00:42:45.847959+00	2026-10-09 00:42:45.847959+00	password	6c8290fd-4ff4-4e9c-b18a-47133382e4de
6f53b655-7386-48ea-8470-129d0628b635	2026-10-09 00:43:08.836209+00	2026-10-09 00:43:08.836209+00	password	c2504e93-2728-4a0a-843e-64059f6f042f
86b6251d-c28d-4b9b-acdb-af942f2f0225	2026-10-09 00:44:05.822237+00	2026-10-09 00:44:05.822237+00	password	44bffaed-120a-4c40-a2c7-1c1b082654af
9e13db4f-d8c6-490b-99d5-b61a35b3b537	2026-10-09 01:08:34.763501+00	2026-10-09 01:08:34.763501+00	password	72d87045-8641-4bd4-a2cd-35e1a78f550b
a0eb411d-1fa6-42c3-bc5e-ff2b92a5e760	2026-10-09 01:14:17.980556+00	2026-10-09 01:14:17.980556+00	password	d9a165fa-2609-4458-8340-1cdf91f1c18f
2abeb091-5f53-4944-b3e3-e50714c18968	2026-10-09 01:22:26.509331+00	2026-10-09 01:22:26.509331+00	password	c3efc282-6c10-4e6c-9a68-7f47a97516e0
822b05da-838c-429b-a28b-f07140ff8de8	2026-10-09 01:39:54.365603+00	2026-10-09 01:39:54.365603+00	password	d92a32b8-158a-45a0-a0d3-3cc0d1981fff
47530875-9fef-4b02-b0d9-25e5b288be2b	2026-10-09 01:52:58.135153+00	2026-10-09 01:52:58.135153+00	password	20880d23-42df-4ee5-a11c-cce667732707
9c43fc60-03e5-4b11-b20a-939c1afc3243	2026-10-09 02:00:47.692212+00	2026-10-09 02:00:47.692212+00	password	db7613d2-d56b-4683-8e12-87b509062c36
723973a5-51e9-43c6-9d75-86937a7f0929	2026-10-09 02:07:29.504092+00	2026-10-09 02:07:29.504092+00	password	e662e47c-16d4-4289-859e-5234a4164991
2d494578-53b4-4598-98a8-dd8afb819cea	2026-10-09 02:15:12.894673+00	2026-10-09 02:15:12.894673+00	password	a7761cf3-b331-49dd-b7eb-d569d7178683
d24d0d05-4e58-4b28-acf4-f10d060b26c0	2026-10-09 02:15:24.351633+00	2026-10-09 02:15:24.351633+00	password	ec6ef1fb-19ff-4880-b18e-feda7dde029c
36d33bbe-d986-4c49-8d57-005684a4f5c1	2026-10-09 02:16:31.289317+00	2026-10-09 02:16:31.289317+00	password	08e9b558-0271-45eb-9713-8730d5b29428
80b020ff-081b-481b-93ea-11dd2cc30afc	2026-10-09 02:16:45.786759+00	2026-10-09 02:16:45.786759+00	password	4073b67b-b189-44fa-b2ce-5fdd2c147c44
1d0b1b82-e112-40da-8faa-1865baf14ceb	2026-10-09 02:17:08.588968+00	2026-10-09 02:17:08.588968+00	password	f1377431-d6c5-4f92-b359-e03304a8ec8b
17146ab2-ae18-4d31-b9f1-9d4f5ae0e7f3	2026-10-09 02:17:26.057906+00	2026-10-09 02:17:26.057906+00	password	d1103a19-a142-48f9-a1b3-781d03607ec5
52475bd3-7f7e-4e1d-b26d-f722da09d7d4	2026-10-09 02:24:34.893265+00	2026-10-09 02:24:34.893265+00	password	67c3eab9-e51e-42f9-a0da-4b41ee5621d2
5b811826-0e8a-4af8-9dfa-e4cb9472ed77	2026-10-09 02:29:04.467008+00	2026-10-09 02:29:04.467008+00	password	c5345dc7-44ab-4416-862e-94b2c2399b21
95ebc9b9-6357-4c9d-8dbf-5c09e335e82d	2026-10-09 02:34:01.672776+00	2026-10-09 02:34:01.672776+00	password	9708265d-f993-43ae-a7b1-b0599c75726e
8f8dff8b-6461-4639-8cbc-1adef1309bba	2026-10-09 02:35:12.16946+00	2026-10-09 02:35:12.16946+00	password	0b2fbc04-9dbd-4fff-8f4d-98090ed4bc87
09059048-ae1b-4ab3-a96a-35d3623cabb3	2026-10-09 02:36:11.67605+00	2026-10-09 02:36:11.67605+00	password	0443e370-2adc-4fbb-b3d7-3de1dadd7ccc
9ade7d36-d2e8-4189-af4d-37cbcc5ec210	2026-10-09 02:36:24.995291+00	2026-10-09 02:36:24.995291+00	password	798f9f3e-b87b-48bd-a823-603376aed6a0
7b471fa9-93e6-41ae-8a68-c24dbbce5d92	2026-10-09 02:37:57.713176+00	2026-10-09 02:37:57.713176+00	password	8806dfa6-1a5b-4f1d-bf90-907750345afc
9d65a986-36d4-41fa-bb85-22990074d2bf	2026-10-09 02:48:41.775117+00	2026-10-09 02:48:41.775117+00	password	77909bd4-1828-45b9-a3d3-785ed3046267
cba073f6-2a06-490f-9c15-d4c429a2b143	2026-10-09 02:54:33.465111+00	2026-10-09 02:54:33.465111+00	password	f635dba6-a24e-4611-a90f-cf13dfd5bf2f
be765b0a-d140-4f3c-8601-cfd3cea2dd1d	2026-10-09 02:57:55.84002+00	2026-10-09 02:57:55.84002+00	password	af26665c-9482-480e-9fa1-bb9eb1dbf16d
55323181-75f1-4c55-addc-70c059727d6c	2026-10-09 03:06:28.025342+00	2026-10-09 03:06:28.025342+00	password	18e0090e-6265-4d39-8295-f3b10f5e181e
c88151f2-6df2-4012-93db-c6b0739558a2	2026-10-09 03:11:38.677972+00	2026-10-09 03:11:38.677972+00	password	45abffaa-0277-45cb-a874-08ceeeef6832
70fbbcc4-e82c-4c28-9559-377f46574411	2026-10-09 03:34:53.96626+00	2026-10-09 03:34:53.96626+00	password	54a8893b-0346-4d9b-aaeb-c561b447fe58
33cc5a9a-5c45-423c-a083-3b5b4724485d	2026-10-09 05:36:15.817075+00	2026-10-09 05:36:15.817075+00	password	46876b6f-0485-493a-85bf-6a14dd4fa64f
15a16863-5c6c-40b8-b56b-e7099529b009	2026-10-09 05:37:47.935333+00	2026-10-09 05:37:47.935333+00	password	f654390a-552e-4fdd-ac09-a152164c3688
3030d61c-8b04-4512-92fd-a736c1578b07	2026-10-09 05:42:21.102838+00	2026-10-09 05:42:21.102838+00	password	c52b0f4c-5a5b-48ad-8bb3-0d832bcbf619
eb1dc3f7-4c2d-4d84-8058-1ca8f15658df	2026-10-09 05:47:40.529561+00	2026-10-09 05:47:40.529561+00	password	17146cac-8b0b-48e0-8952-d4fc5e57f660
43010dc1-8f51-4642-9301-afc68bc037bc	2026-10-09 05:54:37.262897+00	2026-10-09 05:54:37.262897+00	password	5bd7323d-9298-4314-831c-c6a758460e8f
3453bc56-9c8f-4bed-a748-f8fa75e04878	2026-10-09 07:24:31.802112+00	2026-10-09 07:24:31.802112+00	password	96ef8aaf-b591-4a51-ac7b-9a8ce14957e0
2eded737-d339-45ad-89a2-2bdbe1f4bfec	2026-10-09 07:24:41.917447+00	2026-10-09 07:24:41.917447+00	password	08163169-4b15-4c45-b7a5-2f05ce1a83f4
1a6650cb-4c0c-4359-814a-796d84cc53da	2026-10-09 09:33:51.317603+00	2026-10-09 09:33:51.317603+00	password	21404c75-6473-4fa9-9fe5-662a9e9c110d
ac0e8157-dc8a-46e3-aa2d-82cfa7b00838	2026-10-09 09:59:22.785879+00	2026-10-09 09:59:22.785879+00	password	6832307b-bb04-4ba5-aa42-d6af5d53ee4a
604d2f9a-b216-4d7e-ba86-d1dec751291d	2026-10-09 09:59:43.163696+00	2026-10-09 09:59:43.163696+00	password	063b7174-a315-46fd-b79c-c43b233dfe50
c8ec3d73-1359-4336-8507-ccb8a6d086a9	2026-10-09 09:59:45.401642+00	2026-10-09 09:59:45.401642+00	password	f7c4d212-db0c-4227-967f-d50d6ddf8f25
4d9afe23-bfb0-467d-b8a5-0ee9bdbf38d4	2026-10-09 09:59:45.407886+00	2026-10-09 09:59:45.407886+00	password	66df1fd1-f373-4de4-b743-f911dc453d92
e1e08d92-3b0c-4145-81fb-b38480e2dab3	2026-10-09 09:59:45.877516+00	2026-10-09 09:59:45.877516+00	password	3ae9c20b-14ce-4335-81ad-5609e005843e
5560f5c5-860b-4096-a155-53ad7dc3bdd9	2026-10-09 09:59:45.885253+00	2026-10-09 09:59:45.885253+00	password	0c67ebbc-f7e5-4052-9085-407ed0bb4928
70f311ab-9418-4aa4-8955-ea2f3db9608d	2026-10-09 10:00:01.183205+00	2026-10-09 10:00:01.183205+00	password	80a72f68-70be-46e8-9eb3-972f77a13e07
1a5f323c-3b32-4f5d-808e-0d3bb4a9e949	2026-11-10 17:01:30.660727+00	2026-11-10 17:01:30.660727+00	password	440d3907-d7b3-4d1f-a038-814c0500b81b
001e65ea-d5d5-4464-8b19-9bccffddddeb	2026-11-10 17:01:33.468641+00	2026-11-10 17:01:33.468641+00	password	c83f2f5f-744b-43cf-8050-c14e4602b373
8a913bdc-b155-45d5-a071-d9af21a8e405	2026-11-11 05:19:18.358319+00	2026-11-11 05:19:18.358319+00	password	610df067-426e-49ff-b91c-21f7b0f4e411
7707aeb5-3b48-4fb8-a88f-ec2f96d6a1bd	2026-11-11 05:19:20.563187+00	2026-11-11 05:19:20.563187+00	password	05c9788e-8ef3-449a-b4b6-d2f7a324daec
1c49526f-9140-43cc-b5c0-94a201d63091	2026-11-11 05:21:04.316194+00	2026-11-11 05:21:04.316194+00	otp	fc76e107-05cb-44c7-b44f-cd6f2a22c6e0
9d9e5540-9752-4d65-85be-347f9eb1f677	2026-11-11 05:21:44.914498+00	2026-11-11 05:21:44.914498+00	password	0ebc6673-1852-4808-973a-5e29e50000a4
0fc1a666-5b89-4225-bba2-4e0f3fad6f84	2026-11-11 06:46:23.794777+00	2026-11-11 06:46:23.794777+00	password	b78a2fe7-13f9-48c2-aab8-1158949f696d
e641a462-d895-4e7b-8abc-c1f4281f345d	2026-11-11 06:46:38.023278+00	2026-11-11 06:46:38.023278+00	password	4202b766-c3e3-456d-8d51-517834ce0833
1ec6d22a-0831-43e5-a132-40049a31608b	2026-11-11 17:11:54.396809+00	2026-11-11 17:11:54.396809+00	password	cd9171d7-b5a2-4e28-b74d-27581711a67a
7d0edeec-bee8-4ee7-86fd-47e94617ea7b	2026-10-09 10:37:21.718117+00	2026-10-09 10:37:21.718117+00	password	08e783f5-ee31-4c2c-b56e-fb8e0e382780
c5343cf4-e771-45ec-877a-f84f3d1f3173	2026-10-09 10:40:51.020764+00	2026-10-09 10:40:51.020764+00	password	8a8741a3-a513-43dd-b621-cd12affe1481
e2d67019-8c79-4e05-9460-97f2229d1466	2026-10-09 11:30:27.742011+00	2026-10-09 11:30:27.742011+00	password	3dc3fe97-8d51-4c44-945b-e40ce3b29002
21cf489a-e712-4784-aa72-9adf0b190e26	2026-10-09 11:45:08.124086+00	2026-10-09 11:45:08.124086+00	password	1a0655c6-de8b-4f88-a701-0234cfd780b3
5d7bce46-dc4d-4519-9c10-b1e25f216dbc	2026-10-09 12:16:02.985385+00	2026-10-09 12:16:02.985385+00	password	319b7e50-2e45-4832-8085-d23de8ba26d9
82f8fe17-d275-41e3-a2a4-e15dcf529a61	2026-10-09 12:16:03.762188+00	2026-10-09 12:16:03.762188+00	password	4a54303e-a2ef-4434-9823-cbe62f293779
55762370-4454-491e-8322-5d84dd513856	2026-10-09 12:17:28.591498+00	2026-10-09 12:17:28.591498+00	password	751c49eb-4165-4699-a912-a592512f4f54
be9ba2f9-2de5-4c32-bb1e-9e41c8e48e00	2026-10-09 12:47:18.24851+00	2026-10-09 12:47:18.24851+00	password	05482ac5-4baa-4fee-81e6-2259275314ad
c5800cf5-548b-48bf-a2aa-79af2724565a	2026-10-09 12:53:13.783833+00	2026-10-09 12:53:13.783833+00	password	738b2f54-f38e-4682-9714-01916fcf30bd
fa1e8932-8d4a-47df-b3c2-58707186ab65	2026-10-09 12:55:27.586538+00	2026-10-09 12:55:27.586538+00	password	f01f39cf-6d7f-4efb-969c-f4242ca6c080
3188f819-6911-4316-b778-ca9c2228fe5a	2026-10-10 08:48:20.794602+00	2026-10-10 08:48:20.794602+00	password	0e933755-6e84-4797-8465-46024c855611
e84a3ef7-f56a-4f6b-a26f-ee32a4500f18	2026-10-10 08:49:20.904952+00	2026-10-10 08:49:20.904952+00	password	25c44488-b037-4bc3-aa09-28d6fd7f0447
ef49e121-f829-47e2-83a9-ef525f744d66	2026-10-10 09:05:36.946437+00	2026-10-10 09:05:36.946437+00	password	288ddd09-55b3-47d8-968a-d052b6d43575
ef5ef78d-fb3e-41bc-b958-485254354c13	2026-10-10 09:18:14.290615+00	2026-10-10 09:18:14.290615+00	password	30f17e49-6a39-4289-9410-68968ae8c0e0
75897a10-d028-42ec-9687-6f3e6c9ef9e9	2026-10-10 09:21:36.717673+00	2026-10-10 09:21:36.717673+00	password	7fa51f8f-663a-4ce8-abff-9c310fb1727c
2f86ab72-c08b-467b-a58d-1c826dc40d9f	2026-10-10 09:28:52.215116+00	2026-10-10 09:28:52.215116+00	password	03d46eb5-c0b1-445e-8cc6-824ee753b129
6379a083-1fcc-4be4-a384-0cbb31367a74	2026-10-10 09:41:17.80983+00	2026-10-10 09:41:17.80983+00	password	9631cd7b-e6ac-49d5-917e-e8b3339ff27c
d2501c94-cc86-4c8c-a6d8-bc785da7b821	2026-10-10 09:49:43.099095+00	2026-10-10 09:49:43.099095+00	password	3d88e68b-3be5-4c0e-b288-0a05fad51966
6885cb11-5cad-4026-82d3-5d716f30f95a	2026-10-10 10:18:21.591827+00	2026-10-10 10:18:21.591827+00	password	ec01985b-17f4-46e1-a0ce-844916add9d0
8692aae5-bf7a-45e7-bf17-686b9bf02390	2026-10-10 10:41:45.240004+00	2026-10-10 10:41:45.240004+00	password	4da91fff-dfe4-460d-b51e-c1e80f93edaf
baac4fb3-cd4b-4f78-a166-5bfc9e9ea2af	2026-10-10 10:41:46.135824+00	2026-10-10 10:41:46.135824+00	password	17c6b18c-09cb-411d-bf2f-c21911a15f7e
71952066-686c-4e79-9a26-d519b328c62a	2026-10-10 10:52:53.012904+00	2026-10-10 10:52:53.012904+00	password	ef293765-3dcb-4e44-b467-150594d0c514
29c2f637-b821-421c-87a9-89e160b0b765	2026-10-12 09:59:18.325603+00	2026-10-12 09:59:18.325603+00	password	c5531993-5f8a-46e5-9adb-299df64741a0
0efed4e5-d669-40bf-84bd-0a839702e94f	2026-10-12 10:04:08.254197+00	2026-10-12 10:04:08.254197+00	password	d6569635-8b9c-43c0-a5c5-fe0a4dc5c3b5
083dc0f8-ab95-41e5-adb9-2ad0a6a2a7d3	2026-10-12 10:06:45.616552+00	2026-10-12 10:06:45.616552+00	password	e6283764-a563-41ee-b42b-a8905937cebc
1cfb3f9e-de00-4c88-b141-f8853ba74a63	2026-10-12 10:07:01.532643+00	2026-10-12 10:07:01.532643+00	password	99ebd22f-b8cf-4f34-aac1-dbc6064bf97a
62447468-8207-4084-b2d4-46c4c700cf62	2026-10-19 08:51:35.116573+00	2026-10-19 08:51:35.116573+00	password	a764012c-34d5-4be3-91db-4261ec18bde1
ea669ab5-61de-432d-b4f5-2d552075d50f	2026-10-19 08:55:42.368989+00	2026-10-19 08:55:42.368989+00	password	086fe563-414f-4f23-bc10-077bcee7daa9
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_factors" ("id", "user_id", "friendly_name", "factor_type", "status", "created_at", "updated_at", "secret", "phone", "last_challenged_at", "web_authn_credential", "web_authn_aaguid", "last_webauthn_challenge_data") FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_challenges" ("id", "factor_id", "created_at", "verified_at", "ip_address", "otp_code", "web_authn_session_data") FROM stdin;
\.


--
-- Data for Name: mfa_recovery_code_sets; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_recovery_code_sets" ("id", "user_id", "mfa_factor_id", "failed_verification_count", "verification_locked_until", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: mfa_recovery_codes; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."mfa_recovery_codes" ("id", "mfa_recovery_code_set_id", "code_hash", "consumed_at", "created_at") FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_authorizations" ("id", "authorization_id", "client_id", "user_id", "redirect_uri", "scope", "state", "resource", "code_challenge", "code_challenge_method", "response_type", "status", "authorization_code", "created_at", "expires_at", "approved_at", "nonce") FROM stdin;
\.


--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_client_states" ("id", "provider_type", "code_verifier", "created_at") FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."oauth_consents" ("id", "user_id", "client_id", "scopes", "granted_at", "revoked_at") FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."one_time_tokens" ("id", "user_id", "token_type", "token_hash", "relates_to", "created_at", "updated_at", "expires_at") FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") FROM stdin;
00000000-0000-0000-0000-000000000000	1	rdchzs3emmio	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-01 10:03:27.810955+00	2026-10-01 10:03:27.810955+00	\N	d09b4a53-f951-42a5-bb5e-09754356f525
00000000-0000-0000-0000-000000000000	340	acrg25tx6daa	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-19 19:33:04.341799+00	2026-10-19 19:33:04.341799+00	\N	ac992873-7784-4557-a608-1ee93c47958b
00000000-0000-0000-0000-000000000000	3	zzjcwilcr3g5	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-01 10:12:13.769325+00	2026-10-01 10:12:13.769325+00	\N	b80a3bb3-e0d4-485b-85fe-a29cd9a66b3b
00000000-0000-0000-0000-000000000000	4	y7k7gt4z3s7q	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-01 10:12:29.725443+00	2026-10-01 10:12:29.725443+00	\N	88d7f3f3-6466-46af-8c65-46ff06b97e45
00000000-0000-0000-0000-000000000000	5	l3bvzz3hckhp	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-01 10:28:58.942933+00	2026-10-01 10:28:58.942933+00	\N	70a58934-8b42-4633-80ec-334def757193
00000000-0000-0000-0000-000000000000	6	4l4itbcs677q	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-01 10:29:26.286309+00	2026-10-01 10:29:26.286309+00	\N	edbabd4e-c8c6-4cfc-aa6d-512101e0c868
00000000-0000-0000-0000-000000000000	341	7pooenditnfg	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-19 19:33:58.17751+00	2026-10-19 19:33:58.17751+00	\N	8ad00532-81ba-4d51-a94a-15a3fed1e294
00000000-0000-0000-0000-000000000000	7	5ot6ozrapokc	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-01 10:43:57.377639+00	2026-10-01 14:32:00.38144+00	\N	bab1a278-3004-42a9-91d0-6a263b8f0d10
00000000-0000-0000-0000-000000000000	8	t6amxjkrb2le	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-01 14:32:00.395358+00	2026-10-01 14:32:00.395358+00	5ot6ozrapokc	bab1a278-3004-42a9-91d0-6a263b8f0d10
00000000-0000-0000-0000-000000000000	9	zsd7owyp5kvc	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-01 14:36:16.533547+00	2026-10-01 14:36:16.533547+00	\N	1fb223db-8983-4d07-b19d-2a4c9a6e536b
00000000-0000-0000-0000-000000000000	343	bhga263rtuiv	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-10 12:29:33.398153+00	2026-11-10 12:29:33.398153+00	\N	7a456797-aa86-4b44-9603-3737ff0b063f
00000000-0000-0000-0000-000000000000	11	bedcx5prfzqs	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-01 15:05:34.214162+00	2026-10-01 15:05:34.214162+00	\N	725fa976-dbb0-4240-a012-86267ac5f50d
00000000-0000-0000-0000-000000000000	12	krfg2tjhhmze	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-01 15:35:56.185808+00	2026-10-01 16:56:56.786906+00	\N	3ebcb427-923e-4caa-95c1-6b88feb1cefd
00000000-0000-0000-0000-000000000000	13	nvkbzrcyaidw	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-01 16:56:56.805267+00	2026-10-01 16:56:56.805267+00	krfg2tjhhmze	3ebcb427-923e-4caa-95c1-6b88feb1cefd
00000000-0000-0000-0000-000000000000	14	4co7nlyaquw7	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-01 16:57:18.253205+00	2026-10-01 16:57:18.253205+00	\N	8790d6d2-03ff-4962-b9b4-d33a833899dd
00000000-0000-0000-0000-000000000000	15	tnjyliropmud	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-01 17:12:07.858104+00	2026-10-01 17:12:07.858104+00	\N	12ab05a3-601c-4192-b717-cde6137b9606
00000000-0000-0000-0000-000000000000	16	vew6kjw2ummz	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-01 17:45:36.812624+00	2026-10-01 17:45:36.812624+00	\N	ec262398-5bae-4142-b1de-4d8456fa942c
00000000-0000-0000-0000-000000000000	17	ee7crvpe32fr	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-01 18:01:03.582804+00	2026-10-02 04:59:09.139521+00	\N	2e23ae4a-478b-4781-b893-a967244ee193
00000000-0000-0000-0000-000000000000	18	c4psde4wqxny	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-02 04:59:09.156911+00	2026-10-02 04:59:09.156911+00	ee7crvpe32fr	2e23ae4a-478b-4781-b893-a967244ee193
00000000-0000-0000-0000-000000000000	357	eotofsvyk24k	c4c69450-28cc-42be-9504-d996447434ac	t	2026-11-10 18:51:13.989856+00	2026-11-11 04:24:10.509992+00	ikexit3f4hmo	f7e895a4-14c6-4e94-919a-2c74cf0f9772
00000000-0000-0000-0000-000000000000	19	yovfzhyxeia5	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-02 04:59:25.000803+00	2026-10-02 08:19:28.658811+00	\N	acb1eeaa-01e4-4686-89a9-c913d85da4e5
00000000-0000-0000-0000-000000000000	20	zv7hufjhnb67	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-02 08:19:28.675117+00	2026-10-02 08:19:28.675117+00	yovfzhyxeia5	acb1eeaa-01e4-4686-89a9-c913d85da4e5
00000000-0000-0000-0000-000000000000	344	vmnxrezsyshs	4f1a06ac-c24e-4f9b-a182-452005a974a5	t	2026-11-10 12:30:23.856543+00	2026-11-11 06:38:22.37768+00	\N	e3e3349f-adff-4700-94ae-bdeeb2680b39
00000000-0000-0000-0000-000000000000	21	moe2aboccteq	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-02 08:19:33.008536+00	2026-10-02 10:06:29.952568+00	\N	916b70c9-aae2-41d7-a88b-c05585bb63ae
00000000-0000-0000-0000-000000000000	380	6is2pdtiiykt	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-11-11 14:39:18.629289+00	2026-11-11 14:39:18.629289+00	tnvfsaf6u6rw	b231d35a-6002-422c-8466-1e323df1da5e
00000000-0000-0000-0000-000000000000	22	xah33usuzyxr	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-02 10:06:29.96858+00	2026-10-02 11:25:45.635556+00	moe2aboccteq	916b70c9-aae2-41d7-a88b-c05585bb63ae
00000000-0000-0000-0000-000000000000	23	hwpyzw6sbwr6	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-02 11:25:45.650815+00	2026-10-02 11:25:45.650815+00	xah33usuzyxr	916b70c9-aae2-41d7-a88b-c05585bb63ae
00000000-0000-0000-0000-000000000000	24	xwnkk3frr4sy	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-02 11:26:17.220347+00	2026-10-02 12:44:33.413028+00	\N	2350b235-dc0d-43f0-8ce0-5a89736873bf
00000000-0000-0000-0000-000000000000	25	shfplxcfbxsw	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-02 12:44:33.431177+00	2026-10-02 12:44:33.431177+00	xwnkk3frr4sy	2350b235-dc0d-43f0-8ce0-5a89736873bf
00000000-0000-0000-0000-000000000000	26	j3hm4f5irkgr	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-02 12:45:12.401834+00	2026-10-02 12:45:12.401834+00	\N	50b573d6-9909-4027-b283-6cce2a7ae723
00000000-0000-0000-0000-000000000000	27	i5w3nxtqqd75	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-02 12:55:41.018462+00	2026-10-02 12:55:41.018462+00	\N	d512471d-51cb-44eb-a9b2-1843c63af10d
00000000-0000-0000-0000-000000000000	28	zje4yd6jziu2	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-02 13:09:40.075322+00	2026-10-02 13:09:40.075322+00	\N	42e84ec3-da29-4163-b1c1-fe5a8229534f
00000000-0000-0000-0000-000000000000	29	xfb4vdidiayo	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-02 13:18:13.887121+00	2026-10-02 13:18:13.887121+00	\N	b8f04710-38bf-4684-9c07-5bc2200af4cb
00000000-0000-0000-0000-000000000000	10	oftgzpjg5ft6	4f1a06ac-c24e-4f9b-a182-452005a974a5	t	2026-10-01 14:47:09.02467+00	2026-10-02 13:20:16.014162+00	\N	98dbc0a3-2db5-4014-8723-54ca5d36ac52
00000000-0000-0000-0000-000000000000	30	oh4zircmotjq	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 13:20:16.019551+00	2026-10-02 13:20:16.019551+00	oftgzpjg5ft6	98dbc0a3-2db5-4014-8723-54ca5d36ac52
00000000-0000-0000-0000-000000000000	31	mcdxsbqzj7xu	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 13:20:19.969934+00	2026-10-02 13:20:19.969934+00	\N	e9752531-06e4-4b2c-9e85-a9a303da0394
00000000-0000-0000-0000-000000000000	381	xdpvizw6fz5r	c4c69450-28cc-42be-9504-d996447434ac	t	2026-11-11 14:39:37.729076+00	2026-11-11 17:11:50.255901+00	\N	78ae9374-87fb-49ce-bcd6-dc76cb3ef781
00000000-0000-0000-0000-000000000000	35	7vkye7quokmt	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-02 13:26:25.536704+00	2026-10-02 13:26:25.536704+00	\N	aff9f2c7-92e8-42f6-a739-89f9fc82f773
00000000-0000-0000-0000-000000000000	37	nbxaayld3j5v	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 13:28:17.07022+00	2026-10-02 13:28:17.07022+00	\N	4cb51e8b-cc45-4333-8adb-1e1360dda7b5
00000000-0000-0000-0000-000000000000	38	i6fwayzoxs6z	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-02 13:31:52.87438+00	2026-10-02 13:31:52.87438+00	\N	1dcb99cc-333b-474b-825b-3e65ce6881f7
00000000-0000-0000-0000-000000000000	39	gkjmrqio5urk	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 13:57:39.811721+00	2026-10-02 13:57:39.811721+00	\N	b8d5df3a-809f-4a23-84f5-6e7b3b3ce64e
00000000-0000-0000-0000-000000000000	40	tdckmpq5qq2b	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 14:11:15.523905+00	2026-10-02 14:11:15.523905+00	\N	1ac316bf-26b3-440f-afe0-b6d276e7e5bf
00000000-0000-0000-0000-000000000000	41	dcmhttge4wt2	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 14:22:31.732035+00	2026-10-02 14:22:31.732035+00	\N	2a1d7c0c-34c6-4bb3-935f-c797f5417468
00000000-0000-0000-0000-000000000000	42	f3xoyakae6ev	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 14:39:46.022143+00	2026-10-02 14:39:46.022143+00	\N	13b6f527-404a-42a1-a062-1c20c64f3b48
00000000-0000-0000-0000-000000000000	43	5eibyvt2ocsb	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 14:57:34.04643+00	2026-10-02 14:57:34.04643+00	\N	ad4221da-2b5b-44cf-a4bf-2a9c07a4e65d
00000000-0000-0000-0000-000000000000	44	walr7drhwcso	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-02 14:57:49.454383+00	2026-10-02 14:57:49.454383+00	\N	5a3f491f-e516-44f3-8990-2e8076d639ce
00000000-0000-0000-0000-000000000000	45	46sqyf3ss3gh	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 14:59:18.233736+00	2026-10-02 14:59:18.233736+00	\N	b5a77ef9-0242-4652-8655-4503998c15d5
00000000-0000-0000-0000-000000000000	46	wrew4wzuexzt	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 15:05:29.299795+00	2026-10-02 15:05:29.299795+00	\N	b1a95302-6c07-48c6-8fea-aa883a90cac7
00000000-0000-0000-0000-000000000000	2	atqca5xcgr5z	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-01 10:05:56.003852+00	2026-10-05 08:07:04.865415+00	\N	71b60e40-665f-4e14-988e-7f2b75f771c4
00000000-0000-0000-0000-000000000000	342	fxnvuw5nzt5m	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-19 19:38:28.662453+00	2026-10-19 19:38:28.662453+00	\N	cfa28041-6456-439b-a1bd-122c7966cf3e
00000000-0000-0000-0000-000000000000	345	diwe64v573x5	c4c69450-28cc-42be-9504-d996447434ac	t	2026-11-10 13:18:16.04682+00	2026-11-10 14:43:53.367619+00	\N	0ddfc4ca-9fcc-4d1b-8bc1-08115fb4c232
00000000-0000-0000-0000-000000000000	50	b6we2v6ivc54	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 15:47:53.581971+00	2026-10-02 15:47:53.581971+00	\N	fd0d4510-716f-49c5-a7ab-b9ce98eb1fc4
00000000-0000-0000-0000-000000000000	51	aa6ab3dwnbpa	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 15:52:05.263602+00	2026-10-02 15:52:05.263602+00	\N	7cc04f1f-ea99-43ff-ba5a-3c93d9f89247
00000000-0000-0000-0000-000000000000	52	abfxl3qepmv4	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-02 15:55:01.781983+00	2026-10-02 15:55:01.781983+00	\N	eac8ce35-f811-4381-b33e-1d2818008601
00000000-0000-0000-0000-000000000000	358	utqrsv6f5vyq	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 04:24:10.530921+00	2026-11-11 04:24:10.530921+00	eotofsvyk24k	f7e895a4-14c6-4e94-919a-2c74cf0f9772
00000000-0000-0000-0000-000000000000	53	qomnrbtvaq2q	4f1a06ac-c24e-4f9b-a182-452005a974a5	t	2026-10-02 15:55:32.215514+00	2026-10-03 08:36:28.307926+00	\N	fb06cd9f-2590-41e6-96a6-75fe9d3b809d
00000000-0000-0000-0000-000000000000	54	enjcgaw7pudf	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-03 08:36:28.323199+00	2026-10-03 08:36:28.323199+00	qomnrbtvaq2q	fb06cd9f-2590-41e6-96a6-75fe9d3b809d
00000000-0000-0000-0000-000000000000	55	f2kluraultcl	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-03 08:36:48.538124+00	2026-10-03 08:36:48.538124+00	\N	80e7fb92-a4b9-4181-b90a-5264a4233f89
00000000-0000-0000-0000-000000000000	382	4zbwpifk4sua	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 17:11:50.276653+00	2026-11-11 17:11:50.276653+00	xdpvizw6fz5r	78ae9374-87fb-49ce-bcd6-dc76cb3ef781
00000000-0000-0000-0000-000000000000	57	mj245ospgfuz	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-03 09:06:48.781932+00	2026-10-03 09:06:48.781932+00	\N	a1dc30de-6d58-47df-961c-744714bd3733
00000000-0000-0000-0000-000000000000	383	xgxmw6eojaqe	c4c69450-28cc-42be-9504-d996447434ac	t	2026-11-11 17:11:54.385016+00	2026-11-12 05:10:14.732436+00	\N	1ec6d22a-0831-43e5-a132-40049a31608b
00000000-0000-0000-0000-000000000000	60	2utf5xpqbscx	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-03 09:18:35.581416+00	2026-10-03 09:18:35.581416+00	\N	f6e5ba86-1a31-4605-85e2-41d8c49ee560
00000000-0000-0000-0000-000000000000	62	hsjvoqbc5o5t	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 09:41:13.995199+00	2026-10-03 09:41:13.995199+00	\N	1d5d0c0a-3674-405b-8b2c-ad55c393ab65
00000000-0000-0000-0000-000000000000	63	qz4uprtp7bla	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 10:05:57.605275+00	2026-10-03 10:05:57.605275+00	\N	5a7f5ff9-838e-4cc2-8a45-7fe717e42f4d
00000000-0000-0000-0000-000000000000	64	a6beb2vpoeig	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 10:13:27.48976+00	2026-10-03 10:13:27.48976+00	\N	492818ea-e719-4d86-aa85-09c22704202d
00000000-0000-0000-0000-000000000000	65	o24jtos6pouy	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 10:19:57.104199+00	2026-10-03 10:19:57.104199+00	\N	ae167278-7876-461d-92dd-58bcdf3e0ab6
00000000-0000-0000-0000-000000000000	67	go22l5hoc5xu	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-03 10:30:25.251216+00	2026-10-03 10:30:25.251216+00	\N	ab1feeb4-c09b-49f8-8910-7cdafe7b4d0c
00000000-0000-0000-0000-000000000000	69	mrizxa4wvlp6	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-03 10:31:24.960519+00	2026-10-03 10:31:24.960519+00	\N	beda3b1b-83a8-4dd1-9326-113bbc4280e6
00000000-0000-0000-0000-000000000000	71	cqeaqnlxqrsr	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 10:32:04.598527+00	2026-10-03 10:32:04.598527+00	\N	6a4d429e-a8da-4ce1-b3f7-151ff696c98b
00000000-0000-0000-0000-000000000000	72	alr2psybw7ae	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-03 11:08:26.680486+00	2026-10-03 11:08:26.680486+00	\N	80cda575-42dd-4764-8326-3912c146ee65
00000000-0000-0000-0000-000000000000	74	s6oavlo4zmzb	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-03 11:10:08.18928+00	2026-10-03 11:10:08.18928+00	\N	2b1e80ee-5dd9-447c-80c5-6bc3ca983d89
00000000-0000-0000-0000-000000000000	76	ntz2h3gphl4a	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 11:10:49.958312+00	2026-10-03 11:10:49.958312+00	\N	31305d80-4e13-46c9-82ef-40ec070be83d
00000000-0000-0000-0000-000000000000	77	ancjssl4g54o	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 11:25:55.043204+00	2026-10-03 11:25:55.043204+00	\N	cdbb30e8-39fa-4680-9c70-803a137924f3
00000000-0000-0000-0000-000000000000	78	27vagi3igsac	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 11:43:14.403997+00	2026-10-03 11:43:14.403997+00	\N	74539d49-ac4d-425a-87ca-a013bf9956b7
00000000-0000-0000-0000-000000000000	79	6cigzxqh4hap	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 11:49:11.49893+00	2026-10-03 11:49:11.49893+00	\N	326eb931-3b23-4161-aae8-9b79189c0ccc
00000000-0000-0000-0000-000000000000	80	ozbc5vrfxsf6	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 11:52:32.056619+00	2026-10-03 11:52:32.056619+00	\N	20c6b2e4-efa4-4872-a278-5ff45b957f68
00000000-0000-0000-0000-000000000000	81	jwa555gm7x67	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-03 12:08:44.170399+00	2026-10-03 12:08:44.170399+00	\N	d1c3e14e-557b-46a3-b917-e448806a9e31
00000000-0000-0000-0000-000000000000	85	rwi6pouwnmnk	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-03 12:20:51.315028+00	2026-10-03 12:20:51.315028+00	\N	d7f8dcf3-5390-492e-8a43-205cb0891dd9
00000000-0000-0000-0000-000000000000	87	mzfo5tvrj4zx	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-03 12:31:20.554489+00	2026-10-03 13:35:15.575134+00	\N	afa17a86-39f4-4e8a-ad45-2a45bb12b133
00000000-0000-0000-0000-000000000000	88	kbe5i2kbpkey	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 13:35:15.582682+00	2026-10-03 13:35:15.582682+00	mzfo5tvrj4zx	afa17a86-39f4-4e8a-ad45-2a45bb12b133
00000000-0000-0000-0000-000000000000	97	kk5obexsdxjt	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 14:17:54.348352+00	2026-10-03 14:17:54.348352+00	\N	330665d1-1cbf-427d-851b-5de42bc3d269
00000000-0000-0000-0000-000000000000	98	ovrv3ecgqyfk	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 14:33:03.127263+00	2026-10-03 14:33:03.127263+00	\N	0f21f9ab-09b6-46f4-951f-e97324f7229b
00000000-0000-0000-0000-000000000000	99	rtrakkdvyc6c	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 14:33:43.638724+00	2026-10-03 14:33:43.638724+00	\N	4ad2dd70-c6c1-4c6e-b51c-bef57ec6ded3
00000000-0000-0000-0000-000000000000	100	yvt73xybr2l7	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 14:41:16.255914+00	2026-10-03 14:41:16.255914+00	\N	ea0cb053-3991-47e3-abe3-4fccea468f8e
00000000-0000-0000-0000-000000000000	101	fisyeelu3oxw	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 14:41:39.626182+00	2026-10-03 14:41:39.626182+00	\N	f47b48d0-0d47-4d5a-8a72-766e7778a22b
00000000-0000-0000-0000-000000000000	102	kavqb6qxuquj	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 14:42:26.626325+00	2026-10-03 14:42:26.626325+00	\N	b40e60aa-074b-410b-96bd-bc88e6fe2bba
00000000-0000-0000-0000-000000000000	103	ghaxtlzhq26i	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 14:44:52.504735+00	2026-10-03 14:44:52.504735+00	\N	8fe078c7-7f81-4d6e-8b86-b27199ddd597
00000000-0000-0000-0000-000000000000	346	vk3txaregq3e	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-10 14:43:53.380917+00	2026-11-10 14:43:53.380917+00	diwe64v573x5	0ddfc4ca-9fcc-4d1b-8bc1-08115fb4c232
00000000-0000-0000-0000-000000000000	104	yepoczoskfag	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-03 14:46:15.257913+00	2026-10-03 17:24:30.404794+00	\N	832d8f56-dd1a-46bb-9ee4-1589347029fa
00000000-0000-0000-0000-000000000000	105	6ymvpcuxi76q	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-03 17:24:30.424955+00	2026-10-03 17:24:30.424955+00	yepoczoskfag	832d8f56-dd1a-46bb-9ee4-1589347029fa
00000000-0000-0000-0000-000000000000	359	z3nbmkxbzcvf	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 05:19:18.351099+00	2026-11-11 05:19:18.351099+00	\N	8a913bdc-b155-45d5-a071-d9af21a8e405
00000000-0000-0000-0000-000000000000	360	j5nh27fxk2ch	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 05:19:20.561763+00	2026-11-11 05:19:20.561763+00	\N	7707aeb5-3b48-4fb8-a88f-ec2f96d6a1bd
00000000-0000-0000-0000-000000000000	362	4u4fu5yfqgfl	55922adc-b83d-4add-af23-13af5af5393e	f	2026-11-11 05:21:04.314863+00	2026-11-11 05:21:04.314863+00	\N	1c49526f-9140-43cc-b5c0-94a201d63091
00000000-0000-0000-0000-000000000000	363	db77iowac6cg	55922adc-b83d-4add-af23-13af5af5393e	f	2026-11-11 05:21:44.913074+00	2026-11-11 05:21:44.913074+00	\N	9d9e5540-9752-4d65-85be-347f9eb1f677
00000000-0000-0000-0000-000000000000	384	qn7xd5itb7dy	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-12 05:10:14.758253+00	2026-11-12 05:10:14.758253+00	xgxmw6eojaqe	1ec6d22a-0831-43e5-a132-40049a31608b
00000000-0000-0000-0000-000000000000	385	nkzc62ysjhke	c4c69450-28cc-42be-9504-d996447434ac	t	2026-11-12 05:10:17.154944+00	2026-11-12 09:28:15.810882+00	\N	6672c9b3-3dcb-48b4-a421-d4f27c1e1c6a
00000000-0000-0000-0000-000000000000	114	gkis4ifo5cfk	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 12:25:28.484168+00	2026-10-04 12:25:28.484168+00	\N	9113de67-7b4a-4562-a135-5751e7a91b8b
00000000-0000-0000-0000-000000000000	116	6shbkwljbq4p	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-04 12:50:54.626959+00	2026-10-04 12:50:54.626959+00	\N	5f807f02-16c1-439b-9094-32d7e1443bae
00000000-0000-0000-0000-000000000000	123	bhj7vf7yooie	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-04 14:12:11.203245+00	2026-10-04 14:12:11.203245+00	\N	9619c98e-451f-4eef-b00d-62acb991f641
00000000-0000-0000-0000-000000000000	124	d7qb4kh3gyjh	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-04 14:17:42.217303+00	2026-10-04 14:17:42.217303+00	\N	99ebf234-20f4-4609-8052-cf11b2f13686
00000000-0000-0000-0000-000000000000	125	uarmbbp74elu	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-04 14:17:57.866445+00	2026-10-04 14:17:57.866445+00	\N	20fbc2aa-a99f-406d-a1e8-32c3bad10704
00000000-0000-0000-0000-000000000000	127	jylaxxvwfior	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-04 14:18:44.032952+00	2026-10-04 14:18:44.032952+00	\N	aa6c33a3-e06d-4f37-9de8-aa561ceb6544
00000000-0000-0000-0000-000000000000	128	t3mheecp3eas	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-04 14:19:46.158963+00	2026-10-04 14:19:46.158963+00	\N	549e310f-721e-489c-9218-eb655f145f13
00000000-0000-0000-0000-000000000000	129	muxveafst23k	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 14:36:59.079776+00	2026-10-04 14:36:59.079776+00	\N	85410700-193e-423d-b792-86b00a7a6ba2
00000000-0000-0000-0000-000000000000	130	js3tej7i76is	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 14:37:09.319151+00	2026-10-04 14:37:09.319151+00	\N	82c506c6-88d8-465c-b086-595c87f5cea7
00000000-0000-0000-0000-000000000000	131	zoeoty6bbwh5	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 14:42:08.272992+00	2026-10-04 14:42:08.272992+00	\N	eae2cced-5d3d-43c8-abb7-71d0f146577d
00000000-0000-0000-0000-000000000000	132	dm2ietzm4cgu	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 14:50:15.455898+00	2026-10-04 14:50:15.455898+00	\N	5d2556b2-96cb-4f24-8067-8dbd43f0530b
00000000-0000-0000-0000-000000000000	133	krsfvlu3hgfw	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 15:02:18.515009+00	2026-10-04 15:02:18.515009+00	\N	729fa231-cc2c-4783-a70a-02e6a854dba0
00000000-0000-0000-0000-000000000000	134	kyoedorufymd	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 15:02:31.168059+00	2026-10-04 15:02:31.168059+00	\N	f8f4d2b5-4cdb-4fb2-bb8f-94bb804fc47e
00000000-0000-0000-0000-000000000000	135	xzanvazs73vk	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 15:02:52.562275+00	2026-10-04 15:02:52.562275+00	\N	568437b1-7d6f-40bd-acc0-82087a75d01a
00000000-0000-0000-0000-000000000000	136	hl6di5incrlf	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-04 15:03:30.154759+00	2026-10-04 15:03:30.154759+00	\N	26994e7e-d9f4-47c7-b77f-7108f0457826
00000000-0000-0000-0000-000000000000	137	bjr6j5xq4hxs	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 15:15:13.81129+00	2026-10-04 15:15:13.81129+00	\N	8c42e873-9a26-4d58-a61a-3127fb569881
00000000-0000-0000-0000-000000000000	138	xli66gtuwlgd	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 15:15:57.573743+00	2026-10-04 15:15:57.573743+00	\N	67070928-72e5-4809-bb4e-ebd3074a41ed
00000000-0000-0000-0000-000000000000	139	ef6ultzvhaku	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 15:20:49.812628+00	2026-10-04 15:20:49.812628+00	\N	7ac06bf4-b5ed-49c3-9143-33100491fac5
00000000-0000-0000-0000-000000000000	140	hugjck4lstbp	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 15:21:06.894763+00	2026-10-04 15:21:06.894763+00	\N	7da5ddc2-d6e6-41fa-becd-feaad7894f9d
00000000-0000-0000-0000-000000000000	141	tlviwhsv3fmh	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 15:36:29.175221+00	2026-10-04 15:36:29.175221+00	\N	09f11da7-875d-4432-861f-8092d3ecb0b8
00000000-0000-0000-0000-000000000000	142	oxffyg4mgncp	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 15:45:39.894788+00	2026-10-04 15:45:39.894788+00	\N	4570c472-c181-41ae-a037-19337ae83385
00000000-0000-0000-0000-000000000000	143	4rpvahirvwlc	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 16:05:25.46926+00	2026-10-04 16:05:25.46926+00	\N	1bddb0b2-12fe-4e5f-b73a-78b9d056f6b0
00000000-0000-0000-0000-000000000000	144	d7iibbdb2z7h	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-04 16:28:49.104601+00	2026-10-04 16:28:49.104601+00	\N	9f6e4c46-d1b4-4b98-9f2f-774a835f5daa
00000000-0000-0000-0000-000000000000	147	3g56g2g6bhbz	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-04 17:18:01.075439+00	2026-10-04 17:18:01.075439+00	\N	5bbc6824-73b6-4ae3-a356-556bdaa53516
00000000-0000-0000-0000-000000000000	148	wmevjyec6kil	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-04 17:18:25.243894+00	2026-10-04 17:18:25.243894+00	\N	cced56a7-58cf-4dd0-b3a2-60d90653854e
00000000-0000-0000-0000-000000000000	151	4bhspwvyqk5b	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-05 04:34:41.983914+00	2026-10-05 04:34:41.983914+00	\N	cabba20f-5329-4da4-981f-76bfb3f883b5
00000000-0000-0000-0000-000000000000	153	mqryhcj5ikbw	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-05 04:39:43.485186+00	2026-10-05 04:39:43.485186+00	\N	b2fe3032-3d3c-45d1-8a4a-eead94a8cb59
00000000-0000-0000-0000-000000000000	154	bwbzzdn57mrl	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-05 05:15:39.924843+00	2026-10-05 05:15:39.924843+00	\N	dfcd9080-c014-48e8-a1db-360c92cdfaf8
00000000-0000-0000-0000-000000000000	156	6ko6w7nvdcva	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-05 05:17:02.041037+00	2026-10-05 05:17:02.041037+00	\N	d7ae4270-6b90-4f43-a594-33d7435d6603
00000000-0000-0000-0000-000000000000	347	i6hapescr2a5	c4c69450-28cc-42be-9504-d996447434ac	t	2026-11-10 14:56:21.142491+00	2026-11-10 16:24:06.371723+00	\N	b648d219-42d2-4df7-84cc-2f3093a25194
00000000-0000-0000-0000-000000000000	364	eakmpt7oqw7k	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 06:33:40.170829+00	2026-11-11 06:33:40.170829+00	l2lfkn5dfta7	c3a0b8d9-3055-486f-9ab5-cb5f4b184048
00000000-0000-0000-0000-000000000000	157	ud3w4qk5u25t	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-05 05:17:25.709917+00	2026-10-05 08:12:31.374333+00	\N	e5458796-ba2b-45df-89f0-f9784374bf5e
00000000-0000-0000-0000-000000000000	159	rw7hhtrbphko	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-05 08:12:31.381038+00	2026-10-05 08:12:31.381038+00	ud3w4qk5u25t	e5458796-ba2b-45df-89f0-f9784374bf5e
00000000-0000-0000-0000-000000000000	365	r4xd4nqonhaf	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 06:33:57.953925+00	2026-11-11 06:33:57.953925+00	\N	740744d2-1f14-4099-a8f3-d90136c50705
00000000-0000-0000-0000-000000000000	161	6ecpxsrpcxah	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-05 08:14:49.100655+00	2026-10-05 08:14:49.100655+00	\N	6b759e5f-9fb8-45d3-a317-07b1d9b497e7
00000000-0000-0000-0000-000000000000	386	vctrnibhqhps	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-12 09:28:15.827386+00	2026-11-12 09:28:15.827386+00	nkzc62ysjhke	6672c9b3-3dcb-48b4-a421-d4f27c1e1c6a
00000000-0000-0000-0000-000000000000	164	z4nm5zovqhai	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-05 08:23:00.010086+00	2026-10-05 08:23:00.010086+00	\N	68b2e11f-93bb-431a-8f1e-bcf99ee7df94
00000000-0000-0000-0000-000000000000	165	s3ye6vyjxrir	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-05 08:23:33.934864+00	2026-10-05 08:23:33.934864+00	\N	94cc688a-9a56-45be-b442-a4867ace16da
00000000-0000-0000-0000-000000000000	166	ypvzseiwo3gn	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-05 08:25:48.829151+00	2026-10-05 08:25:48.829151+00	\N	3314b28b-4dbf-46de-8339-d40ea6b6a7ef
00000000-0000-0000-0000-000000000000	387	ls7dhccjlu7u	c4c69450-28cc-42be-9504-d996447434ac	t	2026-11-12 09:28:18.155231+00	2026-11-12 12:12:42.900735+00	\N	545c700d-26f9-4421-b1e5-292e422a4c68
00000000-0000-0000-0000-000000000000	168	sib3ljhbvsf5	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-05 08:35:25.118167+00	2026-10-05 08:35:25.118167+00	\N	3d0d5200-dcb1-4fed-b959-3009fcf8eda3
00000000-0000-0000-0000-000000000000	170	6m3ddpl7f5ql	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-05 08:36:59.361425+00	2026-10-05 08:36:59.361425+00	\N	bdbbe16f-14a5-4d9e-9537-c67940c77436
00000000-0000-0000-0000-000000000000	172	zdab36ukx2yw	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-05 08:38:07.294098+00	2026-10-05 08:38:07.294098+00	\N	8655c5ac-372e-4514-bbd1-57f859a1e3f6
00000000-0000-0000-0000-000000000000	173	47433vile3q3	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-05 08:38:35.366067+00	2026-10-05 08:38:35.366067+00	\N	a168e756-c665-45c1-8887-f7d120de6cba
00000000-0000-0000-0000-000000000000	178	zzef2t3ddfcg	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 06:24:49.14607+00	2026-10-06 06:24:49.14607+00	\N	8b074cbe-bf1e-40bd-a580-968939ee7b2a
00000000-0000-0000-0000-000000000000	179	zaz7jfpgoue4	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-06 06:26:47.678514+00	2026-10-06 06:26:47.678514+00	\N	5aa2cd3d-e57c-4fa8-8087-9d6bd8048413
00000000-0000-0000-0000-000000000000	180	2srx4hbvanb2	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 06:27:24.213372+00	2026-10-06 06:27:24.213372+00	\N	776cec92-66eb-453b-b3f6-6e0be8280b34
00000000-0000-0000-0000-000000000000	182	wjycsbcuequk	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-06 06:30:41.472397+00	2026-10-06 06:30:41.472397+00	\N	382525eb-2410-405c-b3b1-0430a2a04171
00000000-0000-0000-0000-000000000000	183	z7jnjryhyjlt	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 06:31:33.277078+00	2026-10-06 06:31:33.277078+00	\N	e31abfbc-2d91-4972-a0b8-4b0c56bc0cb3
00000000-0000-0000-0000-000000000000	185	idenoqsobcsk	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 06:35:38.972766+00	2026-10-06 06:35:38.972766+00	\N	58f04d13-7dc9-484f-999b-48f27fe217a9
00000000-0000-0000-0000-000000000000	186	mgtunthmzrkf	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 06:38:25.530911+00	2026-10-06 06:38:25.530911+00	\N	25321602-17e4-4289-9a92-d25403e3d452
00000000-0000-0000-0000-000000000000	187	egn55y4rapcu	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 06:55:12.898832+00	2026-10-06 06:55:12.898832+00	\N	ede92149-0c8c-4c88-bee7-bbe7f7522804
00000000-0000-0000-0000-000000000000	188	3z52z4jwzcys	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 06:58:20.541966+00	2026-10-06 06:58:20.541966+00	\N	31c3ee89-925d-4089-9851-a70f4aa9fb61
00000000-0000-0000-0000-000000000000	190	ncoy4pyehzpg	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 07:09:21.949841+00	2026-10-06 07:09:21.949841+00	\N	77994cad-76f4-44e8-b6c2-c0e20f582962
00000000-0000-0000-0000-000000000000	191	4fjtoh4ceazp	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 07:09:36.531679+00	2026-10-06 07:09:36.531679+00	\N	55b708f3-40dd-465a-aa7f-5526398ee7ed
00000000-0000-0000-0000-000000000000	192	wjcdgjelm3gt	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 07:19:50.24755+00	2026-10-06 07:19:50.24755+00	\N	e35d5324-8b82-4880-b238-8ece0555005c
00000000-0000-0000-0000-000000000000	195	jx4xhekn7xtb	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 07:35:53.47617+00	2026-10-06 07:35:53.47617+00	\N	630f9b48-9e80-44dc-bc1e-17cec65c1901
00000000-0000-0000-0000-000000000000	196	j7uvxjd7ca7j	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 07:35:53.476616+00	2026-10-06 07:35:53.476616+00	\N	83a65ae7-53c5-4b1f-9c31-94321c4869c7
00000000-0000-0000-0000-000000000000	194	x3l35egl5d5l	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 07:35:53.475787+00	2026-10-06 07:35:53.475787+00	\N	84d2ddd5-9e6c-4a1e-bb24-9456296161ad
00000000-0000-0000-0000-000000000000	197	rjaj5qge6e7x	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 07:35:53.47668+00	2026-10-06 07:35:53.47668+00	\N	eddafa2f-81ac-4806-9515-624fe086384f
00000000-0000-0000-0000-000000000000	158	h36ocklci5aw	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-05 08:07:04.886623+00	2026-10-08 07:21:25.152093+00	atqca5xcgr5z	71b60e40-665f-4e14-988e-7f2b75f771c4
00000000-0000-0000-0000-000000000000	348	zwctjro6c34o	c4c69450-28cc-42be-9504-d996447434ac	t	2026-11-10 16:24:06.393745+00	2026-11-10 17:36:23.70228+00	i6hapescr2a5	b648d219-42d2-4df7-84cc-2f3093a25194
00000000-0000-0000-0000-000000000000	366	yqv3bg55ejzh	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 06:36:36.253038+00	2026-11-11 06:36:36.253038+00	\N	11642e0b-2032-4122-aaf8-ff6eec0038c1
00000000-0000-0000-0000-000000000000	388	io5wnfvc5l4x	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-12 12:12:42.910006+00	2026-11-12 12:12:42.910006+00	ls7dhccjlu7u	545c700d-26f9-4421-b1e5-292e422a4c68
00000000-0000-0000-0000-000000000000	389	qhaqzggv6hsk	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-12 12:13:22.535254+00	2026-11-12 12:13:22.535254+00	\N	d726d3c5-fec8-4af3-bb82-1f13db4aee09
00000000-0000-0000-0000-000000000000	390	dxd3v7tk44r7	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-12 12:13:32.548365+00	2026-11-12 12:13:32.548365+00	\N	6f5efa03-84f2-4e3b-80cc-0d08aba8f224
00000000-0000-0000-0000-000000000000	349	omjsk4hm2e6s	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-10 17:01:30.636183+00	2026-11-10 17:01:30.636183+00	\N	1a5f323c-3b32-4f5d-808e-0d3bb4a9e949
00000000-0000-0000-0000-000000000000	350	vqsidum5xx7e	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-10 17:01:33.466645+00	2026-11-10 17:01:33.466645+00	\N	001e65ea-d5d5-4464-8b19-9bccffddddeb
00000000-0000-0000-0000-000000000000	367	kg3jibiopuyj	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 06:36:36.254635+00	2026-11-11 06:36:36.254635+00	\N	f2c3b864-78a5-4020-b871-961158cd0cba
00000000-0000-0000-0000-000000000000	369	t75vivzjxexp	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 06:37:32.777695+00	2026-11-11 06:37:32.777695+00	\N	9b836567-48c5-4769-8152-ec5d32492dc2
00000000-0000-0000-0000-000000000000	370	ani6zywn73e6	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 06:37:44.35756+00	2026-11-11 06:37:44.35756+00	\N	7976d2b8-e808-4b73-b737-9883a56e48bb
00000000-0000-0000-0000-000000000000	371	4vt6dda2a7wn	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-11-11 06:38:22.379633+00	2026-11-11 06:38:22.379633+00	vmnxrezsyshs	e3e3349f-adff-4700-94ae-bdeeb2680b39
00000000-0000-0000-0000-000000000000	372	eyzgl5lz3bpn	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 06:38:27.045227+00	2026-11-11 06:38:27.045227+00	\N	0fa0492d-4ae0-4ce5-bbfb-c6c266f619ba
00000000-0000-0000-0000-000000000000	352	treu7xea3lxk	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-11-10 17:06:15.151154+00	2026-11-10 17:06:15.151154+00	\N	e52aec42-67b4-4db5-9d46-3fa07842ecec
00000000-0000-0000-0000-000000000000	209	uruuq6tbtlby	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 08:26:33.859735+00	2026-10-06 08:26:33.859735+00	\N	b9143f7e-a644-4f73-a45e-8d4dfd736e6a
00000000-0000-0000-0000-000000000000	210	yvhzurxwkibh	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-06 08:26:50.0378+00	2026-10-06 08:26:50.0378+00	\N	ec9ac37e-4c8c-4c3d-950f-53ca0a4a8448
00000000-0000-0000-0000-000000000000	373	iifglwzpky4t	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 06:46:23.790932+00	2026-11-11 06:46:23.790932+00	\N	0fc1a666-5b89-4225-bba2-4e0f3fad6f84
00000000-0000-0000-0000-000000000000	212	s6ixnx63bwpr	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-08 07:21:25.162088+00	2026-10-08 07:21:25.162088+00	h36ocklci5aw	71b60e40-665f-4e14-988e-7f2b75f771c4
00000000-0000-0000-0000-000000000000	213	a4r5mz6t6btr	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-08 07:21:39.182309+00	2026-10-08 07:21:39.182309+00	\N	52fda7cc-edff-4e8f-944b-019238f8948b
00000000-0000-0000-0000-000000000000	214	d2eqlo6n5s46	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-08 07:22:38.69097+00	2026-10-08 07:22:38.69097+00	\N	6c08c2df-5a5f-476f-a098-de6f0786e3f6
00000000-0000-0000-0000-000000000000	211	tgtv5i6xcdz7	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-06 08:28:01.598897+00	2026-10-08 07:32:59.553382+00	\N	281e2147-79b1-41f1-9b7f-698b8539dced
00000000-0000-0000-0000-000000000000	216	4rvmq7pakkwa	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-08 07:32:59.562002+00	2026-10-08 07:32:59.562002+00	tgtv5i6xcdz7	281e2147-79b1-41f1-9b7f-698b8539dced
00000000-0000-0000-0000-000000000000	374	yx2goxsvgwvp	c4c69450-28cc-42be-9504-d996447434ac	t	2026-11-11 06:46:38.021806+00	2026-11-11 12:38:15.605066+00	\N	e641a462-d895-4e7b-8abc-c1f4281f345d
00000000-0000-0000-0000-000000000000	221	en6kc2f7qd7z	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 00:42:30.808106+00	2026-10-09 00:42:30.808106+00	\N	a4c910a7-b1d7-45f8-b6d1-1d9ea6268cc9
00000000-0000-0000-0000-000000000000	222	e7twvbxvgkt5	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 00:42:45.836359+00	2026-10-09 00:42:45.836359+00	\N	f698bc02-62b2-427f-b404-ceac702c6ae7
00000000-0000-0000-0000-000000000000	223	2hnseuw3gmk5	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 00:43:08.83504+00	2026-10-09 00:43:08.83504+00	\N	6f53b655-7386-48ea-8470-129d0628b635
00000000-0000-0000-0000-000000000000	224	vfvtqspvywau	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 00:44:05.821061+00	2026-10-09 00:44:05.821061+00	\N	86b6251d-c28d-4b9b-acdb-af942f2f0225
00000000-0000-0000-0000-000000000000	225	f63dbjfaa3ph	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 01:08:34.760106+00	2026-10-09 01:08:34.760106+00	\N	9e13db4f-d8c6-490b-99d5-b61a35b3b537
00000000-0000-0000-0000-000000000000	226	fajfgnm2g7rb	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 01:14:17.976968+00	2026-10-09 01:14:17.976968+00	\N	a0eb411d-1fa6-42c3-bc5e-ff2b92a5e760
00000000-0000-0000-0000-000000000000	227	4hf7ixrbnlfz	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 01:22:26.505049+00	2026-10-09 01:22:26.505049+00	\N	2abeb091-5f53-4944-b3e3-e50714c18968
00000000-0000-0000-0000-000000000000	229	ohc4yv6bmf2i	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 01:39:54.36113+00	2026-10-09 01:39:54.36113+00	\N	822b05da-838c-429b-a28b-f07140ff8de8
00000000-0000-0000-0000-000000000000	231	w54hzwogtn4j	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 01:52:58.126344+00	2026-10-09 01:52:58.126344+00	\N	47530875-9fef-4b02-b0d9-25e5b288be2b
00000000-0000-0000-0000-000000000000	232	7kznhbjvmc57	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:00:47.688399+00	2026-10-09 02:00:47.688399+00	\N	9c43fc60-03e5-4b11-b20a-939c1afc3243
00000000-0000-0000-0000-000000000000	233	rbmyldec6qj6	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:07:29.499216+00	2026-10-09 02:07:29.499216+00	\N	723973a5-51e9-43c6-9d75-86937a7f0929
00000000-0000-0000-0000-000000000000	235	kopvlt5hldck	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:15:12.892329+00	2026-10-09 02:15:12.892329+00	\N	2d494578-53b4-4598-98a8-dd8afb819cea
00000000-0000-0000-0000-000000000000	236	bq4heu6ekvba	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:15:24.350441+00	2026-10-09 02:15:24.350441+00	\N	d24d0d05-4e58-4b28-acf4-f10d060b26c0
00000000-0000-0000-0000-000000000000	239	qjhrjc6auvxo	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:16:31.288032+00	2026-10-09 02:16:31.288032+00	\N	36d33bbe-d986-4c49-8d57-005684a4f5c1
00000000-0000-0000-0000-000000000000	240	iwdqytl4s3up	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:16:45.785596+00	2026-10-09 02:16:45.785596+00	\N	80b020ff-081b-481b-93ea-11dd2cc30afc
00000000-0000-0000-0000-000000000000	241	pugzklqszan4	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:17:08.587921+00	2026-10-09 02:17:08.587921+00	\N	1d0b1b82-e112-40da-8faa-1865baf14ceb
00000000-0000-0000-0000-000000000000	242	63ivxnxw43do	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:17:26.056823+00	2026-10-09 02:17:26.056823+00	\N	17146ab2-ae18-4d31-b9f1-9d4f5ae0e7f3
00000000-0000-0000-0000-000000000000	243	tvhj2ppidyiz	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:24:34.887235+00	2026-10-09 02:24:34.887235+00	\N	52475bd3-7f7e-4e1d-b26d-f722da09d7d4
00000000-0000-0000-0000-000000000000	244	mjgq3d37rsl3	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:29:04.464669+00	2026-10-09 02:29:04.464669+00	\N	5b811826-0e8a-4af8-9dfa-e4cb9472ed77
00000000-0000-0000-0000-000000000000	245	hvamod3lztye	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:34:01.66962+00	2026-10-09 02:34:01.66962+00	\N	95ebc9b9-6357-4c9d-8dbf-5c09e335e82d
00000000-0000-0000-0000-000000000000	246	auu6n5blwtvh	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:35:12.167164+00	2026-10-09 02:35:12.167164+00	\N	8f8dff8b-6461-4639-8cbc-1adef1309bba
00000000-0000-0000-0000-000000000000	248	l3vr5s3m6wap	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:36:11.672091+00	2026-10-09 02:36:11.672091+00	\N	09059048-ae1b-4ab3-a96a-35d3623cabb3
00000000-0000-0000-0000-000000000000	249	nodddexed4bl	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 02:36:24.994077+00	2026-10-09 02:36:24.994077+00	\N	9ade7d36-d2e8-4189-af4d-37cbcc5ec210
00000000-0000-0000-0000-000000000000	251	vzzjoqyzr7nk	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 02:37:57.708977+00	2026-10-09 02:37:57.708977+00	\N	7b471fa9-93e6-41ae-8a68-c24dbbce5d92
00000000-0000-0000-0000-000000000000	252	gvxh4admolqj	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 02:48:41.770268+00	2026-10-09 02:48:41.770268+00	\N	9d65a986-36d4-41fa-bb85-22990074d2bf
00000000-0000-0000-0000-000000000000	253	47tuwqthdz45	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 02:54:33.461154+00	2026-10-09 02:54:33.461154+00	\N	cba073f6-2a06-490f-9c15-d4c429a2b143
00000000-0000-0000-0000-000000000000	254	tg3sgy3qordh	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 02:57:55.834626+00	2026-10-09 02:57:55.834626+00	\N	be765b0a-d140-4f3c-8601-cfd3cea2dd1d
00000000-0000-0000-0000-000000000000	255	ydhfafvz3syl	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 03:06:28.021629+00	2026-10-09 03:06:28.021629+00	\N	55323181-75f1-4c55-addc-70c059727d6c
00000000-0000-0000-0000-000000000000	257	kisrtpnzjgkl	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 03:11:38.675884+00	2026-10-09 03:11:38.675884+00	\N	c88151f2-6df2-4012-93db-c6b0739558a2
00000000-0000-0000-0000-000000000000	260	d5u6axhfh2ml	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-09 03:34:53.964563+00	2026-10-09 05:35:47.147141+00	\N	70fbbcc4-e82c-4c28-9559-377f46574411
00000000-0000-0000-0000-000000000000	261	ftd4e6zmbtv7	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 05:35:47.169903+00	2026-10-09 05:35:47.169903+00	d5u6axhfh2ml	70fbbcc4-e82c-4c28-9559-377f46574411
00000000-0000-0000-0000-000000000000	262	ejreez3hum5j	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 05:36:15.809801+00	2026-10-09 05:36:15.809801+00	\N	33cc5a9a-5c45-423c-a083-3b5b4724485d
00000000-0000-0000-0000-000000000000	353	nr7wodkvmkcn	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-10 17:11:30.147843+00	2026-11-10 17:11:30.147843+00	\N	93b5ca69-d2cc-436e-8328-2010f8e566d0
00000000-0000-0000-0000-000000000000	264	hwma3a7kadgm	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 05:37:47.931693+00	2026-10-09 05:37:47.931693+00	\N	15a16863-5c6c-40b8-b56b-e7099529b009
00000000-0000-0000-0000-000000000000	265	u77q3qfykon6	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 05:42:21.096383+00	2026-10-09 05:42:21.096383+00	\N	3030d61c-8b04-4512-92fd-a736c1578b07
00000000-0000-0000-0000-000000000000	266	vvr44riqhpma	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 05:47:40.525077+00	2026-10-09 05:47:40.525077+00	\N	eb1dc3f7-4c2d-4d84-8058-1ca8f15658df
00000000-0000-0000-0000-000000000000	375	uwgowfv3ihvr	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 12:38:15.625084+00	2026-11-11 12:38:15.625084+00	yx2goxsvgwvp	e641a462-d895-4e7b-8abc-c1f4281f345d
00000000-0000-0000-0000-000000000000	376	mtjjbbmmhm4w	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 12:38:21.765168+00	2026-11-11 12:38:21.765168+00	\N	7f8b3c80-313a-4262-a710-45062f8f3815
00000000-0000-0000-0000-000000000000	269	eyx6f3ghhz4i	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 05:54:37.261681+00	2026-10-09 05:54:37.261681+00	\N	43010dc1-8f51-4642-9301-afc68bc037bc
00000000-0000-0000-0000-000000000000	273	3hqilfrv357g	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 07:24:31.800876+00	2026-10-09 07:24:31.800876+00	\N	3453bc56-9c8f-4bed-a748-f8fa75e04878
00000000-0000-0000-0000-000000000000	274	6zitltvpykea	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 07:24:41.915237+00	2026-10-09 07:24:41.915237+00	\N	2eded737-d339-45ad-89a2-2bdbe1f4bfec
00000000-0000-0000-0000-000000000000	281	fenofnilurbs	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 09:33:51.313343+00	2026-10-09 09:33:51.313343+00	\N	1a6650cb-4c0c-4359-814a-796d84cc53da
00000000-0000-0000-0000-000000000000	283	3bpwejimu7rv	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 09:59:22.782041+00	2026-10-09 09:59:22.782041+00	\N	ac0e8157-dc8a-46e3-aa2d-82cfa7b00838
00000000-0000-0000-0000-000000000000	284	fxdjkzsmv7pf	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 09:59:43.16243+00	2026-10-09 09:59:43.16243+00	\N	604d2f9a-b216-4d7e-ba86-d1dec751291d
00000000-0000-0000-0000-000000000000	285	epupkin6p2aq	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 09:59:45.400201+00	2026-10-09 09:59:45.400201+00	\N	c8ec3d73-1359-4336-8507-ccb8a6d086a9
00000000-0000-0000-0000-000000000000	286	p46bw2m7m5zo	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 09:59:45.406704+00	2026-10-09 09:59:45.406704+00	\N	4d9afe23-bfb0-467d-b8a5-0ee9bdbf38d4
00000000-0000-0000-0000-000000000000	287	wyarsl3oglle	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 09:59:45.872605+00	2026-10-09 09:59:45.872605+00	\N	e1e08d92-3b0c-4145-81fb-b38480e2dab3
00000000-0000-0000-0000-000000000000	288	7iaqdei5jkvi	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 09:59:45.883597+00	2026-10-09 09:59:45.883597+00	\N	5560f5c5-860b-4096-a155-53ad7dc3bdd9
00000000-0000-0000-0000-000000000000	289	amflvcpzoaxu	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 10:00:01.181046+00	2026-10-09 10:00:01.181046+00	\N	70f311ab-9418-4aa4-8955-ea2f3db9608d
00000000-0000-0000-0000-000000000000	301	owp7nf3u22rx	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 10:37:21.709026+00	2026-10-09 10:37:21.709026+00	\N	7d0edeec-bee8-4ee7-86fd-47e94617ea7b
00000000-0000-0000-0000-000000000000	302	hc7ib23e3pfa	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 10:40:51.016995+00	2026-10-09 10:40:51.016995+00	\N	c5343cf4-e771-45ec-877a-f84f3d1f3173
00000000-0000-0000-0000-000000000000	303	4jmqipttduft	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 11:30:27.709704+00	2026-10-09 11:30:27.709704+00	\N	e2d67019-8c79-4e05-9460-97f2229d1466
00000000-0000-0000-0000-000000000000	306	yrcucs4cpy56	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 11:45:08.122033+00	2026-10-09 11:45:08.122033+00	\N	21cf489a-e712-4784-aa72-9adf0b190e26
00000000-0000-0000-0000-000000000000	307	6ppfumt34cwt	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 12:16:02.958995+00	2026-10-09 12:16:02.958995+00	\N	5d7bce46-dc4d-4519-9c10-b1e25f216dbc
00000000-0000-0000-0000-000000000000	308	wpbgh3zvl2qk	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 12:16:03.758753+00	2026-10-09 12:16:03.758753+00	\N	82f8fe17-d275-41e3-a2a4-e15dcf529a61
00000000-0000-0000-0000-000000000000	310	msctcp3syxkk	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 12:17:28.590343+00	2026-10-09 12:17:28.590343+00	\N	55762370-4454-491e-8322-5d84dd513856
00000000-0000-0000-0000-000000000000	311	6briffvzi5ug	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 12:47:18.242242+00	2026-10-09 12:47:18.242242+00	\N	be9ba2f9-2de5-4c32-bb1e-9e41c8e48e00
00000000-0000-0000-0000-000000000000	312	apmjlo7f7p6v	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-09 12:53:13.780486+00	2026-10-09 12:53:13.780486+00	\N	c5800cf5-548b-48bf-a2aa-79af2724565a
00000000-0000-0000-0000-000000000000	313	xdngthrcc4dz	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-09 12:55:27.581013+00	2026-10-09 12:55:27.581013+00	\N	fa1e8932-8d4a-47df-b3c2-58707186ab65
00000000-0000-0000-0000-000000000000	355	nevrvfumd5kg	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-10 17:36:23.704326+00	2026-11-10 17:36:23.704326+00	zwctjro6c34o	b648d219-42d2-4df7-84cc-2f3093a25194
00000000-0000-0000-0000-000000000000	354	ikexit3f4hmo	c4c69450-28cc-42be-9504-d996447434ac	t	2026-11-10 17:35:53.241796+00	2026-11-10 18:51:13.97193+00	\N	f7e895a4-14c6-4e94-919a-2c74cf0f9772
00000000-0000-0000-0000-000000000000	317	xsiwgtbld7gs	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-10 08:48:20.790532+00	2026-10-10 08:48:20.790532+00	\N	3188f819-6911-4316-b778-ca9c2228fe5a
00000000-0000-0000-0000-000000000000	318	znoccun65d2y	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-10 08:49:20.903551+00	2026-10-10 08:49:20.903551+00	\N	e84a3ef7-f56a-4f6b-a26f-ee32a4500f18
00000000-0000-0000-0000-000000000000	319	gpy52jm3erq7	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-10 09:05:36.936418+00	2026-10-10 09:05:36.936418+00	\N	ef49e121-f829-47e2-83a9-ef525f744d66
00000000-0000-0000-0000-000000000000	320	niikofdm4743	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-10 09:18:14.285745+00	2026-10-10 09:18:14.285745+00	\N	ef5ef78d-fb3e-41bc-b958-485254354c13
00000000-0000-0000-0000-000000000000	321	7znnontoqqsg	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-10 09:21:36.708682+00	2026-10-10 09:21:36.708682+00	\N	75897a10-d028-42ec-9687-6f3e6c9ef9e9
00000000-0000-0000-0000-000000000000	322	qa646feqyj3l	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-10 09:28:52.211131+00	2026-10-10 09:28:52.211131+00	\N	2f86ab72-c08b-467b-a58d-1c826dc40d9f
00000000-0000-0000-0000-000000000000	323	y3xn4owf5umy	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-10 09:41:17.798454+00	2026-10-10 09:41:17.798454+00	\N	6379a083-1fcc-4be4-a384-0cbb31367a74
00000000-0000-0000-0000-000000000000	324	5caxwdc7xuo3	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-10 09:49:43.093536+00	2026-10-10 09:49:43.093536+00	\N	d2501c94-cc86-4c8c-a6d8-bc785da7b821
00000000-0000-0000-0000-000000000000	325	vzrkcjlu3n52	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-10 10:18:21.578037+00	2026-10-10 10:18:21.578037+00	\N	6885cb11-5cad-4026-82d3-5d716f30f95a
00000000-0000-0000-0000-000000000000	326	xbes233ke5xy	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-10 10:41:45.221394+00	2026-10-10 10:41:45.221394+00	\N	8692aae5-bf7a-45e7-bf17-686b9bf02390
00000000-0000-0000-0000-000000000000	327	rp7e4aoiyyt5	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-10 10:41:46.134528+00	2026-10-10 10:41:46.134528+00	\N	baac4fb3-cd4b-4f78-a166-5bfc9e9ea2af
00000000-0000-0000-0000-000000000000	356	l2lfkn5dfta7	c4c69450-28cc-42be-9504-d996447434ac	t	2026-11-10 17:36:26.435385+00	2026-11-11 06:33:40.156808+00	\N	c3a0b8d9-3055-486f-9ab5-cb5f4b184048
00000000-0000-0000-0000-000000000000	328	d45b2uydgcl2	c4c69450-28cc-42be-9504-d996447434ac	t	2026-10-10 10:52:53.008682+00	2026-10-12 09:59:17.851874+00	\N	71952066-686c-4e79-9a26-d519b328c62a
00000000-0000-0000-0000-000000000000	329	igq43rp4etju	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-12 09:59:17.870343+00	2026-10-12 09:59:17.870343+00	d45b2uydgcl2	71952066-686c-4e79-9a26-d519b328c62a
00000000-0000-0000-0000-000000000000	330	wp7luvwj7hq3	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-12 09:59:18.315473+00	2026-10-12 09:59:18.315473+00	\N	29c2f637-b821-421c-87a9-89e160b0b765
00000000-0000-0000-0000-000000000000	331	rbewq5fvf4ur	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-12 10:04:08.250509+00	2026-10-12 10:04:08.250509+00	\N	0efed4e5-d669-40bf-84bd-0a839702e94f
00000000-0000-0000-0000-000000000000	377	l4p6jvv36ax4	c4c69450-28cc-42be-9504-d996447434ac	f	2026-11-11 12:39:45.242096+00	2026-11-11 12:39:45.242096+00	\N	ca3244ec-e10e-4a91-9729-51d72b745a01
00000000-0000-0000-0000-000000000000	333	7of2prm76x35	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-12 10:06:45.615255+00	2026-10-12 10:06:45.615255+00	\N	083dc0f8-ab95-41e5-adb9-2ad0a6a2a7d3
00000000-0000-0000-0000-000000000000	334	z5hgh34nah7w	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-12 10:07:01.531408+00	2026-10-12 10:07:01.531408+00	\N	1cfb3f9e-de00-4c88-b141-f8853ba74a63
00000000-0000-0000-0000-000000000000	379	tnvfsaf6u6rw	4f1a06ac-c24e-4f9b-a182-452005a974a5	t	2026-11-11 12:42:13.224859+00	2026-11-11 14:39:18.611885+00	\N	b231d35a-6002-422c-8466-1e323df1da5e
00000000-0000-0000-0000-000000000000	337	sw4osshwmxql	c4c69450-28cc-42be-9504-d996447434ac	f	2026-10-19 08:51:35.106851+00	2026-10-19 08:51:35.106851+00	\N	62447468-8207-4084-b2d4-46c4c700cf62
00000000-0000-0000-0000-000000000000	338	2zo5ngwoexla	4f1a06ac-c24e-4f9b-a182-452005a974a5	f	2026-10-19 08:55:42.352024+00	2026-10-19 08:55:42.352024+00	\N	ea669ab5-61de-432d-b4f5-2d552075d50f
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_providers" ("id", "resource_id", "created_at", "updated_at", "disabled") FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_providers" ("id", "sso_provider_id", "entity_id", "metadata_xml", "metadata_url", "attribute_mapping", "created_at", "updated_at", "name_id_format") FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."saml_relay_states" ("id", "sso_provider_id", "request_id", "for_email", "redirect_to", "created_at", "updated_at", "flow_state_id") FROM stdin;
\.


--
-- Data for Name: scim_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."scim_tokens" ("id", "sso_provider_id", "token_hash", "prefix", "created_at", "expires_at", "revoked_at", "last_used_at") FROM stdin;
\.


--
-- Data for Name: scim_users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."scim_users" ("id", "sso_provider_id", "user_id", "resource", "created_at", "updated_at", "deleted_at") FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."sso_domains" ("id", "sso_provider_id", "domain", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."webauthn_challenges" ("id", "user_id", "challenge_type", "session_data", "created_at", "expires_at") FROM stdin;
\.


--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY "auth"."webauthn_credentials" ("id", "user_id", "credential_id", "public_key", "attestation_type", "aaguid", "sign_count", "transports", "backup_eligible", "backed_up", "friendly_name", "created_at", "updated_at", "last_used_at") FROM stdin;
\.


--
-- Data for Name: admin_withdrawals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."admin_withdrawals" ("id", "admin_id", "amount", "mpesa_number", "status", "created_at") FROM stdin;
cf75bc81-889b-4043-9dd7-3495f3879d4d	c4c69450-28cc-42be-9504-d996447434ac	50000.00	254740575196	pending	2026-10-10 09:52:24.626394+00
90ee803b-2a2e-4fb9-9b42-31081a003af2	c4c69450-28cc-42be-9504-d996447434ac	50000.00	254740575196	pending	2026-10-10 10:44:45.917209+00
ac1853c8-46df-497b-8df3-d356c7cd89c1	c4c69450-28cc-42be-9504-d996447434ac	50000.00	254740575196	pending	2026-10-10 11:00:18.365718+00
9004ce04-9436-432a-88cb-76fe58a46171	c4c69450-28cc-42be-9504-d996447434ac	50000.00	254740575196	pending	2026-10-12 10:05:46.027263+00
\.


--
-- Data for Name: marketplace_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."marketplace_settings" ("id", "is_open", "updated_at") FROM stdin;
1	t	2026-11-11 12:39:13.476+00
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."profiles" ("id", "email", "full_name", "role", "status", "created_at", "updated_at", "phone") FROM stdin;
4f1a06ac-c24e-4f9b-a182-452005a974a5	cherumacdonald@gmail.com	\N	seller	active	2026-10-01 14:35:38.487864+00	2026-10-01 14:35:38.487864+00	0740575196
55922adc-b83d-4add-af23-13af5af5393e	elizahwambugu096@gmail.com	\N	buyer	active	2026-11-11 05:20:37.520745+00	2026-11-11 05:20:37.520745+00	\N
b63205b7-4903-4728-b1f8-bcb0dac0234e	keirancheruiyot@gmail.com	\N	buyer	active	2026-10-02 13:24:43.701041+00	2026-10-02 13:24:43.701041+00	\N
c4c69450-28cc-42be-9504-d996447434ac	cherumacdonald18603@gmail.com	\N	admin	active	2026-10-01 14:01:50.373627+00	2026-10-01 14:01:50.373627+00	\N
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."products" ("id", "seller_id", "name", "description", "price", "image_url", "status", "created_at", "is_active") FROM stdin;
4f342fc0-1a2a-4e57-a837-977ba3b6bf83	c4c69450-28cc-42be-9504-d996447434ac	javan 	test product 3	1000000.00	\N	active	2026-10-03 11:09:15.200857+00	t
967d7903-35b6-47db-9d43-72e9d1785115	c4c69450-28cc-42be-9504-d996447434ac	test product 3	test product 3	1.00	\N	active	2026-10-06 06:32:10.32906+00	t
030b5ce8-8c1a-4ff9-836d-8d24ae74f395	c4c69450-28cc-42be-9504-d996447434ac	collins	test product 4	1.00	\N	active	2026-10-06 06:33:06.281631+00	t
cf8e2ae7-e706-4dfb-afa2-761cc8f175cb	4f1a06ac-c24e-4f9b-a182-452005a974a5	oil	test product 5	600.00	\N	active	2026-10-09 05:49:03.6098+00	t
c8c99b01-1110-462b-8c32-1a62603cc4d2	4f1a06ac-c24e-4f9b-a182-452005a974a5	Test Product 2	Second test Product	500.00	\N	active	2026-10-02 14:47:28.826295+00	t
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."orders" ("id", "buyer_id", "product_id", "quantity", "status", "created_at", "checkout_request_id", "payment_status") FROM stdin;
b2f5b30e-a018-4269-a44d-400f7e59693e	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	accepted	2026-10-05 08:22:16.321153+00	ws_CO_051020261122282703306887	pending
7919c0d2-d64e-4281-bd4d-4454b29d395c	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	rejected	2026-10-05 08:22:00.768872+00	\N	pending
2fe6fe07-92ea-4a82-a8ec-830f1d0b4968	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	accepted	2026-10-02 15:39:54.326187+00	\N	pending
78a65380-f6c5-4d7a-951b-c3e2c5ad1af0	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	accepted	2026-10-03 09:18:04.991945+00	\N	pending
5a0240dc-6de6-4931-888a-0147667047a2	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	accepted	2026-10-03 10:31:11.658114+00	\N	pending
70639486-bdd7-43b0-a586-e957742be73b	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	accepted	2026-10-03 11:09:44.371532+00	\N	pending
a89c3c9e-a800-4b4c-a145-cd165932b78e	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	rejected	2026-10-03 12:20:05.869922+00	\N	pending
63a9f6bf-73ed-451b-a78a-961dd0ed076b	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	rejected	2026-10-03 12:20:17.276559+00	\N	pending
f485b79d-42c6-47cf-b8f1-b4babcbd10a9	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	pending	2026-10-03 13:35:32.114456+00	\N	pending
a1f982f1-78e4-4172-92e4-f74ba67021a4	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	pending	2026-10-03 13:37:26.077934+00	\N	pending
56a4774f-5a22-4795-a196-9fe8d349997e	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	pending	2026-10-03 13:39:12.968737+00	\N	pending
d9c58daf-5deb-4456-bfe1-e5d23da197b1	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	pending	2026-10-03 13:46:13.24107+00	\N	pending
3bed96d9-a641-442d-a8b8-156c96887c7c	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	pending	2026-10-03 17:25:00.011122+00	\N	pending
af520215-8d2b-4ac3-a9f1-a9ef84cc17ef	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	pending	2026-10-04 10:44:37.997155+00	\N	pending
e5996538-4f2b-49e8-87f2-1ba3c1540df0	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	pending	2026-10-04 10:50:41.837502+00	\N	pending
9cd120e3-3ac5-4176-b16b-16b43b08a3ef	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	pending	2026-10-04 10:57:48.509068+00	\N	pending
9f8ecdd1-e616-4c19-a247-94d336a42e29	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	pending	2026-10-04 11:06:59.493986+00	\N	pending
dbd24d8e-e8ef-4d18-878f-997c4ed61e66	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	rejected	2026-10-04 12:17:15.183946+00	\N	pending
433bfec3-67d6-4edf-becd-c2426c1a0dcc	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	paid	2026-10-04 11:41:17.630164+00	\N	pending
cfe78c77-27d2-4f9b-a103-40c0cbf428c8	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	cancelled	2026-10-03 14:05:35.826562+00	\N	pending
8643a4fa-5340-4751-986d-daa7297ca75b	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	cancelled	2026-10-03 13:57:32.644399+00	\N	pending
9d3d2f9d-58ff-492a-8d62-cac29731e770	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-04 16:36:38.216257+00	\N	pending
9a55e256-09ef-4bbb-861c-310cb9cfc8a9	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-04 16:39:50.402761+00	\N	pending
834a7948-4273-4f1c-ba0c-220318856605	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-04 16:41:42.740174+00	\N	pending
5a9da76e-5c27-4a47-bf95-7b06b5eafac4	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-04 16:42:29.713918+00	\N	pending
4b7a0324-82b1-4446-b2b2-f07c598ff516	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-04 16:42:53.860782+00	\N	pending
9e914960-7900-4019-bd4e-10627b1509d4	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-04 16:46:15.920831+00	\N	pending
3dc94716-3ad8-49f7-beb7-38c384bbfa50	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-04 16:48:07.446961+00	\N	pending
26df441b-cebc-443b-b98b-d73e0246a0aa	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-04 16:50:47.833088+00	\N	pending
0569afbb-3488-4012-9ac9-0d6354792a91	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	pending	2026-10-04 17:12:37.936732+00	\N	pending
e869bd1f-044a-4a38-a214-f6154d4ee91e	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-04 17:12:44.897469+00	\N	pending
8eb0e1fd-82b4-4141-b593-6a225179f8e4	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-04 17:14:45.559614+00	ws_CO_041020262015021740575197	pending
cbdc76cf-319e-43df-acc0-e6f749096158	b63205b7-4903-4728-b1f8-bcb0dac0234e	030b5ce8-8c1a-4ff9-836d-8d24ae74f395	1	accepted	2026-10-06 06:34:50.703546+00	ws_CO_061020260935037703306887	paid
32737172-5e72-49c9-93fe-333dacb7e439	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	accepted	2026-10-04 17:15:13.308265+00	ws_CO_041020262015275703306887	pending
7baab7cc-05b8-46c5-b8cc-855ffc9ecffa	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	cancelled	2026-10-04 17:16:06.953028+00	ws_CO_041020262016245701666023	pending
6ae7712b-2030-44e1-876a-6b8ba9b7961c	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	cancelled	2026-10-03 13:49:17.92543+00	\N	pending
df4ba3cc-53f6-4a67-a8fb-ec9f3caebd08	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	accepted	2026-10-05 04:37:45.540695+00	ws_CO_051020260738447703306887	pending
e2d1cc3f-80c4-481e-969a-2c706c081c57	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	accepted	2026-10-05 08:34:24.715437+00	ws_CO_051020261134367703306887	failed
faac7dc1-b118-4806-927c-23806b39f0ad	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	accepted	2026-10-05 05:16:11.305578+00	ws_CO_051020260816358748777612	pending
754c43f5-ac50-43b1-937d-bd3eb94af223	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	accepted	2026-10-05 08:13:09.292289+00	ws_CO_051020261113531740575196	pending
0aa0f44b-420b-490d-bd2c-ede9c1810062	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	payment_failed	2026-10-05 08:21:17.143554+00	ws_CO_051020261121279740575196	pending
8afff01d-0ee7-4c1a-936c-5a64da8fcd50	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	accepted	2026-10-05 08:37:39.489141+00	ws_CO_051020261137521703306887	pending
426dd667-76b8-4f05-a4cf-451b8b3888e4	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	cancelled	2026-10-05 08:37:30.072221+00	\N	pending
3ebf22ea-2941-44c3-9834-6765a8727c0e	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-06 07:06:47.453433+00	ws_CO_061020261006597703306887	failed
86a2b5c3-97ba-481a-839a-3015f10a844c	b63205b7-4903-4728-b1f8-bcb0dac0234e	030b5ce8-8c1a-4ff9-836d-8d24ae74f395	1	pending	2026-10-06 06:33:47.232505+00	ws_CO_061020260933597703306887	paid
3cc1c2c7-7ea9-4a7b-9b42-d473e67de236	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	rejected	2026-10-06 06:23:39.23587+00	ws_CO_061020260923582703306887	failed
13459f51-bf50-44c0-8dd9-7dd07fd93be7	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-06 06:28:40.580553+00	\N	pending
f4cd3e21-7609-43b6-9ff4-fb09bd7cc9c6	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-06 06:29:03.084944+00	\N	pending
a7e634fe-a598-4b9e-94f2-94fcc341ae48	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f342fc0-1a2a-4e57-a837-977ba3b6bf83	1	pending	2026-10-06 06:29:14.385527+00	ws_CO_061020260929316113313883	failed
491fa701-ce75-4bbb-8162-d72b64244972	b63205b7-4903-4728-b1f8-bcb0dac0234e	030b5ce8-8c1a-4ff9-836d-8d24ae74f395	1	pending	2026-10-06 08:25:38.727128+00	\N	pending
5ca9960b-f418-47fd-995f-5a6314316a6b	b63205b7-4903-4728-b1f8-bcb0dac0234e	030b5ce8-8c1a-4ff9-836d-8d24ae74f395	1	pending	2026-10-06 08:25:38.982829+00	\N	pending
991e916e-e8f5-44a3-9553-c3cc4e70effb	b63205b7-4903-4728-b1f8-bcb0dac0234e	967d7903-35b6-47db-9d43-72e9d1785115	1	pending	2026-10-06 08:25:39.378532+00	\N	pending
ef072d3e-797a-4857-9a71-5074b82717c2	b63205b7-4903-4728-b1f8-bcb0dac0234e	030b5ce8-8c1a-4ff9-836d-8d24ae74f395	1	pending	2026-10-06 08:24:52.52831+00	ws_CO_061020261125403721402656	pending
59e1bfd9-75de-4417-a041-37bc7a4930cc	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-08 07:41:56.928701+00	\N	pending
b800fdd5-0c1b-4311-af59-ff89ee1a2520	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	payment_failed	2026-10-09 01:36:37.897795+00	ws_CO_091020260436533703306887	failed
b88f2ecd-f9ae-4b39-bf60-a9ad2c235454	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	accepted	2026-10-09 00:40:13.637814+00	ws_CO_091020260340299703306887	failed
99d87dbe-7ee5-41a2-b8fa-219e82da1aa5	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	payment_failed	2026-10-09 01:37:09.334313+00	ws_CO_091020260437205703306887	failed
7d9aac49-a6c5-4cf1-a0d8-c7c537dacfcd	b63205b7-4903-4728-b1f8-bcb0dac0234e	030b5ce8-8c1a-4ff9-836d-8d24ae74f395	1	cancelled	2026-10-09 01:36:27.973272+00	\N	pending
174bc7f6-79fa-4441-b11e-02e5cd400e30	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-09 02:15:59.714528+00	\N	pending
9860d358-0a72-4b55-8427-4b07d10837e1	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	cancelled	2026-10-09 03:12:01.034151+00	\N	pending
1458a9da-8e45-4a5b-a19e-15f87388547e	b63205b7-4903-4728-b1f8-bcb0dac0234e	cf8e2ae7-e706-4dfb-afa2-761cc8f175cb	1	rejected	2026-10-09 05:55:04.30772+00	\N	pending
9e07fcfe-4ca9-41c3-9bbb-0e89a2038d35	b63205b7-4903-4728-b1f8-bcb0dac0234e	cf8e2ae7-e706-4dfb-afa2-761cc8f175cb	1	accepted	2026-10-09 05:50:56.55264+00	ws_CO_091020260851119721275688	pending
f0eafc3f-6543-4193-a00f-fed42fb0f365	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-09 08:50:40.993597+00	\N	pending
5e080838-306d-4d4b-976c-fdeeadce2fa4	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-09 08:51:20.562466+00	\N	pending
ffffe533-35af-46b8-83f4-94c3dcbfe023	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-09 08:51:34.478164+00	\N	pending
0b121608-67b0-4e08-a426-f79acf9456a4	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-09 08:54:05.021424+00	\N	pending
5ec2acc9-b59a-4248-8cb9-ff865726b7ec	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-09 08:58:52.786778+00	\N	pending
dbf04261-bdaa-49d8-aa9b-16311d60da20	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-09 09:03:28.661366+00	\N	pending
eb4c3984-0a0b-40b5-ae1a-b166fea46b94	b63205b7-4903-4728-b1f8-bcb0dac0234e	c8c99b01-1110-462b-8c32-1a62603cc4d2	1	pending	2026-10-09 09:05:02.622614+00	\N	pending
fb8f3215-dea5-470e-a653-1f2bd7c2c9b4	b63205b7-4903-4728-b1f8-bcb0dac0234e	cf8e2ae7-e706-4dfb-afa2-761cc8f175cb	1	payment_failed	2026-10-09 09:34:53.724691+00	ws_CO_091020261235073703306887	failed
c9d9fa44-be02-4559-85e0-2ffc85ff4ac9	b63205b7-4903-4728-b1f8-bcb0dac0234e	cf8e2ae7-e706-4dfb-afa2-761cc8f175cb	1	payment_failed	2026-10-19 09:01:35.94002+00	ws_CO_191020261201567721473193	failed
711d17ec-2af8-4fda-b9df-fc0d5a5af475	b63205b7-4903-4728-b1f8-bcb0dac0234e	cf8e2ae7-e706-4dfb-afa2-761cc8f175cb	1	cancelled	2026-10-09 09:05:23.220016+00	\N	pending
7ff5fdd8-cb47-4ae0-b93f-3e17c0d1d98c	b63205b7-4903-4728-b1f8-bcb0dac0234e	cf8e2ae7-e706-4dfb-afa2-761cc8f175cb	1	pending	2026-11-10 17:07:19.865423+00	\N	pending
43020313-3382-4a2f-b6be-8b810b3842e5	b63205b7-4903-4728-b1f8-bcb0dac0234e	cf8e2ae7-e706-4dfb-afa2-761cc8f175cb	1	pending	2026-11-11 12:40:42.127454+00	\N	pending
7beae686-ddd2-4194-92b7-b108d687abe5	b63205b7-4903-4728-b1f8-bcb0dac0234e	cf8e2ae7-e706-4dfb-afa2-761cc8f175cb	1	pending	2026-11-11 12:41:08.341574+00	\N	pending
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."payments" ("id", "order_id", "buyer_id", "seller_id", "amount", "commission", "seller_amount", "status", "created_at", "checkout_request_id") FROM stdin;
cbfe75ff-e72a-455a-b08f-cd48ec5149ef	cfe78c77-27d2-4f9b-a103-40c0cbf428c8	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	150000	850000	pending	2026-10-03 14:05:39.81281+00	\N
1ca060c0-e8ec-4bae-9371-078df78270e2	3bed96d9-a641-442d-a8b8-156c96887c7c	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-03 17:25:00.548089+00	\N
fe85c482-d7f2-444e-9524-80960aafdf17	af520215-8d2b-4ac3-a9f1-a9ef84cc17ef	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-04 10:44:38.698617+00	\N
8ee58506-1b2e-45f2-9edf-d7992a8448da	e5996538-4f2b-49e8-87f2-1ba3c1540df0	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-04 10:50:42.211165+00	\N
252a42fe-2dbf-4fb1-957a-3d1b8a8c6411	9cd120e3-3ac5-4176-b16b-16b43b08a3ef	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-04 10:57:48.927509+00	\N
cd9a731c-02b8-4b74-9b3c-8452c719bc04	9f8ecdd1-e616-4c19-a247-94d336a42e29	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-04 11:06:59.908053+00	ws_CO_041020261407247708374149
572936db-a798-431d-9e38-d776dc3f7efe	dbd24d8e-e8ef-4d18-878f-997c4ed61e66	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-04 12:17:15.711117+00	ws_CO_041020261518271740575196
fa426045-1950-4db4-b648-15b97c2986df	433bfec3-67d6-4edf-becd-c2426c1a0dcc	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	paid	2026-10-04 11:41:18.030791+00	ws_CO_041020261442355708374149
644877ee-81b2-4c5e-b48c-2f08d5be9400	9d3d2f9d-58ff-492a-8d62-cac29731e770	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 16:36:38.620204+00	\N
101fab08-cda0-4242-9e0e-a1b0f9f25307	9a55e256-09ef-4bbb-861c-310cb9cfc8a9	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 16:39:50.778401+00	\N
2f496573-76cf-445d-af2f-e264289c09df	834a7948-4273-4f1c-ba0c-220318856605	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 16:41:43.117493+00	\N
12a25239-cced-4f2a-8868-25d507f9b22e	5a9da76e-5c27-4a47-bf95-7b06b5eafac4	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 16:42:30.085507+00	\N
8e62cc4a-1e2a-456c-97c0-df0ca9aac6ed	4b7a0324-82b1-4446-b2b2-f07c598ff516	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 16:42:54.234905+00	\N
1e4f91c6-c417-470d-82fa-ab97c41510b2	9e914960-7900-4019-bd4e-10627b1509d4	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 16:46:16.309721+00	\N
b2afe53b-1a2d-47ab-8a9d-9cf1b9b2fd91	3dc94716-3ad8-49f7-beb7-38c384bbfa50	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 16:48:07.851546+00	\N
84bddafe-f04f-4925-8ff6-ed438e3cc32d	26df441b-cebc-443b-b98b-d73e0246a0aa	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 16:50:48.220858+00	\N
4d452958-b915-443d-a6fe-7e29b7c91841	0569afbb-3488-4012-9ac9-0d6354792a91	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-04 17:12:38.322018+00	\N
f45a75bb-766f-4962-85c4-b73947093d41	e869bd1f-044a-4a38-a214-f6154d4ee91e	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 17:12:45.28154+00	\N
b704f591-db72-4d8e-ac7b-b37bcb16f73f	8eb0e1fd-82b4-4141-b593-6a225179f8e4	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 17:14:45.947341+00	\N
7e852913-acb3-4cc2-959f-88e9e18acfc0	32737172-5e72-49c9-93fe-333dacb7e439	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 17:15:13.698443+00	\N
af54965e-31b1-4ea8-a953-b8cf58a3e3af	7baab7cc-05b8-46c5-b8cc-855ffc9ecffa	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-04 17:16:07.350159+00	\N
1a719069-6067-437f-bba1-fc93b0fc0f64	df4ba3cc-53f6-4a67-a8fb-ec9f3caebd08	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-05 04:37:46.123083+00	\N
bc535567-2adf-4003-b98f-b7a96d35f55d	faac7dc1-b118-4806-927c-23806b39f0ad	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-05 05:16:12.22595+00	\N
116de9e2-9d8a-4624-b63f-2cfe5047b495	754c43f5-ac50-43b1-937d-bd3eb94af223	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-05 08:13:09.929718+00	\N
6ac9b510-e892-46ca-89a8-a9b3481efd7f	0aa0f44b-420b-490d-bd2c-ede9c1810062	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-05 08:21:17.73107+00	\N
8a83815c-8282-4cbf-a307-6e842182f17d	7919c0d2-d64e-4281-bd4d-4454b29d395c	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-05 08:22:02.274879+00	\N
f36bce1a-f723-43c0-9ce4-14f1e01f9c70	b2f5b30e-a018-4269-a44d-400f7e59693e	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-05 08:22:17.004804+00	\N
3825453b-35be-43e3-af74-833659a5cee0	e2d1cc3f-80c4-481e-969a-2c706c081c57	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-05 08:34:25.390781+00	\N
979981e5-b839-4c92-a126-d833ac9e9967	426dd667-76b8-4f05-a4cf-451b8b3888e4	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-05 08:37:30.73069+00	\N
80bb2b44-c6e7-4d16-b7c4-3ac504c28eb8	8afff01d-0ee7-4c1a-936c-5a64da8fcd50	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-05 08:37:40.25463+00	\N
23e36667-327e-42ae-9d90-b18228b05926	3cc1c2c7-7ea9-4a7b-9b42-d473e67de236	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-06 06:23:39.926004+00	\N
af802fa2-bd8b-4fcc-9724-eaa839bdf689	13459f51-bf50-44c0-8dd9-7dd07fd93be7	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-06 06:28:41.335946+00	\N
58a0e0a9-a3c6-4047-a9b8-f16cb47b25c8	f4cd3e21-7609-43b6-9ff4-fb09bd7cc9c6	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-06 06:29:04.153128+00	\N
9c8edacf-6e3e-44a8-898a-f9d7a3cbf424	a7e634fe-a598-4b9e-94f2-94fcc341ae48	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1000000	200000	800000	pending	2026-10-06 06:29:16.079235+00	\N
69f14c5d-1bfa-47b4-8b91-fb30ae23927e	86a2b5c3-97ba-481a-839a-3015f10a844c	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1	0.2	0.8	pending	2026-10-06 06:33:47.732774+00	\N
42a0ca9d-8cba-4c9b-a270-6dee10afb345	cbdc76cf-319e-43df-acc0-e6f749096158	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1	0.2	0.8	pending	2026-10-06 06:34:51.288511+00	\N
a78a31db-9b6f-42f3-8334-cf0c3c94382c	3ebf22ea-2941-44c3-9834-6765a8727c0e	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-06 07:06:48.002325+00	\N
8970ff89-4487-4115-93b7-358da439d458	ef072d3e-797a-4857-9a71-5074b82717c2	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1	0.2	0.8	pending	2026-10-06 08:24:53.405583+00	\N
33f823f5-d059-4b2e-b422-213f6fa0d70d	491fa701-ce75-4bbb-8162-d72b64244972	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1	0.2	0.8	pending	2026-10-06 08:25:39.388675+00	\N
0e660e58-f459-4fcc-89dd-6438764932c9	5ca9960b-f418-47fd-995f-5a6314316a6b	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1	0.2	0.8	pending	2026-10-06 08:25:39.755989+00	\N
33f97c60-0989-4683-9cec-3b1fd19dea00	991e916e-e8f5-44a3-9553-c3cc4e70effb	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1	0.2	0.8	pending	2026-10-06 08:25:58.239617+00	\N
819ed81f-ee62-4fe0-9347-8addb23a3add	b88f2ecd-f9ae-4b39-bf60-a9ad2c235454	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-09 00:40:14.286158+00	\N
cc882690-f007-403c-aaff-6960f0c2db9b	7d9aac49-a6c5-4cf1-a0d8-c7c537dacfcd	b63205b7-4903-4728-b1f8-bcb0dac0234e	c4c69450-28cc-42be-9504-d996447434ac	1	0.2	0.8	pending	2026-10-09 01:36:28.510734+00	\N
c92ed14f-ba9f-4350-b99b-9d3e190fc111	b800fdd5-0c1b-4311-af59-ff89ee1a2520	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	payment_failed	2026-10-09 01:36:38.416104+00	\N
f55aaded-2d22-4f14-ac0a-8b0dcb06d071	99d87dbe-7ee5-41a2-b8fa-219e82da1aa5	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	payment_failed	2026-10-09 01:37:09.851266+00	\N
c765420f-a81f-4190-a36e-bdbdfabaac4f	174bc7f6-79fa-4441-b11e-02e5cd400e30	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-09 02:16:00.431235+00	\N
f7ed40eb-d556-4f25-a6fb-84475b9eef74	9860d358-0a72-4b55-8427-4b07d10837e1	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	100	400	pending	2026-10-09 03:12:02.059505+00	\N
c2ea1c67-d069-4c50-a85f-cc89ce4901ed	9e07fcfe-4ca9-41c3-9bbb-0e89a2038d35	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	600	90	510	pending	2026-10-09 05:50:57.279503+00	\N
f47decb6-c71e-43b3-9a4a-90d036dd64e5	1458a9da-8e45-4a5b-a19e-15f87388547e	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	600	90	510	pending	2026-10-09 05:55:04.86289+00	\N
02373074-70ca-495e-a05a-b7b647ae46d3	f0eafc3f-6543-4193-a00f-fed42fb0f365	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	75	425	pending	2026-10-09 08:50:42.090237+00	\N
3fe1e5fa-9f5d-469e-a806-c7facfa39049	5e080838-306d-4d4b-976c-fdeeadce2fa4	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	75	425	pending	2026-10-09 08:51:23.328135+00	\N
7815211f-5ef0-4d49-b3b4-546743646b60	ffffe533-35af-46b8-83f4-94c3dcbfe023	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	75	425	pending	2026-10-09 08:51:35.300252+00	\N
20360fff-90b0-428d-babb-9da9a9e5cd11	0b121608-67b0-4e08-a426-f79acf9456a4	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	75	425	pending	2026-10-09 08:54:06.304637+00	\N
2348de19-c905-4c7a-935d-b2e274a5d07a	5ec2acc9-b59a-4248-8cb9-ff865726b7ec	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	75	425	pending	2026-10-09 08:58:53.452359+00	\N
dda205ea-12cc-479e-a648-903833e5c86b	dbf04261-bdaa-49d8-aa9b-16311d60da20	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	75	425	pending	2026-10-09 09:03:29.290094+00	\N
b20511be-3634-4c30-8c0f-2cf26b05e3fd	eb4c3984-0a0b-40b5-ae1a-b166fea46b94	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	500	75	425	pending	2026-10-09 09:05:03.120048+00	\N
55b3422a-0f69-4453-bc9c-778d7865a2e0	711d17ec-2af8-4fda-b9df-fc0d5a5af475	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	600	90	510	pending	2026-10-09 09:05:23.666642+00	\N
6e8cd6cf-9faf-4266-b948-8b3028af6a85	fb8f3215-dea5-470e-a653-1f2bd7c2c9b4	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	600	90	510	payment_failed	2026-10-09 09:34:54.463004+00	\N
74fe9611-0fda-4a37-aa91-09a23eed2e28	c9d9fa44-be02-4559-85e0-2ffc85ff4ac9	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	600	90	510	payment_failed	2026-10-19 09:01:36.495693+00	\N
c63185b8-1eaf-4441-95bd-9e6364db0d91	7ff5fdd8-cb47-4ae0-b93f-3e17c0d1d98c	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	600	90	510	pending	2026-11-10 17:07:20.634488+00	\N
09162c15-0ea8-4530-b07e-5038c536e50d	43020313-3382-4a2f-b6be-8b810b3842e5	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	600	180	420	pending	2026-11-11 12:40:42.913535+00	\N
963fb8b8-d703-439f-878b-bbd590b01bb6	7beae686-ddd2-4194-92b7-b108d687abe5	b63205b7-4903-4728-b1f8-bcb0dac0234e	4f1a06ac-c24e-4f9b-a182-452005a974a5	600	180	420	pending	2026-11-11 12:41:08.990367+00	\N
\.


--
-- Data for Name: payments_old; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."payments_old" ("id", "order_id", "buyer_id", "seller_id", "amout", "commission", "seller_amount", "status", "created_at") FROM stdin;
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."reports" ("id", "user_id", "user_role", "type", "subject", "description", "status", "created_at") FROM stdin;
9e65eb6c-0bf9-4692-84c5-7889fe2941b4	b63205b7-4903-4728-b1f8-bcb0dac0234e	buyer	complaint	i don't like the product.	it doesn't conform to what i ordered for	resolved	2026-10-04 14:11:11.991004+00
a28a4ded-d1a2-49cf-b096-7b26ba29bf4e	b63205b7-4903-4728-b1f8-bcb0dac0234e	buyer	complaint	bad product	it has expired	reviewed	2026-10-04 14:18:33.194498+00
d4275674-7022-4ab0-b043-f63fd9b446b9	4f1a06ac-c24e-4f9b-a182-452005a974a5	seller	complaint	payment	i am unable to recive payments	reviewed	2026-10-04 14:42:47.324459+00
\.


--
-- Data for Name: reports & complaints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."reports & complaints" ("id", "user_id", "user_role", "type", "subject", "description", "status", "created_at") FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."settings" ("id", "created_at", "commission_rate", "updated_at") FROM stdin;
c1fd7ea0-ab24-497b-bd83-bc3e8a105426	2026-10-03 13:04:27.718857+00	30	2026-11-11 12:39:04.465+00
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."stores" ("id", "seller_id", "store_name", "description", "phone", "status", "created_at") FROM stdin;
066a41f2-1996-4344-b536-b25c394f21b5	4f1a06ac-c24e-4f9b-a182-452005a974a5	Collins Store	Quality products at affordable prices	0703306887	active	2026-10-06 07:21:16.624806+00
bf36dfc5-1bd5-4b21-b6e1-0b64d8897e6b	4f1a06ac-c24e-4f9b-a182-452005a974a5	david's store	quality products	0740575196	active	2026-10-09 05:48:19.582336+00
ed4b03e3-c1a6-4ccd-92e5-3e0e008d1e9d	4f1a06ac-c24e-4f9b-a182-452005a974a5	Sandra's Boutique	Quality Products	0740575196	active	2026-10-19 08:56:41.739401+00
\.


--
-- Data for Name: withdrawals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."withdrawals" ("id", "seller_id", "phone", "amount", "status", "created_at") FROM stdin;
1b9f457c-3e11-4050-a993-53d2409b1598	4f1a06ac-c24e-4f9b-a182-452005a974a5	0703306887	1000	approved	2026-10-04 16:06:12.618319+00
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id", "type", "versioning_status", "lifecycle_configuration", "lifecycle_configuration_generation") FROM stdin;
\.


--
-- Data for Name: bucket_lifecycle_states; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."bucket_lifecycle_states" ("bucket_id", "generation", "next_run_at", "claim_id", "claim_until", "continuation", "last_started_at", "last_completed_at", "last_success_at", "last_result", "failure_count", "last_error", "updated_at") FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets_analytics" ("name", "type", "format", "created_at", "updated_at", "id", "deleted_at") FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."buckets_vectors" ("id", "type", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: lifecycle_abandoned_artifacts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."lifecycle_abandoned_artifacts" ("bucket_id", "key", "name", "version", "attempted_at") FROM stdin;
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata", "archived_at", "is_delete_marker", "is_versioned") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads" ("id", "in_progress_size", "upload_signature", "bucket_id", "key", "version", "owner_id", "created_at", "user_metadata", "metadata") FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."s3_multipart_uploads_parts" ("id", "upload_id", "size", "part_number", "bucket_id", "key", "etag", "owner_id", "version", "created_at") FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY "storage"."vector_indexes" ("id", "name", "bucket_id", "data_type", "dimension", "distance_metric", "metadata_configuration", "created_at", "updated_at") FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 390, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict uyARytxB5Nfq9O51tRXDaUepgOpWHEHnVcC0m2Iw1YMAiYSmfZ5v0h5w9hWKIfo

RESET ALL;

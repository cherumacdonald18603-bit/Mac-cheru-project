import { supabase } from './supabaseClient'
import { useState, useEffect } from "react";

const styles = {adminPage: {
  minHeight: "100vh",
  display: "flex",
  fontFamily: "Arial, sans-serif",
  background: "linear-gradient(135deg, #f8fafc 0%, #eef2f7 100%)",
  color: "#0f172a",
},

sidebar: {
  width: "140px",
  minHeight: "100vh",
  background: "linear-gradient(180deg, #0f172a 0%, #172554 100%)",
  color: "#ffffff",
  padding: "28px 16px",
  boxSizing: "border-box",
  display: "flex",
  flexDirection: "column",
  boxShadow: "6px 0 24px rgba(15, 23, 42, 0.14)",
  borderRight: "3px solid #d4af37",
},

sideButton: {
  background: "transparent",
  border: "1px solid transparent",
  color: "#cbd5e1",
  textAlign: "left",
  padding: "14px 18px",
  marginBottom: "7px",
  borderRadius: "10px",
  cursor: "pointer",
  fontSize: "14px",
  fontWeight: "600",
  transition: "all 0.2s ease",
},

adminMain: {
  flex: 1,
  minWidth: 0,
  padding: "35px",
  boxSizing: "border-box",
  overflow: "auto",
},

statsGrid: {
  display: "grid",
  gridTemplateColumns: "repeat(auto-fit, minmax(190px, 1fr))",
  gap: "22px",
  marginBottom: "32px",
},

statCard: {
  background: "linear-gradient(145deg, #ffffff, #f8fafc)",
  padding: "25px",
  borderRadius: "16px",
  border: "1px solid #e2e8f0",
  borderTop: "4px solid #d4af37",
  boxShadow: "0 8px 24px rgba(15, 23, 42, 0.07)",
  transition: "all 0.2s ease",
},

activityCard: {
  background: "linear-gradient(145deg, #ffffff, #f8fafc)",
  padding: "25px",
  borderRadius: "16px",
  marginBottom: "25px",
  border: "1px solid #e2e8f0",
  borderLeft: "5px solid #059669",
  boxShadow: "0 8px 24px rgba(15, 23, 42, 0.07)",
},

managementGrid: {
  display: "grid",
  gridTemplateColumns: "repeat(auto-fit, minmax(240px, 1fr))",
  gap: "22px",
},

managementCard: {
  background: "linear-gradient(145deg, #ffffff, #f8fafc)",
  padding: "25px",
  borderRadius: "16px",
  border: "1px solid #e2e8f0",
  boxShadow: "0 8px 24px rgba(15, 23, 42, 0.07)",
},

tableHeader: {
  textAlign: "left",
  padding: "14px 12px",
  borderBottom: "2px solid #d4af37",
  color: "#0f172a",
  backgroundColor: "#f1f5f9",
  fontSize: "13px",
  fontWeight: "bold",
},

tableCell: {
  padding: "14px 12px",
  borderBottom: "1px solid #e2e8f0",
  color: "#334155",
  fontSize: "14px",
},

manageButton: {
  marginTop: "10px",
  padding: "11px 17px",
  background: "linear-gradient(135deg, #059669, #047857)",
  color: "#ffffff",
  border: "none",
  borderRadius: "9px",
  cursor: "pointer",
  fontWeight: "bold",
  boxShadow: "0 4px 12px rgba(5, 150, 105, 0.18)",
},

  page: {
    minHeight: "100vh",
    fontFamily: "Arial, sans-serif",
    backgroundColor: "#f5f5f5",
  },

  navbar: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    padding: "18px 50px",
    backgroundColor: "#111",
    color: "white",
  },

  logo: {
    fontSize: "26px",
    fontWeight: "bold",
  },

  navLinks: {
    display: "flex",
    gap: "25px",
    alignItems: "center",
  },

  loginButton: {
    padding: "10px 18px",
    border: "none",
    borderRadius: "6px",
    cursor: "pointer",
  },

  container: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    padding: "60px 20px",
  },

  card: {
    backgroundColor: "white",
    width: "400px",
    padding: "35px",
    borderRadius: "12px",
    boxShadow: "0 4px 15px rgba(0,0,0,0.12)",
  },

  subtitle: {
    color: "#666",
    marginBottom: "25px",
  },

  field: {
    marginBottom: "18px",
  },

  input: {
    width: "100%",
    padding: "12px",
    marginTop: "7px",
    border: "1px solid #ccc",
    borderRadius: "6px",
    boxSizing: "border-box",
  },

  submitButton: {
    width: "100%",
    padding: "13px",
    backgroundColor: "#111",
    color: "white",
    border: "none",
    borderRadius: "6px",
    cursor: "pointer",
    fontSize: "16px",
  },

  switchText: {
    textAlign: "center",
    marginTop: "20px",
  },

  switchButton: {
    border: "none",
    background: "none",
    cursor: "pointer",
    fontWeight: "bold",
    marginLeft: "5px",
  },
};

function App() {
  const [showLogin, setShowLogin] = useState(true);
  const [loggedIn, setLoggedIn] = useState(false);
  const [showProductForm, setShowProductForm] = useState(false);
  const [productName, setProductName] = useState("");
  const [productPrice, setProductPrice] = useState("");
  const [productDescription, setProductDescription] = useState("");
  const [sellerId, setSellerId] = useState("");
  const [sellerPhone, setSellerPhone] = useState("");
  const [storeName, setStoreName] = useState("");
const [storeDescription, setStoreDescription] = useState("");
const [storeCreated, setStoreCreated] = useState(false);
  const [products, setProducts] = useState([]);
  const [totalProducts, setTotalProducts] = useState(0);
  const [adminProducts, setAdminProducts] = useState([]);
  const [buyerProducts, setBuyerProducts] = useState([]);
  const [buyerStores, setBuyerStores] = useState([]);
  const [selectedStore, setSelectedStore] = useState(null);
  const [storeProducts, setStoreProducts] = useState([]);
  useEffect(() => {
  if (!selectedStore) return;

  const loadStoreProducts = async () => {
    const { data, error } = await supabase
      .from("products")
      .select("*")
      .eq("seller_id", selectedStore.seller_id);

    if (error) {
      console.log("STORE PRODUCTS ERROR:", error);
      return;
    }

    setStoreProducts(data || []);
  };

  loadStoreProducts();
}, [selectedStore]);
  const [sellerOrders, setSellerOrders] = useState([]);
  const [buyerOrders, setBuyerOrders] = useState([]);
  const [adminOrders, setAdminOrders] = useState([]);
  const [adminPayments, setAdminPayments] = useState([]);
 const [walletCommission, setWalletCommission] = useState(0);
const [walletReserved, setWalletReserved] = useState(0);
const [walletPending, setWalletPending] = useState(0);
  const [walletAmount, setWalletAmount] = useState("");
const [walletPhone, setWalletPhone] = useState("");
const [walletHistory, setWalletHistory] = useState([]);
const [walletMessage, setWalletMessage] = useState("");
  const [adminReports, setAdminReports] = useState([]);
  const [adminWithdrawals, setAdminWithdrawals] = useState([]);
  const [commissionRate, setCommissionRate] = useState(15);
  const [sellerTotalSales, setSellerTotalSales] = useState(0);
const [sellerCommission, setSellerCommission] = useState(0);
const [sellerEarnings, setSellerEarnings] = useState(0);
const [withdrawalAmount, setWithdrawalAmount] = useState("");
const [withdrawals, setWithdrawals] = useState([]);
const [hotlineOpen, setHotlineOpen] = useState(false);
const [hotlineSubject, setHotlineSubject] = useState("");
const [hotlineDescription, setHotlineDescription] = useState("");
const [hotlinePriority, setHotlinePriority] = useState("urgent");
  
  const [userRole, setUserRole] = useState(null);
  useEffect(() => {
  const loadSellerPhone = async () => {
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return;

    const { data, error } = await supabase
      .from("profiles")
      .select("phone")
      .eq("id", user.id)
      .single();

    if (error) {
      console.log("SELLER PHONE ERROR:", error);
      return;
    }

    setSellerPhone(data?.phone || "");
  };

  if (loggedIn && userRole === "seller") {
    loadSellerPhone();
  }
}, [loggedIn, userRole]);
const handleWalletWithdrawal = async (event) => {
  event.preventDefault();
  setWalletMessage("");

  const amount = Number(walletAmount);
  const availableBalance = walletCommission - walletReserved;
  const phone = walletPhone.trim();

  if (!Number.isFinite(amount) || amount <= 0) {
    setWalletMessage("Enter a valid withdrawal amount.");
    return;
  }

  if (amount > availableBalance) {
    setWalletMessage("Your withdrawal exceeds the available balance.");
    return;
  }

  if (!/^(07|01)\d{8}$/.test(phone) && !/^254(7|1)\d{8}$/.test(phone)) {
    setWalletMessage("Enter a valid Kenyan M-Pesa number.");
    return;
  }

  const { data: { user }, error: userError } =
    await supabase.auth.getUser();

  if (userError || !user) {
    setWalletMessage("Please log in again before requesting a withdrawal.");
    return;
  }

  const { data, error } = await supabase.rpc(
  "request_admin_withdrawal",
  {
    p_amount: amount,
    p_mpesa_number: phone.startsWith("0")
      ? "254" + phone.slice(1)
      : phone,
  }
);

if (error) {
  console.error("Admin withdrawal error:", error);
  setWalletMessage("Could not submit request: " + error.message);
  return;
}

const savedWithdrawal = Array.isArray(data) ? data[0] : data;

setWalletReserved((previous) => previous + amount);
setWalletPending((previous) => previous + amount);

if (savedWithdrawal?.id) {
  setWalletHistory((previous) => [savedWithdrawal, ...previous]);
}

setWalletAmount("");
setWalletPhone("");
setWalletMessage(
  "Withdrawal request recorded. It is pending and has not been paid."
);
};
useEffect(() => {
  if (!loggedIn || userRole !== "admin") return;

  const loadAdminWallet = async () => {
    const { data: payments, error: paymentsError } = await supabase
      .from("payments")
      .select("commission")
      .eq("status", "paid");

    if (paymentsError) {
      console.error("Wallet payments error:", paymentsError.message);
      return;
    }

    const totalCommission = (payments || []).reduce(
      (sum, payment) => sum + Number(payment.commission || 0),
      0
    );

    const { data: withdrawals, error: withdrawalsError } = await supabase
      .from("admin_withdrawals")
      .select("amount, status")
      .in("status", ["pending", "approved", "paid"]);

    if (withdrawalsError) {
      console.error("Wallet withdrawals error:", withdrawalsError.message);
      return;
    }

    const reservedAmount = (withdrawals || []).reduce(
      (sum, withdrawal) => sum + Number(withdrawal.amount || 0),
      0
    );

    setWalletCommission(totalCommission);
    setWalletReserved(reservedAmount);
    const pendingAmount = (withdrawals || [])
  .filter((withdrawal) => withdrawal.status === "pending")
  .reduce(
    (sum, withdrawal) => sum + Number(withdrawal.amount || 0),
    0
  );

setWalletPending(pendingAmount);
    const { data: history, error: historyError } = await supabase
  .from("admin_withdrawals")
  .select("id, amount, mpesa_number, status, created_at")
  .order("created_at", { ascending: false });

if (historyError) {
  console.error("Wallet history error:", historyError.message);
} else {
  setWalletHistory(history || []);
}
  };

  loadAdminWallet();
}, [loggedIn, userRole]);
  useEffect(() => {
  const loadCommissionRate = async () => {
    const { data, error } = await supabase
      .from("settings")
      .select("commission_rate")
      .single();

    if (error) {
      console.log("COMMISSION RATE ERROR:", error);
      return;
    }

    setCommissionRate(data.commission_rate);
  };

  if (loggedIn && userRole === "admin") {
    loadCommissionRate();
  }
}, [loggedIn, userRole]);
  const [adminSection, setAdminSection] = useState("dashboard");
  const [users, setUsers] = useState([]);
  const [email, setEmail] = useState("")
  const [password, setPassword] = useState("")
  const [confirmPassword, setConfirmPassword] = useState("")
  const [accountType, setAccountType] = useState("Buyer")
  const [reportType, setReportType] = useState("complaint");
const [reportSubject, setReportSubject] = useState("");
const [reportDescription, setReportDescription] = useState("");
  const handleAuth = async () => {
  if (showLogin) {
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    })

    if (error) {
      alert(error.message)
   } else {
  const { data: profile, error: profileError } = await supabase
    .from("profiles")
    .select("role")
    .eq("id", data.user.id)
    .single()

  if (profileError) {
    alert(profileError.message)
    return
  }

  setUserRole(profile.role)
  setLoggedIn(true)
}
  } else {
    if (password !== confirmPassword) {
      alert("Passwords do not match")
      return
    }

    const { error } = await supabase.auth.signUp({
  email,
  password,
  options: {
    data: {
      role: accountType.toLowerCase(),
    },
  },
})

    if (error) {
      alert(error.message)
    } else {
      alert("Account created successfully!")
    }
  }
}
const loadUsers = async () => {
  const { data, error } = await supabase
    .from("profiles")
    .select("id, email, full_name, role, status, created_at")
    .order("created_at", { ascending: false });

  if (error) {
    console.log("USERS ERROR:", error);
    alert(error.message);
    return;
  }

  setUsers(data);
};
useEffect(() => {
  if (
    loggedIn &&
    userRole === "admin" &&
    ["dashboard", "analytics", "users", "buyers", "sellers"].includes(
      adminSection
    )
  ) {
    loadUsers();
  }
}, [loggedIn, userRole, adminSection]);
const updateUserStatus = async (userId, currentStatus) => {
  const newStatus = currentStatus === "active" ? "suspended" : "active";

  const { error } = await supabase
    .from("profiles")
    .update({ status: newStatus })
    .eq("id", userId);

  console.log("UPDATE RESULT:", { userId, newStatus, error });

  if (error) {
    alert(error.message);
    return;
  }

  loadUsers();
};

useEffect(() => {
  const loadAdminOrders = async () => {
    if (!loggedIn || userRole !== "admin") return;

    const { data, error } = await supabase
      .from("orders")
      .select(`
        *,
        products (
          name,
          price
        )
      `)
      .order("created_at", { ascending: false });

    if (error) {
      console.log("ADMIN ORDERS ERROR:", error);
      return;
    }

    setAdminOrders(data || []);
  };

  loadAdminOrders();
}, [loggedIn, userRole]);
useEffect(() => {
  const loadAdminPayments = async () => {
    if (!loggedIn || userRole !== "admin") return;

    const { data, error } = await supabase
      .from("payments")
      .select("*")
      .order("created_at", { ascending: false });

    if (error) {
      console.log("ADMIN PAYMENTS ERROR:", error);
      return;
    }

    setAdminPayments(data || []);
  };

  loadAdminPayments();
}, [loggedIn, userRole]);
const loadAdminWithdrawals = async () => {
  const { data, error } = await supabase
    .from("withdrawals")
    .select("*")
    .order("created_at", { ascending: false });

  if (error) {
    console.log("ADMIN WITHDRAWALS ERROR:", error);
    return;
  }

  setAdminWithdrawals(data || []);
};
const updateWithdrawalStatus = async (withdrawalId, newStatus) => {
  const { error } = await supabase
    .from("withdrawals")
    .update({ status: newStatus })
    .eq("id", withdrawalId);

  if (error) {
    console.log("UPDATE WITHDRAWAL ERROR:", error);
    alert(error.message);
    return;
  }

  setAdminWithdrawals((currentWithdrawals) =>
    currentWithdrawals.map((withdrawal) =>
      withdrawal.id === withdrawalId
        ? { ...withdrawal, status: newStatus }
        : withdrawal
    )
  );

  alert(`Withdrawal ${newStatus}.`);
};
useEffect(() => {
  if (loggedIn && userRole === "admin") {
    loadAdminWithdrawals();
  }
}, [loggedIn, userRole]);
useEffect(() => {
  const loadAdminReports = async () => {
    if (!loggedIn || userRole !== "admin") return;

    const { data, error } = await supabase
      .from("reports")
      .select("*")
      .order("created_at", { ascending: false });

    if (error) {
      console.log("REPORTS ERROR:", error);
      return;
    }

    setAdminReports(data || []);
  };

  loadAdminReports();
}, [loggedIn, userRole]);
useEffect(() => {
  const getSellerId = async () => {
    const { data: { user } } = await supabase.auth.getUser();

    if (user) {
      setSellerId(user.id);
    }
  };

  getSellerId();
}, []);
useEffect(() => {
  const loadProducts = async () => {
    if (!sellerId) return;

    const { data, error } = await supabase
      .from("products")
      .select("*")
      .eq("seller_id", sellerId)
      .order("created_at", { ascending: false });

    if (error) {
      console.log("PRODUCTS ERROR:", error);
      return;
    }

    setProducts(data);
  };

  if (loggedIn && userRole === "seller") {
    loadProducts();
  }
}, [loggedIn, userRole, sellerId]);
useEffect(() => {
  const loadAdminProducts = async () => {
    if (!loggedIn || userRole !== "admin") return;

    const { count, error } = await supabase
      .from("products")
      .select("*", { count: "exact", head: true });

    if (error) {
      console.log("ADMIN PRODUCTS ERROR:", error);
      return;
    }

    setTotalProducts(count || 0);
  };

  loadAdminProducts();
}, [loggedIn, userRole]);
useEffect(() => {
  const loadAdminProductList = async () => {
    if (!loggedIn || userRole !== "admin") return;

    const { data, error } = await supabase
      .from("products")
      .select("id, name, price, created_at")
      .order("created_at", { ascending: false })
      .limit(5);

    if (error) {
      console.log("ADMIN PRODUCT LIST ERROR:", error);
      return;
    }

    setAdminProducts(data || []);
  };

  loadAdminProductList();
}, [loggedIn, userRole]);
useEffect(() => {
  const loadSellerOrders = async () => {
    if (!sellerId) return;

    const { data: sellerProducts, error: productsError } = await supabase
  .from("products")
  .select("id")
  .eq("seller_id", sellerId);

if (productsError) {
  console.log("SELLER PRODUCTS ERROR:", productsError);
  return;
}

const productIds = (sellerProducts || []).map((product) => product.id);
console.log("SELLER ID:", sellerId);
console.log("SELLER PRODUCTS:", sellerProducts);
console.log("PRODUCT IDS:", productIds);

if (productIds.length === 0) {
  setSellerOrders([]);
  setSellerTotalSales(0);
  setSellerCommission(0);
  setSellerEarnings(0);
  return;
}

const { data, error } = await supabase
  .from("orders")
  .select(`
    *,
    products (
      name,
      price
    )
  `)
  .in("product_id", productIds)
  .order("created_at", { ascending: false });

    if (error) {
      console.log("SELLER ORDERS ERROR:", error);
      return;
    }

    setSellerOrders(data);
    const paidOrders = (data || []).filter(
  (order) =>
    order.payment_status === "paid" &&
    order.status === "accepted"
);

const totalSales = paidOrders.reduce(
  (total, order) =>
    total + Number(order.products?.price || 0) * Number(order.quantity || 1),
  0
);

const commission = totalSales * (commissionRate / 100);
const earnings = totalSales - commission;

setSellerTotalSales(totalSales);
setSellerCommission(commission);
setSellerEarnings(earnings);
  };

  if (loggedIn && userRole === "seller") {
    loadSellerOrders();
  }
}, [loggedIn, userRole, sellerId, commissionRate]);
useEffect(() => {
  const loadBuyerProducts = async () => {
    const { data, error } = await supabase
  .from("products")
  .select("*")
  .eq("is_active", true)
  .order("created_at", { ascending: false });
    if (error) {
      console.log("BUYER PRODUCTS ERROR:", error);
      return;
    }

    setBuyerProducts(data);
  };

  if (loggedIn && userRole === "buyer") {
    loadBuyerProducts();
  }
}, [loggedIn, userRole]);
useEffect(() => {
  const loadBuyerOrders = async () => {
    const { data: { user } } = await supabase.auth.getUser();

    if (!user) return;

    const { data, error } = await supabase
      .from("orders")
      .select(`
        *,
        products (
          name,
          price
        )
      `)
      .eq("buyer_id", user.id)
      .order("created_at", { ascending: false });

    if (error) {
      console.log("BUYER ORDERS ERROR:", error);
      return;
    }

    setBuyerOrders(data);
    const { data: stores, error: storesError } = await supabase
  .from("stores")
  .select("*")
  .eq("status", "active");

if (storesError) {
  console.log("BUYER STORES ERROR:", storesError);
} else {
  setBuyerStores(stores || []);
  console.log("BUYER STORES:", stores);
}
  };

  if (loggedIn && userRole === "buyer") {
    loadBuyerOrders();
  }
}, [loggedIn, userRole]);
const requestWithdrawal = async () => {
  const amount = Number(withdrawalAmount);

  if (!amount || amount <= 0) {
    alert("Please enter a valid withdrawal amount.");
    return;
  }

  if (amount > sellerEarnings) {
    alert("You cannot withdraw more than your available earnings.");
    return;
  }

  const { data: { user } } = await supabase.auth.getUser();

  if (!user) {
    alert("Please log in first.");
    return;
  }

  if (!sellerPhone) {
    alert("Please save your M-Pesa number first.");
    return;
  }

  const { error } = await supabase
    .from("withdrawals")
    .insert([
      {
        seller_id: user.id,
        phone: sellerPhone,
        amount: amount,
        status: "pending",
      },
    ]);

  if (error) {
    console.log("WITHDRAWAL ERROR:", error);
    alert(error.message);
    return;
  }

  alert("Withdrawal request submitted successfully.");

  setWithdrawalAmount("");
};
const submitReport = async () => {
  const { data: { user } } = await supabase.auth.getUser();

  if (!user) {
    alert("Please log in first.");
    return;
  }

  if (!reportSubject || !reportDescription) {
    alert("Please fill in all fields.");
    return;
  }

  const { error } = await supabase
    .from("reports")
    .insert([
      {
        user_id: user.id,
        user_role: userRole,
        type: reportType,
        subject: reportSubject,
        description: reportDescription,
        status: "pending",
      },
    ]);

  if (error) {
    console.log("REPORT ERROR:", error);
    alert(error.message);
    return;
  }

  alert("Report submitted successfully.");

  setReportSubject("");
  setReportDescription("");
};
const updateReportStatus = async (reportId, newStatus) => {
  const { error } = await supabase
    .from("reports")
    .update({ status: newStatus })
    .eq("id", reportId);

  if (error) {
    console.log("UPDATE REPORT ERROR:", error);
    alert(error.message);
    return;
  }

  setAdminReports((currentReports) =>
    currentReports.map((report) =>
      report.id === reportId
        ? { ...report, status: newStatus }
        : report
    )
  );

  alert("Report status updated.");
};

if (loggedIn && userRole === "admin") {
  
  return (
    <div style={styles.adminPage}>
      <aside style={styles.sidebar}>
        <div style={styles.adminLogo}>MAC-CHERU</div>
        <p style={styles.adminLabel}>ADMIN PANEL</p>

        <button
          style={styles.sideButton}
          onClick={() => setAdminSection("dashboard")}
        >
          📊 Dashboard
        </button>

        <button
          style={styles.sideButton}
          onClick={() => setAdminSection("users")}
        >
          👥 Users
        </button>
        <button
  style={styles.sideButton}
  onClick={() => setAdminSection("products")}
>
  📦 Products
</button>

        <button
  style={styles.sideButton}
  onClick={() => setAdminSection("buyers")}
>
  🛍️ Buyers
</button>

<button
  style={styles.sideButton}
  onClick={() => setAdminSection("sellers")}
>
  🏪 Sellers
</button>
        
        <button
  style={styles.sideButton}
  onClick={() => setAdminSection("orders")}
>
  🧾 Orders
</button>
        <button
  style={styles.sideButton}
  onClick={() => setAdminSection("payments")}
>
  💳 Payments
</button>
<button
  style={styles.sideButton}
  onClick={() => setAdminSection("wallet")}
>
  💰 Admin Wallet
</button>
<button
  onClick={() => setAdminSection("withdrawals")}
  style={styles.sideButton}
>
  💸 Withdrawals
</button>
        <button
  style={styles.sideButton}
  onClick={() => setAdminSection("reports")}
>
  📢 Reports & Complaints
</button>
        <button
  style={styles.sideButton}
  onClick={() => setAdminSection("analytics")}
>
  📊 Analytics
</button>
        <button
  style={styles.sideButton}
  onClick={() => setAdminSection("settings")}
>
  ⚙️ Settings
</button>

        <button
          style={styles.logoutButton}
          onClick={() => {
            setLoggedIn(false);
            setUserRole(null);
          }}
        >
          🚪 Logout
        </button>
      </aside>

      <main style={styles.adminMain}>

{adminSection === "dashboard" && (
  <>
    <h1 style={styles.dashboardTitle}>Admin Dashboard</h1>

    <p style={styles.dashboardSubtitle}>
      Welcome to the Mac-Cheru administration panel.
    </p>

    <div style={styles.statsGrid}>
      <div style={styles.statCard}>
        <h3>Total Users</h3>
        <p>{users.length}</p>
      </div>

      <div style={styles.statCard}>
        <h3>Sellers</h3>
        <p>{users.filter((user) => user.role === "seller").length}</p>
      </div>

      <div style={styles.statCard}>
        <h3>Buyers</h3>
        <p>{users.filter((user) => user.role === "buyer").length}</p>
      </div>

      <div style={styles.statCard}>
        <h3>Products</h3>
        <p>{totalProducts}</p>
      </div>
    </div>
    <div style={styles.activityCard}>
  <h2>Recent Orders</h2>

  {adminOrders.length === 0 ? (
    <p>No recent orders.</p>
  ) : (
    adminOrders.slice(0, 5).map((order) => (
      <div key={order.id} style={styles.orderCard}>
        <p>
          <strong>Product:</strong>{" "}
          {order.products?.name || "Unknown product"}
        </p>

        <p>
          <strong>Status:</strong> {order.status}
        </p>

        <p>
          <strong>Date:</strong>{" "}
          {new Date(order.created_at).toLocaleDateString()}
        </p>
      </div>
    ))
  )}
</div>
<div style={styles.activityCard}>
  <h2>Recent Products</h2>

  {adminProducts.length === 0 ? (
    <p>No recent products.</p>
  ) : (
    adminProducts.map((product) => (
      <div key={product.id} style={styles.orderCard}>
        <p>
          <strong>Product:</strong> {product.name}
        </p>

        <p>
          <strong>Price:</strong> KSh {product.price}
        </p>

        <p>
          <strong>Date:</strong>{" "}
          {new Date(product.created_at).toLocaleDateString()}
        </p>
      </div>
    ))
  )}
</div>
  </>
)}



{adminSection === "withdrawals" && (
  <>
    <h1 style={styles.dashboardTitle}>Withdrawal Requests</h1>

    {adminWithdrawals.length === 0 ? (
      <p>No withdrawal requests found.</p>
    ) : (
      adminWithdrawals.map((withdrawal) => (
        <div key={withdrawal.id} style={styles.activityCard}>
          <h3>
            KSh {Number(withdrawal.amount).toLocaleString()}
          </h3>

          <p>
            <strong>M-Pesa:</strong> {withdrawal.phone}
          </p>

          <p>
            <strong>Seller ID:</strong> {withdrawal.seller_id}
          </p>

          <p>
            <strong>Status:</strong> {withdrawal.status}
          </p>

          <p>
            <strong>Date:</strong>{" "}
            {new Date(withdrawal.created_at).toLocaleString()}
          </p>
          <div style={{ display: "flex", gap: "10px", marginTop: "15px" }}>
  {withdrawal.status === "pending" && (
    <>
      <button
        onClick={() => updateWithdrawalStatus(withdrawal.id, "approved")}
        style={styles.manageButton}
      >
        Approve
      </button>

      <button
        onClick={() => updateWithdrawalStatus(withdrawal.id, "rejected")}
        style={styles.manageButton}
      >
        Reject
      </button>
    </>
  )}
</div>
        </div>
      ))
    )}
  </>
)}

{adminSection === "reports" && (

  <>
    <h1 style={styles.dashboardTitle}>Reports & Complaints</h1>

    <p style={styles.dashboardSubtitle}>
      Review reports and complaints submitted by Mac-Cheru users.
    </p>

    {adminReports.length === 0 ? (
      <div style={styles.activityCard}>
        <h2>No Reports Yet</h2>
        <p>No reports or complaints have been submitted.</p>
      </div>
    ) : (
      <div style={styles.activityCard}>
        {adminReports.map((report) => (
          <div
            key={report.id}
            style={{
              border: "1px solid #ddd",
              borderRadius: "8px",
              padding: "20px",
              marginBottom: "15px",
              backgroundColor: "white",
            }}
          >
            <h3>{report.subject}</h3>

            <p>
              <strong>Type:</strong> {report.type}
            </p>
            <div style={{ marginTop: "10px" }}>
  <button
    type="button"
    onClick={() => updateReportStatus(report.id, "reviewed")}
    style={{
      padding: "8px 14px",
      marginRight: "8px",
      backgroundColor: "#2563eb",
      color: "white",
      border: "none",
      borderRadius: "6px",
      cursor: "pointer",
    }}
  >
    Mark Reviewed
  </button>

  <button
    type="button"
    onClick={() => updateReportStatus(report.id, "resolved")}
    style={{
      padding: "8px 14px",
      backgroundColor: "#16a34a",
      color: "white",
      border: "none",
      borderRadius: "6px",
      cursor: "pointer",
    }}
  >
    Mark Resolved
  </button>
</div>

            <p>
              <strong>User Role:</strong> {report.user_role}
            </p>

            <p>
              <strong>Description:</strong> {report.description}
            </p>

            <p>
              <strong>Status:</strong> {report.status}
            </p>

            <p>
              <strong>Date:</strong>{" "}
              {new Date(report.created_at).toLocaleString()}
            </p>
          </div>
        ))}
      </div>
    )}
  </>
)}
{adminSection === "analytics" && (
  <>
    <h1 style={styles.dashboardTitle}>Analytics</h1>

    <p style={styles.dashboardSubtitle}>
      View marketplace performance and payment activity.
    </p>

    <div style={styles.statsGrid}>
      <div style={styles.statCard}>
        <h3>Total Users</h3>
        <p>{users.length}</p>
      </div>

      <div style={styles.statCard}>
        <h3>Sellers</h3>
        <p>{users.filter((user) => user.role === "seller").length}</p>
      </div>

      <div style={styles.statCard}>
        <h3>Buyers</h3>
        <p>{users.filter((user) => user.role === "buyer").length}</p>
      </div>

      <div style={styles.statCard}>
        <h3>Total Products</h3>
        <p>{totalProducts}</p>
      </div>

      <div style={styles.statCard}>
        <h3>Total Orders</h3>
        <p>{adminOrders.length}</p>
      </div>
    </div>

    <div style={styles.statsGrid}>
      <div style={styles.statCard}>
        <h3>Total Sales</h3>
        <p>
          KSh{" "}
          {adminPayments
            .filter((payment) => payment.status === "paid")
            .reduce(
              (total, payment) => total + Number(payment.amount || 0),
              0
            )
            .toLocaleString()}
        </p>
      </div>

      <div style={styles.statCard}>
        <h3>Commission Earned</h3>
        <p>
          KSh{" "}
          {adminPayments
            .filter((payment) => payment.status === "paid")
            .reduce(
              (total, payment) => total + Number(payment.commission || 0),
              0
            )
            .toLocaleString()}
        </p>
      </div>

      <div style={styles.statCard}>
        <h3>Seller Earnings</h3>
        <p>
          KSh{" "}
          {adminPayments
            .filter((payment) => payment.status === "paid")
            .reduce(
              (total, payment) =>
                total + Number(payment.seller_amount || 0),
              0
            )
            .toLocaleString()}
        </p>
      </div>
    </div>

    <div style={styles.activityCard}>
      <h2>Payment Activity</h2>

      <p>
        Successful payments:{" "}
        {adminPayments.filter((payment) => payment.status === "paid").length}
      </p>

      <p>
        Pending payments:{" "}
        {adminPayments.filter((payment) => payment.status === "pending").length}
      </p>

      <p>
        Failed payments:{" "}
        {adminPayments.filter(
          (payment) => payment.status === "payment_failed"
        ).length}
      </p>
    </div>
  </>
)}
{adminSection === "settings" && (
  <>
    <h1 style={styles.dashboardTitle}>Settings</h1>

    <p style={styles.dashboardSubtitle}>
      Manage Mac-Cheru administration settings.
    </p>

    <div style={styles.activityCard}>
      <h2>Commission Settings</h2>

<p>Current commission rate: {commissionRate}%</p>

<input
  type="number"
  value={commissionRate}
  onChange={(e) => setCommissionRate(e.target.value)}
  style={styles.input}
/>

<button
  style={styles.primaryButton}
  onClick={async () => {
    const rate = Number(commissionRate);

    if (rate < 0 || rate > 100) {
      alert("Commission rate must be between 0% and 100%.");
      return;
    }

    const { error } = await supabase
      .from("settings")
      .update({
        commission_rate: rate,
        updated_at: new Date().toISOString(),
      })
      .not("id", "is", null);

    if (error) {
      console.log("SETTINGS UPDATE ERROR:", error);
      alert(error.message);
      return;
    }

    alert("Commission rate saved successfully!");
  }}
>
 Save Commission Rate
</button>
    </div>

    {/* Marketplace Settings */}
    <div style={styles.activityCard}>
  <h2>Marketplace Settings</h2>
  <p>Control whether buyers can place new orders.</p>

  <button
    style={styles.primaryButton}
    onClick={async () => {
      const { data, error } = await supabase
        .from("marketplace_settings")
        .select("is_open")
        .eq("id", 1)
        .single();

      if (error) {
        alert(error.message);
        return;
      }

      const { error: updateError } = await supabase
        .from("marketplace_settings")
        .update({
          is_open: !data.is_open,
          updated_at: new Date().toISOString(),
        })
        .eq("id", 1);

      if (updateError) {
        alert(updateError.message);
        return;
      }

      alert(data.is_open ? "Marketplace paused." : "Marketplace opened.");
    }}
  >
    Toggle Marketplace Open / Paused
  </button>
</div>
  </>
)}
  {adminSection === "users" && (
    <>
      <h1 style={styles.dashboardTitle}>User Management</h1>

      <p style={styles.dashboardSubtitle}>
        View and manage Mac-Cheru user accounts.
      </p>

        <div style={styles.activityCard}>
          <h2>Users</h2>

{users.length === 0 ? (
  <p>No users found.</p>
) : (
  <table style={{ width: "100%", borderCollapse: "collapse" }}>
    <thead>
      <tr>
        <th style={styles.tableHeader}>Email</th>
        <th style={styles.tableHeader}>Role</th>
        <th style={styles.tableHeader}>Status</th>
        <th style={styles.tableHeader}>Date Joined</th>
      </tr>
    </thead>

    <tbody>
      {users.map((user) => (
        <tr key={user.id}>
          <td style={styles.tableCell}>{user.email}</td>
          <td style={styles.tableCell}>{user.role}</td>
          <td style={styles.tableCell}>
  <span>{user.status}</span>

  <button
    style={styles.manageButton}
    onClick={() => updateUserStatus(user.id, user.status)}
  >
    {user.status === "active" ? "Suspend" : "Activate"}
  </button>
</td>
          <td style={styles.tableCell}>
            {new Date(user.created_at).toLocaleDateString()}
          </td>
        </tr>
      ))}
    </tbody>
  </table>
)}
      
        
        </div>
      </>
  )}
  {adminSection === "products" && (
  <>
    <h1 style={styles.dashboardTitle}>Product Management</h1>

    <p style={styles.dashboardSubtitle}>
      View and manage products listed on Mac-Cheru.
    </p>

    <div style={styles.activityCard}>
      <div style={{ marginTop: "30px" }}>
  <h2>Stores</h2>

  {buyerStores.length === 0 ? (
    <p>No stores available yet.</p>
  ) : (
    buyerStores.map((store) => (
      <div
        key={store.id}
        style={{
          border: "1px solid #ccc",
          padding: "15px",
          marginBottom: "15px",
          borderRadius: "8px",
        }}
      >
        <h3>{store.store_name}</h3>

        <p>{store.description}</p>

        <p>
          <strong>Phone:</strong> {store.phone || "Not provided"}
        </p>

        <p>
          <strong>Status:</strong> {store.status}
        </p>
      </div>
    ))
  )}
</div>
      <h2>Products</h2>

      <p>
        Total Products: <strong>{totalProducts}</strong>
      </p>
    </div>
  </>
)}
{adminSection === "orders" && (
  <>
    <h1 style={styles.dashboardTitle}>Order Management</h1>

    <p style={styles.dashboardSubtitle}>
      View and monitor all orders placed on Mac-Cheru.
    </p>

    <div style={styles.activityCard}>
      <h2>Orders</h2>

      {adminOrders.length === 0 ? (
        <p>No orders found.</p>
      ) : (
        <div>
          {adminOrders.map((order) => (
            <div key={order.id} style={styles.orderCard}>
              <p>
                <strong>Product:</strong>{" "}
                {order.products?.name || "Unknown product"}
              </p>

              <p>
                <strong>Quantity:</strong> {order.quantity}
              </p>

              <p>
                <strong>Status:</strong> {order.status}
              </p>

              <p>
                <strong>Date:</strong>{" "}
                {new Date(order.created_at).toLocaleDateString()}
              </p>
            </div>
          ))}
        </div>
      )}
    </div>
  </>
)}
{adminSection === "payments" && (
  <>
    <h1 style={styles.dashboardTitle}>Payment Management</h1>

<p style={styles.dashboardSubtitle}>
  Monitor payments made through Mac-Cheru.
</p>

<div style={styles.activityCard}>
  <h2>Payments</h2>

  {adminPayments.length === 0 ? (
    <p>No payment records available yet.</p>
  ) : (
    <div style={{ overflowX: "auto" }}>
      <table style={{ width: "100%", borderCollapse: "collapse" }}>
        <thead>
          <tr>
            <th style={{ padding: "12px", textAlign: "left" }}>Amount</th>
            <th style={{ padding: "12px", textAlign: "left" }}>Commission</th>
            <th style={{ padding: "12px", textAlign: "left" }}>Seller Amount</th>
            <th style={{ padding: "12px", textAlign: "left" }}>Status</th>
            <th style={{ padding: "12px", textAlign: "left" }}>Date</th>
          </tr>
        </thead>

        <tbody>
          {adminPayments.map((payment) => (
            <tr key={payment.id}>
              <td style={{ padding: "12px" }}>
                KSh {Number(payment.amount).toLocaleString()}
              </td>

              <td style={{ padding: "12px" }}>
                KSh {Number(payment.commission).toLocaleString()}
              </td>

              <td style={{ padding: "12px" }}>
                KSh {Number(payment.seller_amount).toLocaleString()}
              </td>

              <td style={{ padding: "12px" }}>
                {payment.status}
              </td>

              <td style={{ padding: "12px" }}>
                {new Date(payment.created_at).toLocaleDateString()}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )}
</div>
  </>
)}
{adminSection === "wallet" && (
  <>
    <h1 style={styles.dashboardTitle}>Admin Commission Wallet</h1>

    <p style={styles.dashboardSubtitle}>
      View your confirmed commission and request withdrawals.
    </p>

    <div style={styles.statsGrid}>
      <div style={styles.statCard}>
        <h3>Total Confirmed Commission</h3>
        <h2>KSh {walletCommission.toLocaleString("en-KE")}</h2>
      </div>

      <div style={styles.statCard}>
        <h3>Available Balance</h3>
        <h2>
  KSh {Math.max(0, walletCommission - walletReserved).toLocaleString("en-KE")}
</h2>
      </div>

      <div style={styles.statCard}>
        <h3>Pending Withdrawals</h3>
        <h2>KSh {walletPending.toLocaleString("en-KE")}</h2>
      </div>
    </div>

    <div style={styles.activityCard}>
      <h2>Withdraw Commission</h2>
      
        <form onSubmit={handleWalletWithdrawal}>
  <label style={{ display: "block", marginBottom: "6px" }}>
    Withdrawal amount (KSh)
  </label>

  <input
    type="number"
    min="1"
    step="0.01"
    value={walletAmount}
    onChange={(event) => setWalletAmount(event.target.value)}
    placeholder="Enter amount"
    required
    style={{
      width: "100%",
      padding: "12px",
      marginBottom: "16px",
      borderRadius: "8px",
      border: "1px solid #cbd5e1",
      boxSizing: "border-box",
    }}
  />

  <label style={{ display: "block", marginBottom: "6px" }}>
    M-Pesa phone number
  </label>

  <input
    type="tel"
    value={walletPhone}
    onChange={(event) => setWalletPhone(event.target.value)}
    placeholder="0740575196"
    required
    style={{
      width: "100%",
      padding: "12px",
      marginBottom: "16px",
      borderRadius: "8px",
      border: "1px solid #cbd5e1",
      boxSizing: "border-box",
    }}
  />

  <button type="submit" style={styles.manageButton}>
    Request Withdrawal
  </button>

  {walletMessage && (
    <p style={{ marginTop: "14px" }}>{walletMessage}</p>
  )}
</form>
<h2 style={{ marginTop: "30px" }}>Withdrawal History</h2>

<div style={{ overflowX: "auto" }}>
  <table style={{ width: "100%", borderCollapse: "collapse" }}>
    <thead>
      <tr>
        <th style={{ padding: "10px", textAlign: "left" }}>Amount</th>
        <th style={{ padding: "10px", textAlign: "left" }}>M-Pesa Number</th>
        <th style={{ padding: "10px", textAlign: "left" }}>Status</th>
        <th style={{ padding: "10px", textAlign: "left" }}>Date</th>
      </tr>
    </thead>

    <tbody>
      {walletHistory.length === 0 ? (
        <tr>
          <td colSpan="4" style={{ padding: "10px" }}>
            No withdrawal requests yet.
          </td>
        </tr>
      ) : (
        walletHistory.map((withdrawal) => (
          <tr key={withdrawal.id}>
            <td style={{ padding: "10px" }}>
              KSh {Number(withdrawal.amount).toLocaleString("en-KE")}
            </td>
            <td style={{ padding: "10px" }}>
              {withdrawal.mpesa_number}
            </td>
            <td style={{ padding: "10px" }}>
              {withdrawal.status}
            </td>
            <td style={{ padding: "10px" }}>
              {new Date(withdrawal.created_at).toLocaleDateString("en-KE")}
            </td>
          </tr>
        ))
      )}
    </tbody>
  </table>
</div>
      
    </div>
  </>
)}
  {adminSection === "buyers" && (
  <>
    <h1 style={styles.dashboardTitle}>Buyer Management</h1>

    <p style={styles.dashboardSubtitle}>
      View and manage Mac-Cheru buyers.
    </p>

    <div style={styles.activityCard}>
      <h2>Buyers</h2>

      <p>
  Manage registered buyers, view their details, and monitor buyer activity.
</p>
<div style={styles.activityCard}>
  <h2>Registered Buyers</h2>
  <p>
  {users.filter((user) => user.role === "buyer").length} registered buyer(s).
</p>
</div>
    </div>
  </>
)}
{adminSection === "sellers" && (
  <>
    <h1 style={styles.dashboardTitle}>Seller Management</h1>

    <p style={styles.dashboardSubtitle}>
      View and manage Mac-Cheru sellers.
    </p>

    <div style={styles.activityCard}>
      <h2>Sellers</h2>

      <p>
  {users.filter((user) => user.role === "seller").length} registered seller(s).
</p>
    </div>
  </>
)}
      </main>
      <HotlineWidget />
    </div>
  );
}
  

if (loggedIn && userRole === "seller") {
  return (
    <div
  style={{
    padding: "40px",
    fontFamily: "Arial, sans-serif",
    background: "linear-gradient(180deg, #f8fafc 0%, #eef2f7 100%)",
color: "#0f172a",
    minHeight: "100vh",
  }}
>
      <h1 style={{ fontSize: "32px", marginBottom: "10px" }}>
  Seller Dashboard
</h1>
      <p>
  Manage your products, track orders, and monitor your sales on Mac-Cheru.
</p>
<div style={{ marginTop: "30px" }}>
  <div style={{ marginTop: "30px" }}>
  <h2
  style={{
    color: "#0f172a",
    fontSize: "24px",
    marginBottom: "18px",
    paddingBottom: "12px",
    borderBottom: "3px solid #d4af37",
  }}
>
  My Store
</h2>

  <input
    type="text"
    placeholder="Store name"
    value={storeName}
    onChange={(e) => setStoreName(e.target.value)}
    style={styles.input}
  />

  <textarea
    placeholder="Store description"
    value={storeDescription}
    onChange={(e) => setStoreDescription(e.target.value)}
    style={styles.input}
  />

  <button
    type="button"
    onClick={async () => {
      const { data: { user } } = await supabase.auth.getUser();

      if (!user) {
        alert("Please log in first.");
        return;
      }

      if (!storeName.trim()) {
        alert("Please enter a store name.");
        return;
      }

      const { error } = await supabase
        .from("stores")
        .insert({
          seller_id: user.id,
          store_name: storeName,
          description: storeDescription,
          phone: sellerPhone,
        });

      if (error) {
        console.log("STORE ERROR:", error);
        alert(error.message);
        return;
      }

      setStoreCreated(true);
      alert("Store created successfully!");
    }}
    style={{
  background: "linear-gradient(135deg, #059669, #047857)",
  color: "#ffffff",
  border: "none",
  borderRadius: "10px",
  padding: "13px 22px",
  fontSize: "15px",
  fontWeight: "bold",
  cursor: "pointer",
  boxShadow: "0 5px 12px rgba(5, 150, 105, 0.25)",
  marginTop: "12px",
}}
  >
    Create My Store
  </button>

  {storeCreated && (
    <p style={{ color: "green" }}>
      Your store has been created successfully.
    </p>
  )}
</div>
  <h2 style={{ fontSize: "24px", marginBottom: "15px" }}>
  My Products
</h2>
  <button
  onClick={() => setShowProductForm(true)}
  style={{
  padding: "10px 18px",
  marginTop: "15px",
  backgroundColor: "#2563eb",
  color: "white",
  border: "none",
  borderRadius: "6px",
  fontWeight: "bold",
  cursor: "pointer",
}}
>
  + Add Product
</button>
{products.length === 0 ? (
  <p>No products added yet.</p>
) : (
  <div style={{ marginTop: "20px" }}>
    {products.map((product) => (
      <div
        key={product.id}
        style={{
  border: "1px solid #e2e8f0",
  borderLeft: "5px solid #d4af37",
  borderRadius: "14px",
  padding: "24px",
  marginBottom: "18px",
  background: "linear-gradient(145deg, #ffffff, #f8fafc)",
  boxShadow: "0 8px 22px rgba(15, 23, 42, 0.07)",
}}
      >
        <h3 style={{ marginTop: "0", fontSize: "20px" }}>
  {product.name}
</h3>
        <p style={{ fontWeight: "bold", fontSize: "18px" }}>
  Price: KSh {product.price}
</p>
        <p style={{ color: "#64748b", marginTop: "8px" }}>
  {product.description}
</p>
<p>
          Availability:{" "}
          <strong>
            {product.is_active === false ? "Inactive" : "Active"}
          </strong>
        </p>

        <button
          onClick={async () => {
            const newStatus = product.is_active === false;

            const { data, error } = await supabase
              .from("products")
              .update({ is_active: newStatus })
.select("id, is_active")
              .eq("id", product.id);

            if (error) {
              alert(error.message);
              return;
            }
            console.log("PRODUCT UPDATE RESULT:", data);

            setProducts((previousProducts) =>
              previousProducts.map((item) =>
                item.id === product.id
                  ? { ...item, is_active: newStatus }
                  : item
              )
            );

            alert(
              newStatus
                ? "Product activated successfully."
                : "Product deactivated successfully."
            );
          }}
          style={{
background: product.is_active === false
? "linear-gradient(135deg, #059669, #047857)"
: "linear-gradient(135deg, #ea580c, #c2410c)",
color: "#ffffff",
border: "none",
borderRadius: "9px",
padding: "10px 16px",
marginTop: "10px",
fontSize: "14px",
fontWeight: "bold",
cursor: "pointer",
boxShadow: "0 4px 10px rgba(15, 23, 42, 0.12)",
}}
        >
          {product.is_active === false
            ? "Activate Product"
            : "Deactivate Product"}
        </button>
      </div>
    ))}
  </div>
)}
</div>

{showProductForm && (
  <div style={{ marginTop: "20px" }}>
    <h2>Add Product</h2>
    <input
  type="text"
  placeholder="Product name"
  value={productName}
  onChange={(e) => setProductName(e.target.value)}
/>
    <input
  type="number"
  placeholder="Price"
  value={productPrice}
  onChange={(e) => setProductPrice(e.target.value)}
/>

    <textarea
  placeholder="Product description"
  value={productDescription}
  onChange={(e) => setProductDescription(e.target.value)}
></textarea>
<button
  onClick={async () => {
  const { error } = await supabase
    .from("products")
    .insert([
      {
        seller_id: sellerId,
        name: productName,
        price: parseFloat(productPrice),
        description: productDescription,
      },
    ]);

  if (error) {
    console.log("PRODUCT ERROR:", error);
    alert(error.message);
    return;
  }

  alert("Product saved successfully!");

  setProductName("");
  setProductPrice("");
  setProductDescription("");
  setShowProductForm(false);
}}
  style={{
    padding: "10px 18px",
    marginTop: "15px",
    cursor: "pointer",
  }}
>
  Save Product
</button>
  </div>
)}
      <div style={{ marginTop: "40px" }}>
  <h2 style={{ fontSize: "24px", marginBottom: "15px" }}>
  Orders
</h2>

  {sellerOrders.length === 0 ? (
    <p>No orders yet.</p>
  ) : (
    <div>
      {sellerOrders.map((order) => (
        <div
          key={order.id}
          style={{
border: "1px solid #e2e8f0",
borderLeft: "5px solid #d4af37",
borderRadius: "14px",
padding: "24px",
marginBottom: "18px",
background: "linear-gradient(145deg, #ffffff, #f8fafc)",
boxShadow: "0 8px 22px rgba(15, 23, 42, 0.07)",
}}
        >
          <h3>{order.products?.name}</h3>
          <p>Price: KSh {order.products?.price}</p>
          <p>Quantity: {order.quantity}</p>
          <p>
  Status:{" "}
  <strong
    style={{
      display: "inline-block",
padding: "5px 12px",
borderRadius: "20px",
fontSize: "12px",
fontWeight: "bold",
textTransform: "uppercase",
color:
order.status === "accepted"
? "#047857"
: order.status === "rejected" || order.status === "cancelled"
? "#b91c1c"
: "#92400e",
backgroundColor:
order.status === "accepted"
? "#d1fae5"
: order.status === "rejected" || order.status === "cancelled"
? "#fee2e2"
: "#fef3c7",
    }}
  >
    {order.status}
  </strong>
</p>
<p>
  Payment:{" "}
  <strong
    style={{
display: "inline-block",
padding: "5px 12px",
borderRadius: "20px",
fontSize: "12px",
fontWeight: "bold",
textTransform: "uppercase",
color:
order.payment_status === "paid"
? "#047857"
: order.payment_status === "failed"
? "#b91c1c"
: "#92400e",
backgroundColor:
order.payment_status === "paid"
? "#d1fae5"
: order.payment_status === "failed"
? "#fee2e2"
: "#fef3c7",
}}
  >
    {order.payment_status || "pending"}
  </strong>
</p>
          <button
  onClick={async () => {
    const { error } = await supabase
      .from("orders")
      .update({ status: "accepted" })
      .eq("id", order.id);

    if (error) {
      alert(error.message);
      return;
    }

    alert("Order accepted!");

    setSellerOrders((currentOrders) =>
      currentOrders.map((item) =>
        item.id === order.id
          ? { ...item, status: "accepted" }
          : item
      )
    );
  }}
  style={{
padding: "11px 18px",
background: "linear-gradient(135deg, #059669, #047857)",
color: "#ffffff",
border: "none",
borderRadius: "9px",
fontSize: "14px",
fontWeight: "bold",
marginTop: "10px",
cursor: "pointer",
boxShadow: "0 4px 10px rgba(5, 150, 105, 0.2)",
}}
>
  Accept Order
</button>
<button
  onClick={async () => {
    const { error } = await supabase
      .from("orders")
      .update({ status: "rejected" })
      .eq("id", order.id);

    if (error) {
      alert(error.message);
      return;
    }

    alert("Order rejected!");

    setSellerOrders((currentOrders) =>
      currentOrders.map((item) =>
        item.id === order.id
          ? { ...item, status: "rejected" }
          : item
      )
    );
  }}
  style={{
padding: "11px 18px",
background: "linear-gradient(135deg, #ea580c, #c2410c)",
color: "#ffffff",
border: "none",
borderRadius: "9px",
fontSize: "14px",
fontWeight: "bold",
marginTop: "10px",
marginLeft: "10px",
cursor: "pointer",
boxShadow: "0 4px 10px rgba(194, 65, 12, 0.2)",
}}
>
  Reject Order
</button>
        </div>
      ))}
    </div>
  )}
</div>



 {/* Seller Earnings */}

<div
  style={{
    marginTop: "40px",
    padding: "26px",
    border: "1px solid #e2e8f0",
    borderTop: "5px solid #d4af37",
    borderRadius: "16px",
    background: "linear-gradient(145deg, #ffffff, #f8fafc)",
    boxShadow: "0 8px 24px rgba(15, 23, 42, 0.08)",
  }}
>
  <h2
    style={{
      color: "#0f172a",
      fontSize: "24px",
      marginTop: 0,
      marginBottom: "22px",
    }}
  >
    Seller Earnings
  </h2>  <div style={{ display: "grid", gap: "14px" }}>
    <div style={{ padding: "16px", backgroundColor: "#f1f5f9", borderRadius: "10px" }}>
      <p style={{ margin: "0 0 6px", color: "#64748b", fontSize: "14px" }}>
        Total Sales
      </p>
      <strong style={{ fontSize: "22px", color: "#0f172a" }}>
        KSh {sellerTotalSales.toLocaleString()}
      </strong>
    </div><div style={{ padding: "16px", backgroundColor: "#fff7ed", borderRadius: "10px" }}>
  <p style={{ margin: "0 0 6px", color: "#9a3412", fontSize: "14px" }}>
    Mac-Cheru Commission ({commissionRate}%)
  </p>
  <strong style={{ fontSize: "22px", color: "#c2410c" }}>
    KSh {sellerCommission.toLocaleString()}
  </strong>
</div>

<div style={{ padding: "16px", backgroundColor: "#ecfdf5", borderRadius: "10px" }}>
  <p style={{ margin: "0 0 6px", color: "#047857", fontSize: "14px" }}>
    Your Earnings
  </p>
  <strong style={{ fontSize: "25px", color: "#047857" }}>
    KSh {sellerEarnings.toLocaleString()}
  </strong>
</div>

  </div>
</div>
  {/* Payment Details */}

<div
  style={{
    marginTop: "30px",
    padding: "26px",
    border: "1px solid #e2e8f0",
    borderTop: "5px solid #059669",
    borderRadius: "16px",
    background: "linear-gradient(145deg, #ffffff, #f8fafc)",
    boxShadow: "0 8px 24px rgba(15, 23, 42, 0.08)",
  }}
>
  <h2 style={{ color: "#0f172a", marginTop: 0, fontSize: "24px" }}>
    Payment Details
  </h2>  <p style={{ color: "#64748b", lineHeight: 1.6 }}>
    Enter the M-Pesa number where you want to receive your seller earnings.
  </p><input
type="tel"
placeholder="M-Pesa phone number"
value={sellerPhone}
onChange={(e) => setSellerPhone(e.target.value)}
style={{
...styles.input,
width: "100%",
boxSizing: "border-box",
borderRadius: "10px",
padding: "13px",
border: "1px solid #cbd5e1",
marginBottom: "16px",
}}
/>

<button
type="button"
onClick={async () => {
const { data: { user } } = await supabase.auth.getUser();

  if (!user) {
    alert("Please log in first.");
    return;
  }

  const { error } = await supabase
    .from("profiles")
    .update({ phone: sellerPhone })
    .eq("id", user.id);

  if (error) {
    console.log("PAYMENT DETAILS ERROR:", error);
    alert(error.message);
    return;
  }

  alert("Payment details saved successfully.");
}}
style={{
  background: "linear-gradient(135deg, #059669, #047857)",
  color: "#ffffff",
  border: "none",
  borderRadius: "10px",
  padding: "13px 20px",
  fontSize: "15px",
  fontWeight: "bold",
  cursor: "pointer",
  boxShadow: "0 5px 12px rgba(5, 150, 105, 0.2)",
}}
>

Save Payment Details
</button>
</div>
{/* Withdraw Earnings */}

<div
  style={{
    marginTop: "30px",
    padding: "26px",
    border: "1px solid #e2e8f0",
    borderTop: "5px solid #d4af37",
    borderRadius: "16px",
    background: "linear-gradient(145deg, #ffffff, #f8fafc)",
    boxShadow: "0 8px 24px rgba(15, 23, 42, 0.08)",
  }}
>
  <h2 style={{ color: "#0f172a", marginTop: 0, fontSize: "24px" }}>
    Withdraw Earnings
  </h2>  <p style={{ color: "#64748b", lineHeight: 1.6 }}>
    Available for withdrawal:
  </p>  <div
    style={{
      padding: "18px",
      marginBottom: "18px",
      borderRadius: "12px",
      background: "#ecfdf5",
    }}
  >
    <strong style={{ color: "#047857", fontSize: "26px" }}>
      KSh {sellerEarnings.toLocaleString()}
    </strong>
  </div><input
type="number"
placeholder="Enter amount to withdraw"
value={withdrawalAmount}
onChange={(e) => setWithdrawalAmount(e.target.value)}
style={{
...styles.input,
width: "100%",
boxSizing: "border-box",
borderRadius: "10px",
padding: "13px",
marginBottom: "16px",
}}
/>

<button
type="button"
onClick={requestWithdrawal}
style={{
background: "linear-gradient(135deg, #059669, #047857)",
color: "#ffffff",
border: "none",
borderRadius: "10px",
padding: "13px 20px",
fontSize: "15px",
fontWeight: "bold",
cursor: "pointer",
boxShadow: "0 5px 12px rgba(5, 150, 105, 0.2)",
}}
>

Request Withdrawal

  </button>
</div>{/* Reports & Complaints */}

<div
  style={{
    marginTop: "30px",
    padding: "26px",
    border: "1px solid #e2e8f0",
    borderTop: "5px solid #ea580c",
    borderRadius: "16px",
    background: "linear-gradient(145deg, #ffffff, #f8fafc)",
    boxShadow: "0 8px 24px rgba(15, 23, 42, 0.08)",
  }}
>
  <h2 style={{ color: "#0f172a", marginTop: 0, fontSize: "24px" }}>
    Reports & Complaints
  </h2>  <p style={{ color: "#64748b", lineHeight: 1.6 }}>
    Report a problem or tell us how we can improve Mac-Cheru.
  </p><input
type="text"
placeholder="Subject"
value={reportSubject}
onChange={(e) => setReportSubject(e.target.value)}
style={{
...styles.input,
width: "100%",
boxSizing: "border-box",
borderRadius: "10px",
padding: "13px",
marginBottom: "14px",
}}
/>

  <textarea
    placeholder="Describe your issue"
    value={reportDescription}
    onChange={(e) => setReportDescription(e.target.value)}
    style={{
      ...styles.input,
      width: "100%",
      boxSizing: "border-box",
      minHeight: "120px",
      borderRadius: "10px",
      padding: "13px",
      marginBottom: "16px",
      resize: "vertical",
    }}
  />

  <button
    type="button"
    onClick={submitReport}
    style={{
      background: "linear-gradient(135deg, #ea580c, #c2410c)",
      color: "#ffffff",
      border: "none",
      borderRadius: "10px",
      padding: "13px 20px",
      fontSize: "15px",
      fontWeight: "bold",
      cursor: "pointer",
      boxShadow: "0 5px 12px rgba(194, 65, 12, 0.2)",
    }}
  >
    Submit Report
  </button>
</div>
    

<button
  type="button"
  onClick={() => {
    setLoggedIn(false);
    setUserRole(null);
  }}
  style={{
    marginTop: "20px",
    padding: "10px 20px",
    backgroundColor: "#dc2626",
    color: "white",
    border: "none",
    borderRadius: "6px",
    cursor: "pointer",
    fontWeight: "bold",
  }}
>
  Logout
</button>

<HotlineWidget />
</div>
  );
}

if (loggedIn && userRole === "buyer") {
  return (
    <div
  style={{
  padding: "40px",
  fontFamily: "Arial, sans-serif",
  background: "linear-gradient(180deg, #f8fafc 0%, #eef2f7 100%)",
  minHeight: "100vh",
  color: "#0f172a",
}}
>
      <h1 style={{ fontSize: "32px", marginBottom: "10px" }}>
  Buyer Dashboard
</h1>
      <p>
  Browse products, manage your orders, and track your purchases on Mac-Cheru.
</p>
<div style={{ marginTop: "30px" }}>
  <h2 style={{ fontSize: "24px", marginBottom: "15px" }}>
  Stores
</h2>

{selectedStore && (
  <div style={{ marginTop: "20px" }}>
    <h3>{selectedStore.store_name} Products</h3>

    {storeProducts.length === 0 ? (
      <p>No products available in this store yet.</p>
    ) : (
      storeProducts.map((product) => (
        <div
          key={product.id}
          style={{
            border: "1px solid #ddd",
            borderRadius: "8px",
            padding: "15px",
            marginBottom: "10px",
            backgroundColor: "white",
          }}
        >
          <h4>{product.name}</h4>

          <p>Price: KSh {product.price}</p>

          <p>{product.description}</p>

          <button
            type="button"
            onClick={async (e) => {
              e.preventDefault();

              const { data: { user } } =
                await supabase.auth.getUser();

              if (!user) {
                alert("Please log in first.");
                return;
              }
              // Check whether the marketplace is open
const { data: marketplace, error: marketplaceError } =
  await supabase
    .from("marketplace_settings")
    .select("is_open")
    .eq("id", 1)
    .single();

if (marketplaceError) {
  console.log("MARKETPLACE CHECK ERROR:", marketplaceError);
  alert("Unable to verify marketplace availability. Please try again.");
  return;
}

if (!marketplace.is_open) {
  alert("Mac-Cheru is temporarily paused. Please try again later.");
  return;
}

              // Create the order
              const { data: order, error: orderError } =
                await supabase
                  .from("orders")
                  .insert([
                    {
                      buyer_id: user.id,
                      product_id: product.id,
                      quantity: 1,
                    },
                  ])
                  .select()
                  .single();

              if (orderError) {
                console.log("ORDER ERROR:", orderError);
                alert(orderError.message);
                return;
              }

              // Get product price
              const amount = Number(product.price);

              // Get current commission rate
              const { data: settings, error: settingsError } =
                await supabase
                  .from("settings")
                  .select("commission_rate")
                  .single();

              if (settingsError) {
                console.log("SETTINGS ERROR:", settingsError);
                alert(settingsError.message);
                return;
              }

              const commissionRate =
                Number(settings.commission_rate);

              const commission =
                amount * (commissionRate / 100);

              const sellerAmount =
                amount - commission;

              // Create payment record
              const { error: paymentError } =
                await supabase
                  .from("payments")
                  .insert([
                    {
                      order_id: order.id,
                      buyer_id: user.id,
                      seller_id: product.seller_id,
                      amount: amount,
                      commission: commission,
                      seller_amount: sellerAmount,
                      status: "pending",
                    },
                  ]);

              if (paymentError) {
                console.log(
                  "PAYMENT ERROR:",
                  paymentError
                );
                alert(paymentError.message);
                return;
              }

              // Ask buyer for M-Pesa number
              const phone = prompt(
                "Enter your M-Pesa phone number:"
              );

              if (!phone) {
                alert("Payment cancelled.");
                return;
              }

              // Start M-Pesa payment
              const {
                data: mpesaData,
                error: mpesaError,
              } = await supabase.functions.invoke(
                "hyper-action",
                {
                  body: {
                    amount: amount,
                    phone: phone,
                    callbackUrl:
                      "https://nhuvvhdppwzxnvefgzwv.supabase.co/functions/v1/mpesa-callback",
                    accountReference: "Mac-Cheru",
                  },
                }
              );

              if (mpesaError) {
                console.log(
                  "MPESA ERROR:",
                  mpesaError
                );
                alert(mpesaError.message);
                return;
              }

              console.log(
                "MPESA RESPONSE:",
                mpesaData
              );

              // Save CheckoutRequestID
              const {
                error: updatePaymentError,
              } = await supabase.rpc(
                "save_checkout_request",
                {
                  p_order_id: order.id,
                  p_checkout_request_id:
                    mpesaData.CheckoutRequestID,
                }
              );

              if (updatePaymentError) {
                console.log(
                  "PAYMENT UPDATE ERROR:",
                  updatePaymentError
                );
                alert(updatePaymentError.message);
                return;
              }

              alert(
                "M-Pesa payment prompt sent. Please check your phone."
              );
            }}
            style={{
              padding: "10px 15px",
              border: "none",
              borderRadius: "6px",
              backgroundColor: "#2563eb",
              color: "white",
              cursor: "pointer",
              fontWeight: "bold",
            }}
          >
            Buy Now
          </button>
        </div>
      ))
    )}
  </div>
)}

{buyerStores.length === 0 ? (
  <p>No stores available yet.</p>
) : (
  <div>
    {buyerStores.map((store) => (
      <div
        key={store.id}
        style={{
          border: "1px solid #ddd",
          borderRadius: "8px",
          padding: "20px",
          marginBottom: "15px",
          backgroundColor: "white",
        }}
      >
        <div
  onClick={() => setSelectedStore(store)}
  style={{
    background: "linear-gradient(135deg, #0f172a, #1e293b)",
    color: "#ffffff",
    border: "1px solid #d4af37",
    borderRadius: "16px",
    padding: "22px",
    marginBottom: "16px",
    cursor: "pointer",
    boxShadow: "0 8px 20px rgba(15, 23, 42, 0.15)",
    transition: "transform 0.2s ease",
  }}
>
  <p
    style={{
      color: "#f5c451",
      fontSize: "12px",
      fontWeight: "bold",
      letterSpacing: "2px",
      margin: "0 0 8px",
      textTransform: "uppercase",
    }}
  >
    MAC-CHERU STORE
  </p>

  <h3 style={{ fontSize: "22px", margin: "0 0 10px" }}>
    {store.store_name}
  </h3>

  <p style={{ color: "#cbd5e1", margin: 0, fontSize: "14px" }}>
    Explore this store's products
  </p>

  <p
    style={{
      color: "#34d399",
      fontWeight: "bold",
      margin: "16px 0 0",
    }}
  >
    VIEW STORE →
  </p>
</div>
      
      </div>
    ))}
  </div>
)}

<h2 style={{ fontSize: "24px", marginBottom: "15px" }}>
  Available Products
</h2>
  {buyerProducts.length === 0 ? (
  <p>No products available yet.</p>
) : (
  <div style={{ marginTop: "20px" }}>
    {buyerProducts.map((product) => (
      <div
  key={product.id}
  style={{
    border: "1px solid #e2e8f0",
    borderRadius: "16px",
    padding: "22px",
    marginBottom: "18px",
    background: "linear-gradient(145deg, #ffffff, #f8fafc)",
    boxShadow: "0 8px 24px rgba(15, 23, 42, 0.08)",
  }}
>
        <h3>{product.name}</h3>
        <p>Price: KSh {product.price}</p>
        <p>{product.description}</p>
        <button
  type="button"
  style={{
    background: "linear-gradient(135deg, #059669, #047857)",
    color: "#ffffff",
    border: "none",
    borderRadius: "10px",
    padding: "13px 22px",
    fontSize: "15px",
    fontWeight: "bold",
    cursor: "pointer",
    boxShadow: "0 5px 12px rgba(5, 150, 105, 0.25)",
    marginTop: "10px",
  }}
  onClick={async (e) => {
    e.preventDefault();
  const { data: { user } } = await supabase.auth.getUser();

if (!user) {
  alert("Please log in first.");
  return;
}

const { data: order, error } = await supabase
  .from("orders")
  .insert([
    {
      buyer_id: user.id,
      product_id: product.id,
      quantity: 1,
    },
  ])
  .select()
  .single();

if (error) {
  console.log("ORDER ERROR:", error);
  alert(error.message);
  return;
}

const amount = Number(product.price);

const { data: settings, error: settingsError } = await supabase
  .from("settings")
  .select("commission_rate")
  .single();

if (settingsError) {
  console.log("SETTINGS ERROR:", settingsError);
  alert(settingsError.message);
  return;
}

const commissionRate = Number(settings.commission_rate);
const commission = amount * (commissionRate / 100);
const sellerAmount = amount - commission;

const { error: paymentError } = await supabase
  .from("payments")
  .insert([
    {
      order_id: order.id,
      buyer_id: user.id,
      seller_id: product.seller_id,
      amount: amount,
      commission: commission,
      seller_amount: sellerAmount,
      status: "pending",
    },
  ]);

if (paymentError) {
  console.log("PAYMENT ERROR:", paymentError);
  alert(paymentError.message);
  return;
}

const phone = prompt("Enter your M-Pesa phone number:");

if (!phone) {
  alert("Payment cancelled.");
  return;
}

const { data: mpesaData, error: mpesaError } =
  await supabase.functions.invoke("hyper-action", {
    body: {
  orderId: order.id,
  phone: phone,
  callbackUrl:
    "https://nhuvvhdppwzxnvefgzwv.supabase.co/functions/v1/mpesa-callback",
  accountReference: "Mac-Cheru",
},
  });

if (mpesaError) {
  console.log("MPESA ERROR:", mpesaError);
  alert(mpesaError.message);
  return;
}

console.log("MPESA RESPONSE:", mpesaData);

const { error: updatePaymentError } = await supabase.rpc(
  "save_checkout_request",
  {
    p_order_id: order.id,
    p_checkout_request_id: mpesaData.CheckoutRequestID,
  }
);

if (updatePaymentError) {
  console.log("PAYMENT UPDATE ERROR:", updatePaymentError);
  alert(updatePaymentError.message);
  return;
}

alert("M-Pesa payment prompt sent. Please check your phone.");
}}
  
>
  Buy Now
</button>
      </div>
    ))}
  </div>
)}
  <p>Products from Mac-Cheru sellers will appear here.</p>
</div>

      
        <div style={{ marginTop: "40px" }}>
  <h2 style={{ fontSize: "24px", marginBottom: "15px" }}>
  My Orders
</h2>

  {buyerOrders.length === 0 ? (
    <p>No orders yet.</p>
  ) : (
    <div>
      {buyerOrders.map((order) => (
        <div
          key={order.id}
          style={{
  border: "1px solid #e2e8f0",
  borderLeft: "5px solid #d4af37",
  borderRadius: "14px",
  padding: "22px",
  marginBottom: "18px",
  background: "linear-gradient(145deg, #ffffff, #f8fafc)",
  boxShadow: "0 8px 22px rgba(15, 23, 42, 0.07)",
}}
        >
          <h3>{order.products?.name}</h3>
          <p>Price: KSh {order.products?.price}</p>
          <p>Quantity: {order.quantity}</p>
          <p>
  Status:{" "}
  <strong
  style={{
    display: "inline-block",
    padding: "5px 12px",
    borderRadius: "20px",
    fontSize: "12px",
    textTransform: "uppercase",
    letterSpacing: "0.5px",
    color:
      order.status === "accepted" || order.status === "paid"
        ? "#047857"
        : order.status === "rejected" || order.status === "cancelled"
        ? "#b91c1c"
        : "#92400e",
    backgroundColor:
      order.status === "accepted" || order.status === "paid"
        ? "#d1fae5"
        : order.status === "rejected" || order.status === "cancelled"
        ? "#fee2e2"
        : "#fef3c7",
  }}
>
  {order.status}
</strong>
</p>
{order.status === "pending" && (
  <button
    type="button"
    onClick={async () => {
      const confirmCancel = window.confirm(
        "Are you sure you want to cancel this order?"
      );

      if (!confirmCancel) return;

      const { error } = await supabase
        .from("orders")
        .update({ status: "cancelled" })
        .eq("id", order.id)
        .eq("buyer_id", order.buyer_id);

      if (error) {
        console.log("CANCEL ORDER ERROR:", error);
        alert(error.message);
        return;
      }

      alert("Order cancelled successfully.");

      setBuyerOrders((currentOrders) =>
        currentOrders.map((item) =>
          item.id === order.id
            ? { ...item, status: "cancelled" }
            : item
        )
      );
    }}
    style={{
      padding: "10px 18px",
      marginTop: "10px",
      backgroundColor: "#dc2626",
      color: "white",
      border: "none",
      borderRadius: "6px",
      fontWeight: "bold",
      cursor: "pointer",
    }}
  >
    Cancel Order
  </button>
)}
        </div>
      ))}
    </div>
  )}
</div>
<div style={{ marginTop: "40px" }}>
  <h2>Reports & Complaints</h2>

  <input
    type="text"
    placeholder="Subject"
    value={reportSubject}
    onChange={(e) => setReportSubject(e.target.value)}
    style={styles.input}
  />

  <textarea
    placeholder="Describe your issue"
    value={reportDescription}
    onChange={(e) => setReportDescription(e.target.value)}
    style={{ ...styles.input, minHeight: "120px" }}
  />

  <button
    type="button"
    onClick={submitReport}
    style={styles.submitButton}
  >
    Submit Report
  </button>
</div>

<button
  type="button"
  onClick={async () => {
  const { error } = await supabase.auth.signOut();

  if (error) {
    alert("Logout failed: " + error.message);
    return;
  }

  setLoggedIn(false);
  setUserRole(null);
}}
  style={{
    background: "linear-gradient(135deg, #0f172a, #1e293b)",
    color: "#facc15",
    border: "2px solid #d4af37",
    borderRadius: "12px",
    padding: "13px 26px",
    fontSize: "15px",
    fontWeight: "bold",
    letterSpacing: "0.5px",
    cursor: "pointer",
    boxShadow: "0 6px 16px rgba(15, 23, 42, 0.18)",
    transition: "all 0.2s ease",
  }}
>
  🚪 Logout
</button>
<HotlineWidget />
</div>
  );
}

  return (
    <div style={styles.page}>
      <nav style={styles.navbar}>
        <div style={styles.logo}>Mac-Cheru</div>

        <div style={styles.navLinks}>
          <span>Home</span>
          <span>Stores</span>
          <span>Products</span>
          <span>Orders</span>
          <button
            style={styles.loginButton}
            onClick={() => setShowLogin(true)}
          >
            Login
          </button>
        </div>
      </nav>

      <section style={styles.container}>
        <div style={styles.card}>
          <h1>{showLogin ? "Welcome Back" : "Create Account"}</h1>

          <p style={styles.subtitle}>
            {showLogin
              ? "Login to your Mac-Cheru account"
              : "Join Mac-Cheru as a buyer or seller"}
          </p>

          {!showLogin && (
            <div style={styles.field}>
              <label>Account Type</label>
              <select
  style={styles.input}
  value={accountType}
  onChange={(e) => setAccountType(e.target.value)}
>
                <option value="Buyer">Buyer</option>
<option value="Seller">Seller</option>
              </select>
            </div>
          )}

          <div style={styles.field}>
            <label>Email</label>
            <input
              type="email"
              placeholder="Enter your email"
              style={styles.input}
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
          </div>

          <div style={styles.field}>
            <label>Password</label>
            <input
              type="password"
              placeholder="Enter your password"
              style={styles.input}
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
          </div>

          {!showLogin && (
            <div style={styles.field}>
              <label>Confirm Password</label>
              <input
                type="password"
                placeholder="Confirm your password"
                style={styles.input}
                value={confirmPassword}
                onChange={(e)=> setConfirmPassword(e.target.value)}
              />
            </div>
          )}

          <button style={styles.submitButton} onClick={handleAuth}>
            {showLogin ? "Login" : "Create Account"}
          </button>

          <p style={styles.switchText}>
            {showLogin
              ? "Don't have an account?"
              : "Already have an account?"}

            <button
              onClick={() => setShowLogin(!showLogin)}
              style={styles.switchButton}
            >
              {showLogin ? "Sign Up" : "Login"}
            </button>
          </p>
        </div>
      </section>
    </div>
  );
}
function HotlineWidget() {
  const [isOpen, setIsOpen] = useState(false);

  const phone = "254740575196";

  return (
    <div
      style={{
        position: "fixed",
        right: "20px",
        bottom: "20px",
        zIndex: 9999,
        fontFamily: "Arial, sans-serif",
      }}
    >
      {isOpen && (
        <div
          style={{
            width: "290px",
            maxWidth: "calc(100vw - 40px)",
            marginBottom: "12px",
            padding: "22px",
            background: "#ffffff",
            borderRadius: "16px",
            borderTop: "5px solid #d4af37",
            boxShadow: "0 12px 35px rgba(15,23,42,0.25)",
            boxSizing: "border-box",
          }}
        >
          <h3 style={{ color: "#0f172a" }}>Mac-Cheru Hotline</h3>
          <p style={{ color: "#475569" }}>
            Need urgent help? Contact us.
          </p>

          <a
            href={`tel:${phone}`}
            style={{
              display: "block",
              padding: "12px",
              marginBottom: "10px",
              textAlign: "center",
              background: "#047857",
              color: "white",
              borderRadius: "9px",
              textDecoration: "none",
              fontWeight: "bold",
            }}
          >
            📞 Call 0740575196
          </a>

          <a
            href={`https://wa.me/${phone}?text=${encodeURIComponent(
              "Hello Mac-Cheru Support, I need help."
            )}`}
            target="_blank"
            rel="noopener noreferrer"
            style={{
              display: "block",
              padding: "12px",
              textAlign: "center",
              background: "#16a34a",
              color: "white",
              borderRadius: "9px",
              textDecoration: "none",
              fontWeight: "bold",
            }}
          >
            💬 WhatsApp Support
          </a>
        </div>
      )}

      <button
        type="button"
        onClick={() => setIsOpen(!isOpen)}
        style={{
          display: "block",
          marginLeft: "auto",
          padding: "14px 20px",
          background: "#0f172a",
          color: "#facc15",
          border: "2px solid #d4af37",
          borderRadius: "30px",
          fontWeight: "bold",
          cursor: "pointer",
        }}
      >
        {isOpen ? "✕ Close" : "🚨 Get Help"}
      </button>
    </div>
  );
}


export default App;
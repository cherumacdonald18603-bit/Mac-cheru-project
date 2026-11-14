import { supabase } from './supabaseClient'
import { useState, useEffect } from "react";
import "./Marketplace.css";

const styles = {adminPage: {
  minHeight: "100vh",
  display: "flex",
  fontFamily: "Arial, sans-serif",
  background: "#f4f6fa",
  color: "#172033",
},

sidebar: {
  width: "260px",
  minHeight: "100vh",
  flexShrink: 0,
  background: "linear-gradient(180deg, #101d35 0%, #172b4d 100%)",
  color: "#ffffff",
  padding: "28px 16px",
  boxSizing: "border-box",
  display: "flex",
  flexDirection: "column",
  boxShadow: "5px 0 20px rgba(15, 23, 42, 0.10)",
  borderRight: "3px solid #d4af37",
},

sideButton: {
  background: "transparent",
  border: "1px solid transparent",
  color: "#dbe4f0",
  textAlign: "left",
  padding: "13px 16px",
  marginBottom: "6px",
  borderRadius: "9px",
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
  gap: "20px",
  marginBottom: "30px",
},

statCard: {
  background: "#ffffff",
  padding: "24px",
  borderRadius: "14px",
  border: "1px solid #e2e8f0",
  borderTop: "4px solid #d4af37",
  boxShadow: "0 5px 18px rgba(15, 23, 42, 0.05)",
},

activityCard: {
  background: "#ffffff",
  padding: "24px",
  borderRadius: "14px",
  marginBottom: "24px",
  border: "1px solid #e2e8f0",
  boxShadow: "0 5px 18px rgba(15, 23, 42, 0.05)",
},

adminLogo: {
  fontSize: "23px",
  fontWeight: "800",
  letterSpacing: "1px",
  color: "#ffffff",
  marginBottom: "8px",
},

adminLabel: {
  color: "#d4af37",
  fontSize: "11px",
  fontWeight: "700",
  letterSpacing: "2px",
  marginBottom: "28px",
},

dashboardTitle: {
  fontSize: "30px",
  fontWeight: "800",
  color: "#101d35",
  margin: "0 0 8px",
},

dashboardSubtitle: {
  color: "#64748b",
  fontSize: "15px",
  marginBottom: "28px",
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
    <div className="mc-admin-page" style={styles.adminPage}>
      <aside className="mc-admin-sidebar" style={styles.sidebar}>
  <div style={styles.adminLogo}>MAC-CHERU</div>
  <p style={styles.adminLabel}>ADMIN PANEL</p>

  {[
    { id: "dashboard", label: "📊 Dashboard" },
    { id: "users", label: "👥 Users" },
    { id: "products", label: "📦 Products" },
    { id: "buyers", label: "🛍️ Buyers" },
    { id: "sellers", label: "🏪 Sellers" },
    { id: "orders", label: "🧾 Orders" },
    { id: "payments", label: "💳 Payments" },
    { id: "wallet", label: "💰 Admin Wallet" },
    { id: "withdrawals", label: "💸 Withdrawals" },
    { id: "reports", label: "📢 Reports & Complaints" },
    { id: "analytics", label: "📊 Analytics" },
    { id: "settings", label: "⚙️ Settings" },
  ].map((item) => (
    <button
      key={item.id}
      className={`mc-admin-nav-button ${
        adminSection === item.id ? "active" : ""
      }`}
      style={styles.sideButton}
      onClick={() => setAdminSection(item.id)}
    >
      {item.label}
    </button>
  ))}

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

      <main className="mc-admin-main" style={styles.adminMain}>

{adminSection === "dashboard" && (
  <>
    {(() => {
      const adminProfile = users.find((user) => user.role === "admin");

      const paidPayments = adminPayments.filter(
        (payment) => payment.status === "paid"
      );

      const totalRevenue = paidPayments.reduce(
        (sum, payment) => sum + Number(payment.amount || 0),
        0
      );

      const totalCommission = paidPayments.reduce(
        (sum, payment) => sum + Number(payment.commission || 0),
        0
      );

      const orderStatuses = ["pending", "accepted", "rejected", "paid"].map(
        (status) => ({
          label: status,
          value: adminOrders.filter((order) => order.status === status).length,
        })
      );

      const paymentStatuses = [
        {
          label: "Paid",
          value: adminPayments.filter((p) => p.status === "paid").length,
        },
        {
          label: "Pending",
          value: adminPayments.filter((p) => p.status === "pending").length,
        },
        {
          label: "Failed",
          value: adminPayments.filter(
            (p) => p.status === "failed" || p.status === "payment_failed"
          ).length,
        },
      ];

      const maxOrders = Math.max(1, ...orderStatuses.map((s) => s.value));
      const maxPayments = Math.max(1, ...paymentStatuses.map((s) => s.value));

      const statusColor = (status) => {
        const value = String(status || "").toLowerCase();

        if (["paid", "accepted", "approved", "resolved"].includes(value))
          return "#16a34a";

        if (["pending", "under review"].includes(value))
          return "#d4a017";

        if (["rejected", "failed", "payment_failed", "suspended"].includes(value))
          return "#dc4444";

        return "#64748b";
      };

      const cardStyle = {
        background: "#142139",
        border: "1px solid #293b57",
        borderRadius: "15px",
        padding: "22px",
        boxShadow: "0 8px 24px rgba(0,0,0,0.18)",
      };

      const headingStyle = {
        color: "#f1c957",
        fontSize: "13px",
        fontWeight: "700",
        textTransform: "uppercase",
        letterSpacing: "1px",
        marginBottom: "12px",
      };

      return (
        <>
          {/* DASHBOARD HEADER */}
          <div style={{
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
            flexWrap: "wrap",
            gap: "18px",
            marginBottom: "28px"
          }}>
            <div>
              <h1 style={{
                color: "#f8fafc",
                fontSize: "30px",
                fontWeight: "800",
                margin: "0 0 8px"
              }}>
                Admin Dashboard
              </h1>

              <p style={{ color: "#94a3b8", margin: 0 }}>
                Your Mac-Cheru marketplace overview.
              </p>
            </div>

            {/* ADMIN PROFILE */}
            <div style={{
              ...cardStyle,
              display: "flex",
              alignItems: "center",
              gap: "14px",
              padding: "14px 20px",
              minWidth: "220px"
            }}>
              <div style={{
                width: "45px",
                height: "45px",
                borderRadius: "50%",
                background: "linear-gradient(135deg,#d4af37,#f5d77b)",
                color: "#101d35",
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontSize: "20px",
                fontWeight: "800"
              }}>
                A
              </div>

              <div>
                <div style={{ color: "#f8fafc", fontWeight: "700" }}>
                  {adminProfile?.full_name || "Administrator"}
                </div>
                <div style={{
                  color: "#94a3b8",
                  fontSize: "12px",
                  marginTop: "4px"
                }}>
                  {adminProfile?.email || email || "Admin account"}
                </div>
                <div style={{
                  color: "#22c55e",
                  fontSize: "11px",
                  fontWeight: "700",
                  marginTop: "4px"
                }}>
                  ● ADMINISTRATOR
                </div>
              </div>
            </div>
          </div>

          {/* KPI CARDS */}
          <div style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fit,minmax(175px,1fr))",
            gap: "16px",
            marginBottom: "25px"
          }}>
            {[
              {
                title: "Total Users",
                value: users.length,
                icon: "👥",
                color: "#60a5fa"
              },
              {
                title: "Total Sellers",
                value: users.filter((u) => u.role === "seller").length,
                icon: "🏪",
                color: "#c084fc"
              },
              {
                title: "Total Buyers",
                value: users.filter((u) => u.role === "buyer").length,
                icon: "🛍️",
                color: "#34d399"
              },
              {
                title: "Products",
                value: totalProducts,
                icon: "📦",
                color: "#fbbf24"
              },
              {
                title: "Total Orders",
                value: adminOrders.length,
                icon: "🧾",
                color: "#38bdf8"
              },
              {
                title: "Paid Payments",
                value: paidPayments.length,
                icon: "💳",
                color: "#4ade80"
              }
            ].map((item) => (
              <div key={item.title} style={{
                ...cardStyle,
                borderTop: `3px solid ${item.color}`
              }}>
                <div style={{
                  display: "flex",
                  justifyContent: "space-between",
                  alignItems: "center"
                }}>
                  <span style={{ color: "#a8b5c8", fontSize: "13px" }}>
                    {item.title}
                  </span>
                  <span style={{ fontSize: "22px" }}>{item.icon}</span>
                </div>

                <div style={{
                  color: "#f8fafc",
                  fontSize: "29px",
                  fontWeight: "800",
                  marginTop: "15px"
                }}>
                  {item.value.toLocaleString()}
                </div>
              </div>
            ))}
          </div>

          {/* FINANCIAL SUMMARY */}
          <div style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fit,minmax(220px,1fr))",
            gap: "16px",
            marginBottom: "25px"
          }}>
            <div style={cardStyle}>
              <div style={headingStyle}>Total Paid Sales</div>
              <div style={{
                color: "#f8fafc",
                fontSize: "25px",
                fontWeight: "800"
              }}>
                KSh {totalRevenue.toLocaleString()}
              </div>
              <p style={{ color: "#94a3b8", fontSize: "12px" }}>
                From successfully paid transactions
              </p>
            </div>

            <div style={cardStyle}>
              <div style={headingStyle}>Platform Commission</div>
              <div style={{
                color: "#d4af37",
                fontSize: "25px",
                fontWeight: "800"
              }}>
                KSh {totalCommission.toLocaleString()}
              </div>
              <p style={{ color: "#94a3b8", fontSize: "12px" }}>
                Commission earned from paid transactions
              </p>
            </div>

            <div style={cardStyle}>
              <div style={headingStyle}>Commission Rate</div>
              <div style={{
                color: "#f8fafc",
                fontSize: "25px",
                fontWeight: "800"
              }}>
                {commissionRate}%
              </div>
              <p style={{ color: "#94a3b8", fontSize: "12px" }}>
                Current marketplace commission setting
              </p>
            </div>
          </div>

          {/* ANALYTICS CHARTS */}
          <div style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fit,minmax(280px,1fr))",
            gap: "20px",
            marginBottom: "25px"
          }}>
            <div style={cardStyle}>
              <h2 style={{ color: "#f8fafc", fontSize: "18px" }}>
                Order Analytics
              </h2>
              <p style={{ color: "#94a3b8", fontSize: "12px" }}>
                Orders grouped by current status
              </p>

              {orderStatuses.map((item) => (
                <div key={item.label} style={{ marginTop: "20px" }}>
                  <div style={{
                    display: "flex",
                    justifyContent: "space-between",
                    color: "#cbd5e1",
                    fontSize: "13px",
                    marginBottom: "7px"
                  }}>
                    <span style={{ textTransform: "capitalize" }}>
                      {item.label}
                    </span>
                    <strong>{item.value}</strong>
                  </div>

                  <div style={{
                    height: "9px",
                    background: "#263750",
                    borderRadius: "10px",
                    overflow: "hidden"
                  }}>
                    <div style={{
                      height: "100%",
                      width: `${(item.value / maxOrders) * 100}%`,
                      background: statusColor(item.label),
                      borderRadius: "10px",
                      transition: "width 0.3s ease"
                    }} />
                  </div>
                </div>
              ))}
            </div>

            <div style={cardStyle}>
              <h2 style={{ color: "#f8fafc", fontSize: "18px" }}>
                Payment Analytics
              </h2>
              <p style={{ color: "#94a3b8", fontSize: "12px" }}>
                Payment transaction breakdown
              </p>

              {paymentStatuses.map((item) => (
                <div key={item.label} style={{ marginTop: "20px" }}>
                  <div style={{
                    display: "flex",
                    justifyContent: "space-between",
                    color: "#cbd5e1",
                    fontSize: "13px",
                    marginBottom: "7px"
                  }}>
                    <span>{item.label}</span>
                    <strong>{item.value}</strong>
                  </div>

                  <div style={{
                    height: "9px",
                    background: "#263750",
                    borderRadius: "10px",
                    overflow: "hidden"
                  }}>
                    <div style={{
                      height: "100%",
                      width: `${(item.value / maxPayments) * 100}%`,
                      background: statusColor(item.label.toLowerCase()),
                      borderRadius: "10px"
                    }} />
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* RECENT ORDERS */}
          <div style={{ ...cardStyle, marginBottom: "25px" }}>
            <h2 style={{ color: "#f8fafc", fontSize: "19px" }}>
              Recent Orders
            </h2>

            {adminOrders.length === 0 ? (
              <p style={{ color: "#94a3b8" }}>No recent orders.</p>
            ) : (
              <div style={{ overflowX: "auto" }}>
                <table>
                  <thead>
                    <tr>
                      <th>Product</th>
                      <th>Order Status</th>
                      <th>Date</th>
                    </tr>
                  </thead>
                  <tbody>
                    {adminOrders.slice(0, 5).map((order) => (
                      <tr key={order.id}>
                        <td>{order.products?.name || "Unknown product"}</td>
                        <td>
                          <span style={{
                            background: `${statusColor(order.status)}22`,
                            color: statusColor(order.status),
                            padding: "5px 11px",
                            borderRadius: "20px",
                            fontSize: "12px",
                            fontWeight: "700"
                          }}>
                            {order.status}
                          </span>
                        </td>
                        <td>
                          {new Date(order.created_at).toLocaleDateString()}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </div>

          {/* RECENT PRODUCTS */}
          <div style={cardStyle}>
            <h2 style={{ color: "#f8fafc", fontSize: "19px" }}>
              Recent Products
            </h2>

            {adminProducts.length === 0 ? (
              <p style={{ color: "#94a3b8" }}>No recent products.</p>
            ) : (
              <div style={{
                display: "grid",
                gridTemplateColumns: "repeat(auto-fit,minmax(200px,1fr))",
                gap: "14px"
              }}>
                {adminProducts.map((product) => (
                  <div key={product.id} style={{
                    background: "#0d192c",
                    border: "1px solid #293b57",
                    borderRadius: "11px",
                    padding: "16px"
                  }}>
                    <div style={{
                      color: "#f8fafc",
                      fontWeight: "700"
                    }}>
                      {product.name}
                    </div>
                    <div style={{
                      color: "#d4af37",
                      fontWeight: "800",
                      marginTop: "9px"
                    }}>
                      KSh {Number(product.price).toLocaleString()}
                    </div>
                    <div style={{
                      color: "#94a3b8",
                      fontSize: "11px",
                      marginTop: "8px"
                    }}>
                      {new Date(product.created_at).toLocaleDateString()}
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </>
      );
    })()}
  </>
)}



{adminSection === "withdrawals" && (
  <>
    {(() => {
      const pending = adminWithdrawals.filter(
        (w) => w.status === "pending"
      );

      const approved = adminWithdrawals.filter(
        (w) => w.status === "approved"
      );

      const rejected = adminWithdrawals.filter(
        (w) => w.status === "rejected"
      );

      const totalPending = pending.reduce(
        (sum, w) => sum + Number(w.amount || 0), 0
      );

      const totalApproved = approved.reduce(
        (sum, w) => sum + Number(w.amount || 0), 0
      );

      const formatMoney = (amount) =>
        `KSh ${Number(amount || 0).toLocaleString("en-KE")}`;

      const statusStyle = (status) => {
        const colors = {
          pending: ["#fcd34d", "rgba(217,119,6,0.15)"],
          approved: ["#86efac", "rgba(22,163,74,0.15)"],
          rejected: ["#fca5a5", "rgba(220,38,38,0.15)"],
        };

        const color = colors[String(status || "").toLowerCase()] ||
          ["#cbd5e1", "rgba(100,116,139,0.15)"];

        return {
          display: "inline-flex",
          padding: "6px 12px",
          borderRadius: "20px",
          color: color[0],
          background: color[1],
          border: `1px solid ${color[0]}55`,
          fontSize: "12px",
          fontWeight: "800",
          textTransform: "capitalize",
        };
      };

      return (
        <>
          <h1 style={styles.dashboardTitle}>Withdrawal Management</h1>

          <p style={styles.dashboardSubtitle}>
            Review seller withdrawal requests and manage payout approvals.
          </p>

          {/* WITHDRAWAL SUMMARY */}
          <div style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fit,minmax(175px,1fr))",
            gap: "16px",
            margin: "25px 0"
          }}>
            {[
              {
                label: "Total Requests",
                value: adminWithdrawals.length,
                color: "#60a5fa",
                money: false
              },
              {
                label: "Pending Requests",
                value: pending.length,
                color: "#fbbf24",
                money: false
              },
              {
                label: "Approved Requests",
                value: approved.length,
                color: "#4ade80",
                money: false
              },
              {
                label: "Rejected Requests",
                value: rejected.length,
                color: "#f87171",
                money: false
              },
              {
                label: "Pending Amount",
                value: totalPending,
                color: "#fbbf24",
                money: true
              },
              {
                label: "Approved Amount",
                value: totalApproved,
                color: "#4ade80",
                money: true
              }
            ].map((item) => (
              <div key={item.label} style={{
                ...styles.activityCard,
                borderTop: `3px solid ${item.color}`
              }}>
                <p style={{ color: "#94a3b8", fontSize: "13px" }}>
                  {item.label}
                </p>

                <h2 style={{
                  color: item.color,
                  fontSize: item.money ? "21px" : "28px",
                  overflowWrap: "anywhere"
                }}>
                  {item.money
                    ? formatMoney(item.value)
                    : item.value.toLocaleString()}
                </h2>
              </div>
            ))}
          </div>

          {/* WITHDRAWAL REQUESTS */}
          <div style={styles.activityCard}>
            <h2 style={{ color: "#f1c957", marginBottom: "20px" }}>
              Seller Withdrawal Requests
            </h2>

            {adminWithdrawals.length === 0 ? (
              <p>No withdrawal requests found.</p>
            ) : (
              <div style={{
                display: "grid",
                gridTemplateColumns: "repeat(auto-fit,minmax(270px,1fr))",
                gap: "18px"
              }}>
                {adminWithdrawals.map((withdrawal) => (
                  <div key={withdrawal.id} style={{
                    background: "#0d192c",
                    border: "1px solid #34445e",
                    borderRadius: "13px",
                    padding: "20px",
                    minWidth: 0
                  }}>
                    <div style={{
                      display: "flex",
                      justifyContent: "space-between",
                      alignItems: "center",
                      gap: "10px",
                      flexWrap: "wrap",
                      marginBottom: "18px"
                    }}>
                      <span style={{
                        color: "#94a3b8",
                        fontSize: "12px",
                        fontWeight: "700"
                      }}>
                        WITHDRAWAL REQUEST
                      </span>

                      <span style={statusStyle(withdrawal.status)}>
                        ● {withdrawal.status || "Unknown"}
                      </span>
                    </div>

                    <h2 style={{
                      color: "#f1c957",
                      fontSize: "27px",
                      margin: "0 0 20px"
                    }}>
                      {formatMoney(withdrawal.amount)}
                    </h2>

                    <div style={{
                      display: "grid",
                      gap: "12px",
                      color: "#cbd5e1",
                      fontSize: "13px"
                    }}>
                      <div>
                        <strong style={{ color: "#94a3b8" }}>
                          M-Pesa Number
                        </strong>
                        <div>{withdrawal.phone || "Not provided"}</div>
                      </div>

                      <div>
                        <strong style={{ color: "#94a3b8" }}>
                          Seller ID
                        </strong>
                        <div style={{ overflowWrap: "anywhere" }}>
                          {withdrawal.seller_id || "Not available"}
                        </div>
                      </div>

                      <div>
                        <strong style={{ color: "#94a3b8" }}>
                          Request Date
                        </strong>
                        <div>
                          {withdrawal.created_at
                            ? new Date(withdrawal.created_at).toLocaleString()
                            : "—"}
                        </div>
                      </div>
                    </div>

                    {withdrawal.status === "pending" && (
                      <div style={{
                        display: "flex",
                        gap: "10px",
                        marginTop: "20px",
                        flexWrap: "wrap"
                      }}>
                        <button
                          onClick={() =>
                            updateWithdrawalStatus(withdrawal.id, "approved")
                          }
                          style={{
                            ...styles.manageButton,
                            background: "#166534",
                            color: "#ffffff",
                            border: "none",
                            borderRadius: "8px",
                            padding: "10px 16px",
                            fontWeight: "700"
                          }}
                        >
                          ✓ Approve
                        </button>

                        <button
                          onClick={() =>
                            updateWithdrawalStatus(withdrawal.id, "rejected")
                          }
                          style={{
                            ...styles.manageButton,
                            background: "#991b1b",
                            color: "#ffffff",
                            border: "none",
                            borderRadius: "8px",
                            padding: "10px 16px",
                            fontWeight: "700"
                          }}
                        >
                          ✕ Reject
                        </button>
                      </div>
                    )}

                    {withdrawal.status !== "pending" && (
                      <p style={{
                        color: "#94a3b8",
                        fontSize: "12px",
                        marginTop: "18px"
                      }}>
                        This request has already been reviewed.
                      </p>
                    )}
                  </div>
                ))}
              </div>
            )}
          </div>
        </>
      );
    })()}
  </>
)}

{adminSection === "reports" && (
  <>
    {(() => {
      const reviewed = adminReports.filter(
        (r) => r.status === "reviewed"
      ).length;

      const resolved = adminReports.filter(
        (r) => r.status === "resolved"
      ).length;

      const open = adminReports.filter(
        (r) => !["reviewed", "resolved"].includes(
          String(r.status || "").toLowerCase()
        )
      ).length;

      const statusStyle = (status) => {
        const value = String(status || "").toLowerCase();

        const colors = {
          pending: ["#fcd34d", "rgba(217,119,6,0.15)"],
          open: ["#fcd34d", "rgba(217,119,6,0.15)"],
          reviewed: ["#93c5fd", "rgba(37,99,235,0.15)"],
          resolved: ["#86efac", "rgba(22,163,74,0.15)"],
        };

        const color = colors[value] ||
          ["#cbd5e1", "rgba(100,116,139,0.15)"];

        return {
          display: "inline-flex",
          padding: "6px 12px",
          borderRadius: "20px",
          color: color[0],
          background: color[1],
          border: `1px solid ${color[0]}55`,
          fontSize: "12px",
          fontWeight: "800",
          textTransform: "capitalize",
        };
      };

      return (
        <>
          <h1 style={styles.dashboardTitle}>Reports & Complaints</h1>

          <p style={styles.dashboardSubtitle}>
            Review, investigate and resolve reports submitted by Mac-Cheru users.
          </p>

          {/* REPORT SUMMARY */}
          <div style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fit,minmax(175px,1fr))",
            gap: "16px",
            margin: "25px 0"
          }}>
            {[
              {
                label: "Total Reports",
                value: adminReports.length,
                color: "#60a5fa"
              },
              {
                label: "Awaiting Review",
                value: open,
                color: "#fbbf24"
              },
              {
                label: "Reviewed",
                value: reviewed,
                color: "#38bdf8"
              },
              {
                label: "Resolved",
                value: resolved,
                color: "#4ade80"
              }
            ].map((item) => (
              <div key={item.label} style={{
                ...styles.activityCard,
                borderTop: `3px solid ${item.color}`
              }}>
                <p style={{ color: "#94a3b8", fontSize: "13px" }}>
                  {item.label}
                </p>

                <h2 style={{
                  color: item.color,
                  fontSize: "28px"
                }}>
                  {item.value}
                </h2>
              </div>
            ))}
          </div>

          {/* REPORT RECORDS */}
          <div style={styles.activityCard}>
            <h2 style={{ color: "#f1c957", marginBottom: "20px" }}>
              Submitted Reports & Complaints
            </h2>

            {adminReports.length === 0 ? (
              <div style={{
                textAlign: "center",
                padding: "35px 15px",
                background: "#0d192c",
                borderRadius: "12px"
              }}>
                <div style={{ fontSize: "35px" }}>📢</div>
                <h3 style={{ color: "#f8fafc" }}>No Reports Yet</h3>
                <p style={{ color: "#94a3b8" }}>
                  No reports or complaints have been submitted.
                </p>
              </div>
            ) : (
              <div style={{
                display: "grid",
                gridTemplateColumns: "repeat(auto-fit,minmax(280px,1fr))",
                gap: "18px"
              }}>
                {adminReports.map((report) => (
                  <div key={report.id} style={{
                    background: "#0d192c",
                    border: "1px solid #34445e",
                    borderRadius: "13px",
                    padding: "20px",
                    minWidth: 0
                  }}>
                    <div style={{
                      display: "flex",
                      justifyContent: "space-between",
                      alignItems: "center",
                      gap: "10px",
                      flexWrap: "wrap",
                      marginBottom: "15px"
                    }}>
                      <span style={{
                        color: "#d4af37",
                        fontSize: "12px",
                        fontWeight: "800",
                        textTransform: "uppercase"
                      }}>
                        {report.type || "General report"}
                      </span>

                      <span style={statusStyle(report.status)}>
                        ● {report.status || "Open"}
                      </span>
                    </div>

                    <h3 style={{
                      color: "#f8fafc",
                      fontSize: "18px",
                      margin: "0 0 15px",
                      overflowWrap: "anywhere"
                    }}>
                      {report.subject || "Untitled report"}
                    </h3>

                    <div style={{
                      display: "grid",
                      gap: "12px",
                      fontSize: "13px",
                      color: "#cbd5e1"
                    }}>
                      <div>
                        <strong style={{ color: "#94a3b8" }}>
                          Submitted By
                        </strong>
                        <p style={{ margin: "5px 0" }}>
                          {report.user_role || "Unknown user"}
                        </p>
                      </div>

                      <div>
                        <strong style={{ color: "#94a3b8" }}>
                          Description
                        </strong>
                        <p style={{
                          margin: "5px 0",
                          lineHeight: "1.7",
                          whiteSpace: "pre-wrap",
                          overflowWrap: "anywhere"
                        }}>
                          {report.description || "No description provided."}
                        </p>
                      </div>

                      <div>
                        <strong style={{ color: "#94a3b8" }}>
                          Submission Date
                        </strong>
                        <p style={{ margin: "5px 0" }}>
                          {report.created_at
                            ? new Date(report.created_at).toLocaleString()
                            : "—"}
                        </p>
                      </div>
                    </div>

                    <div style={{
                      display: "flex",
                      gap: "10px",
                      flexWrap: "wrap",
                      marginTop: "20px",
                      paddingTop: "15px",
                      borderTop: "1px solid #293b57"
                    }}>
                      {report.status !== "reviewed" &&
                       report.status !== "resolved" && (
                        <button
                          type="button"
                          onClick={() =>
                            updateReportStatus(report.id, "reviewed")
                          }
                          style={{
                            padding: "10px 14px",
                            background: "#1d4ed8",
                            color: "white",
                            border: "none",
                            borderRadius: "8px",
                            cursor: "pointer",
                            fontWeight: "700"
                          }}
                        >
                          Mark Reviewed
                        </button>
                      )}

                      {report.status !== "resolved" && (
                        <button
                          type="button"
                          onClick={() =>
                            updateReportStatus(report.id, "resolved")
                          }
                          style={{
                            padding: "10px 14px",
                            background: "#166534",
                            color: "white",
                            border: "none",
                            borderRadius: "8px",
                            cursor: "pointer",
                            fontWeight: "700"
                          }}
                        >
                          ✓ Mark Resolved
                        </button>
                      )}

                      {report.status === "resolved" && (
                        <span style={{
                          color: "#86efac",
                          fontSize: "13px",
                          fontWeight: "700"
                        }}>
                          ✓ Complaint resolved
                        </span>
                      )}
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </>
      );
    })()}
  </>
)}
{adminSection === "analytics" && (
  <>
    {(() => {
      const paidPayments = adminPayments.filter(
        (payment) => payment.status === "paid"
      );

      const totalSales = paidPayments.reduce(
        (total, payment) => total + Number(payment.amount || 0),
        0
      );

      const totalCommission = paidPayments.reduce(
        (total, payment) => total + Number(payment.commission || 0),
        0
      );

      const sellerEarnings = paidPayments.reduce(
        (total, payment) => total + Number(payment.seller_amount || 0),
        0
      );

      const paymentStats = [
        {
          label: "Successful",
          count: paidPayments.length,
          color: "#22c55e",
        },
        {
          label: "Pending",
          count: adminPayments.filter(
            (payment) => payment.status === "pending"
          ).length,
          color: "#eab308",
        },
        {
          label: "Failed",
          count: adminPayments.filter(
            (payment) =>
              payment.status === "payment_failed" ||
              payment.status === "failed"
          ).length,
          color: "#ef4444",
        },
      ];

      const orderStats = [
        {
          label: "Pending",
          count: adminOrders.filter(
            (order) => order.status === "pending"
          ).length,
          color: "#eab308",
        },
        {
          label: "Accepted",
          count: adminOrders.filter(
            (order) => order.status === "accepted"
          ).length,
          color: "#3b82f6",
        },
        {
          label: "Paid",
          count: adminOrders.filter(
            (order) => order.status === "paid"
          ).length,
          color: "#22c55e",
        },
        {
          label: "Rejected",
          count: adminOrders.filter(
            (order) => order.status === "rejected"
          ).length,
          color: "#ef4444",
        },
      ];

      const formatMoney = (amount) =>
        `KSh ${Number(amount || 0).toLocaleString("en-KE")}`;

      const metricCard = {
        background: "linear-gradient(145deg, #172943, #101d32)",
        border: "1px solid rgba(212,175,55,0.22)",
        borderRadius: "16px",
        padding: "22px",
        boxShadow: "0 8px 24px rgba(0,0,0,0.18)",
        minWidth: 0,
      };

      const sectionCard = {
        background: "#111f35",
        border: "1px solid #293b56",
        borderRadius: "16px",
        padding: "24px",
        minWidth: 0,
      };

      return (
        <div>
          <div style={{ marginBottom: "30px" }}>
            <h1 style={styles.dashboardTitle}>Marketplace Analytics</h1>
            <p style={styles.dashboardSubtitle}>
              Monitor marketplace growth, transactions and financial
              performance.
            </p>
          </div>

          <div
            style={{
              display: "grid",
              gridTemplateColumns: "repeat(auto-fit, minmax(180px, 1fr))",
              gap: "18px",
              marginBottom: "25px",
            }}
          >
            {[
              {
                label: "Total Users",
                value: users.length,
                icon: "👥",
              },
              {
                label: "Registered Sellers",
                value: users.filter((user) => user.role === "seller").length,
                icon: "🏪",
              },
              {
                label: "Registered Buyers",
                value: users.filter((user) => user.role === "buyer").length,
                icon: "🛍️",
              },
              {
                label: "Total Products",
                value: totalProducts,
                icon: "📦",
              },
              {
                label: "Total Orders",
                value: adminOrders.length,
                icon: "🧾",
              },
            ].map((item) => (
              <div key={item.label} style={metricCard}>
                <div style={{ fontSize: "25px", marginBottom: "12px" }}>
                  {item.icon}
                </div>
                <p
                  style={{
                    color: "#9eafc5",
                    fontSize: "13px",
                    margin: "0 0 8px",
                  }}
                >
                  {item.label}
                </p>
                <h2
                  style={{
                    color: "#f1f5f9",
                    fontSize: "27px",
                    margin: 0,
                  }}
                >
                  {Number(item.value || 0).toLocaleString()}
                </h2>
              </div>
            ))}
          </div>

          <h2
            style={{
              color: "#e6c45b",
              fontSize: "18px",
              margin: "30px 0 16px",
            }}
          >
            Financial Performance
          </h2>

          <div
            style={{
              display: "grid",
              gridTemplateColumns: "repeat(auto-fit, minmax(200px, 1fr))",
              gap: "18px",
              marginBottom: "28px",
            }}
          >
            <div style={metricCard}>
              <p style={{ color: "#9eafc5", margin: "0 0 10px" }}>
                Total Sales
              </p>
              <h2 style={{ color: "#22c55e", fontSize: "25px", margin: 0 }}>
                {formatMoney(totalSales)}
              </h2>
            </div>

            <div style={metricCard}>
              <p style={{ color: "#9eafc5", margin: "0 0 10px" }}>
                Platform Commission
              </p>
              <h2 style={{ color: "#e6c45b", fontSize: "25px", margin: 0 }}>
                {formatMoney(totalCommission)}
              </h2>
            </div>

            <div style={metricCard}>
              <p style={{ color: "#9eafc5", margin: "0 0 10px" }}>
                Seller Earnings
              </p>
              <h2 style={{ color: "#60a5fa", fontSize: "25px", margin: 0 }}>
                {formatMoney(sellerEarnings)}
              </h2>
            </div>

            <div style={metricCard}>
              <p style={{ color: "#9eafc5", margin: "0 0 10px" }}>
                Current Commission Rate
              </p>
              <h2 style={{ color: "#f1f5f9", fontSize: "25px", margin: 0 }}>
                {commissionRate}%
              </h2>
            </div>
          </div>

          <div
            style={{
              display: "grid",
              gridTemplateColumns: "repeat(auto-fit, minmax(280px, 1fr))",
              gap: "20px",
              marginBottom: "25px",
            }}
          >
            <div style={sectionCard}>
              <h2 style={{ color: "#e6c45b", fontSize: "18px" }}>
                Payment Activity
              </h2>

              <p style={{ color: "#9eafc5", fontSize: "13px" }}>
                Breakdown of recorded payment transactions.
              </p>

              {paymentStats.map((item) => {
                const percentage =
                  adminPayments.length > 0
                    ? (item.count / adminPayments.length) * 100
                    : 0;

                return (
                  <div key={item.label} style={{ marginTop: "22px" }}>
                    <div
                      style={{
                        display: "flex",
                        justifyContent: "space-between",
                        marginBottom: "9px",
                      }}
                    >
                      <span style={{ color: "#d5deeb" }}>
                        {item.label}
                      </span>
                      <strong style={{ color: "#f1f5f9" }}>
                        {item.count}
                      </strong>
                    </div>

                    <div
                      style={{
                        height: "9px",
                        background: "#263750",
                        borderRadius: "20px",
                        overflow: "hidden",
                      }}
                    >
                      <div
                        style={{
                          width: `${percentage}%`,
                          height: "100%",
                          background: item.color,
                          borderRadius: "20px",
                        }}
                      />
                    </div>
                  </div>
                );
              })}

              <p
                style={{
                  color: "#9eafc5",
                  marginTop: "25px",
                  fontSize: "13px",
                }}
              >
                Total transactions: {adminPayments.length}
              </p>
            </div>

            <div style={sectionCard}>
              <h2 style={{ color: "#e6c45b", fontSize: "18px" }}>
                Order Activity
              </h2>

              <p style={{ color: "#9eafc5", fontSize: "13px" }}>
                Current distribution of marketplace orders.
              </p>

              {orderStats.map((item) => {
                const percentage =
                  adminOrders.length > 0
                    ? (item.count / adminOrders.length) * 100
                    : 0;

                return (
                  <div key={item.label} style={{ marginTop: "18px" }}>
                    <div
                      style={{
                        display: "flex",
                        justifyContent: "space-between",
                        marginBottom: "9px",
                      }}
                    >
                      <span style={{ color: "#d5deeb" }}>
                        {item.label}
                      </span>
                      <strong style={{ color: "#f1f5f9" }}>
                        {item.count}
                      </strong>
                    </div>

                    <div
                      style={{
                        height: "9px",
                        background: "#263750",
                        borderRadius: "20px",
                        overflow: "hidden",
                      }}
                    >
                      <div
                        style={{
                          width: `${percentage}%`,
                          height: "100%",
                          background: item.color,
                          borderRadius: "20px",
                        }}
                      />
                    </div>
                  </div>
                );
              })}

              <p
                style={{
                  color: "#9eafc5",
                  marginTop: "25px",
                  fontSize: "13px",
                }}
              >
                Total orders: {adminOrders.length}
              </p>
            </div>
          </div>

          <div style={sectionCard}>
            <h2 style={{ color: "#e6c45b", fontSize: "18px" }}>
              Analytics Overview
            </h2>

            <p style={{ color: "#9eafc5", lineHeight: 1.7 }}>
              This dashboard provides an overview of registered marketplace
              users, sellers, buyers, listed products, orders and recorded
              payments. Financial totals are calculated from successful
              payments only.
            </p>
          </div>
        </div>
      );
    })()}
  </>
)}
{adminSection === "settings" && (
  <>
    <div style={{ marginBottom: "30px" }}>
      <h1 style={styles.dashboardTitle}>Administration Settings</h1>
      <p style={styles.dashboardSubtitle}>
        Configure commission rates and manage marketplace availability.
      </p>
    </div>

    <div
      style={{
        display: "grid",
        gridTemplateColumns: "repeat(auto-fit, minmax(280px, 1fr))",
        gap: "22px",
        alignItems: "stretch",
      }}
    >
      {/* COMMISSION SETTINGS */}
      <div
        style={{
          ...styles.activityCard,
          padding: "26px",
          border: "1px solid rgba(212,175,55,0.3)",
          borderRadius: "16px",
        }}
      >
        <div style={{ fontSize: "30px", marginBottom: "12px" }}>💰</div>

        <h2 style={{ color: "#e6c45b", marginBottom: "8px" }}>
          Commission Settings
        </h2>

        <p style={{ color: "#9eafc5", lineHeight: 1.6 }}>
          Set the percentage of each successful transaction retained by
          the Mac-Cheru platform.
        </p>

        <div
          style={{
            background: "#0d192c",
            border: "1px solid #34445e",
            borderRadius: "12px",
            padding: "18px",
            margin: "20px 0",
          }}
        >
          <p style={{ color: "#9eafc5", margin: "0 0 8px", fontSize: "13px" }}>
            Current commission rate
          </p>

          <h2 style={{ color: "#e6c45b", fontSize: "32px", margin: 0 }}>
            {commissionRate}%
          </h2>
        </div>

        <label
          style={{
            display: "block",
            color: "#d5deeb",
            marginBottom: "9px",
            fontWeight: 600,
          }}
        >
          New commission rate (%)
        </label>

        <input
          type="number"
          min="0"
          max="100"
          step="0.1"
          value={commissionRate}
          onChange={(e) => setCommissionRate(e.target.value)}
          placeholder="Enter rate between 0 and 100"
          style={{
            ...styles.input,
            width: "100%",
            boxSizing: "border-box",
            marginBottom: "18px",
          }}
        />

        <button
          style={{
            ...styles.primaryButton,
            width: "100%",
            padding: "14px",
          }}
          onClick={async () => {
            const rate = Number(commissionRate);

            if (
              commissionRate === "" ||
              !Number.isFinite(rate) ||
              rate < 0 ||
              rate > 100
            ) {
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
          💾 Save Commission Rate
        </button>
      </div>

      {/* MARKETPLACE SETTINGS */}
      <div
        style={{
          ...styles.activityCard,
          padding: "26px",
          border: "1px solid rgba(212,175,55,0.3)",
          borderRadius: "16px",
        }}
      >
        <div style={{ fontSize: "30px", marginBottom: "12px" }}>🏪</div>

        <h2 style={{ color: "#e6c45b", marginBottom: "8px" }}>
          Marketplace Availability
        </h2>

        <p style={{ color: "#9eafc5", lineHeight: 1.6 }}>
          Control whether buyers can place new orders on the Mac-Cheru
          marketplace.
        </p>

        <div
          style={{
            background: "#0d192c",
            border: "1px solid #34445e",
            borderRadius: "12px",
            padding: "18px",
            margin: "20px 0",
          }}
        >
          <p style={{ color: "#9eafc5", margin: "0 0 8px", fontSize: "13px" }}>
            Marketplace control
          </p>

          <h3 style={{ color: "#f1f5f9", margin: 0 }}>
            Open / Paused
          </h3>
        </div>

        <p style={{ color: "#d5deeb", fontSize: "14px", lineHeight: 1.6 }}>
          Use the control below to switch the marketplace between open
          and paused. The updated setting is saved to your database.
        </p>

        <button
          style={{
            ...styles.primaryButton,
            width: "100%",
            padding: "14px",
            marginTop: "12px",
          }}
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
          ⚙️ Toggle Marketplace Open / Paused
        </button>
      </div>
    </div>

    <div
      style={{
        ...styles.activityCard,
        marginTop: "24px",
        padding: "20px",
        borderLeft: "4px solid #d4af37",
      }}
    >
      <h3 style={{ color: "#e6c45b", marginTop: 0 }}>
        Administrator Notice
      </h3>
      <p style={{ color: "#a8b5c8", lineHeight: 1.7, marginBottom: 0 }}>
        Changes to commission settings and marketplace availability affect
        marketplace operations. Confirm each change before proceeding.
      </p>
    </div>
  </>
)}
  {adminSection === "users" && (
  <>
    <h1 style={styles.dashboardTitle}>User Management</h1>

    <p style={styles.dashboardSubtitle}>
      View, monitor and manage Mac-Cheru user accounts.
    </p>

    {(() => {
      const activeUsers = users.filter(
        (user) => user.status === "active"
      ).length;

      const suspendedUsers = users.filter(
        (user) => user.status === "suspended"
      ).length;

      const statusStyle = (status) => {
        const active = String(status || "").toLowerCase() === "active";

        return {
          display: "inline-flex",
          alignItems: "center",
          padding: "6px 12px",
          borderRadius: "20px",
          fontSize: "12px",
          fontWeight: "800",
          textTransform: "capitalize",
          color: active ? "#86efac" : "#fca5a5",
          background: active
            ? "rgba(22,163,74,0.15)"
            : "rgba(220,68,68,0.15)",
          border: `1px solid ${
            active ? "rgba(34,197,94,0.35)" : "rgba(239,68,68,0.35)"
          }`,
        };
      };

      const roleStyle = {
        display: "inline-block",
        padding: "5px 10px",
        borderRadius: "7px",
        background: "rgba(212,175,55,0.12)",
        color: "#f5d77b",
        fontSize: "12px",
        fontWeight: "700",
        textTransform: "capitalize",
      };

      return (
        <>
          <div style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fit,minmax(180px,1fr))",
            gap: "16px",
            margin: "25px 0"
          }}>
            <div style={styles.activityCard}>
              <p style={{ color: "#94a3b8" }}>Total Users</p>
              <h2 style={{ color: "#f8fafc", fontSize: "28px" }}>
                {users.length}
              </h2>
            </div>

            <div style={styles.activityCard}>
              <p style={{ color: "#94a3b8" }}>Active Accounts</p>
              <h2 style={{ color: "#4ade80", fontSize: "28px" }}>
                {activeUsers}
              </h2>
            </div>

            <div style={styles.activityCard}>
              <p style={{ color: "#94a3b8" }}>Suspended Accounts</p>
              <h2 style={{ color: "#f87171", fontSize: "28px" }}>
                {suspendedUsers}
              </h2>
            </div>
          </div>

          <div style={styles.activityCard}>
            <h2 style={{ color: "#f1c957", marginBottom: "20px" }}>
              Registered Users
            </h2>

            {users.length === 0 ? (
              <p>No users found.</p>
            ) : (
              <div style={{ width: "100%", overflowX: "auto" }}>
                <table style={{
                  width: "100%",
                  minWidth: "650px",
                  borderCollapse: "collapse"
                }}>
                  <thead>
                    <tr>
                      <th style={styles.tableHeader}>Email</th>
                      <th style={styles.tableHeader}>Role</th>
                      <th style={styles.tableHeader}>Account Status</th>
                      <th style={styles.tableHeader}>Date Joined</th>
                      <th style={styles.tableHeader}>Action</th>
                    </tr>
                  </thead>

                  <tbody>
                    {users.map((user) => (
                      <tr key={user.id}>
                        <td style={styles.tableCell}>
                          {user.email}
                        </td>

                        <td style={styles.tableCell}>
                          <span style={roleStyle}>
                            {user.role}
                          </span>
                        </td>

                        <td style={styles.tableCell}>
                          <span style={statusStyle(user.status)}>
                            ● {user.status || "Unknown"}
                          </span>
                        </td>

                        <td style={styles.tableCell}>
                          {user.created_at
                            ? new Date(user.created_at).toLocaleDateString()
                            : "—"}
                        </td>

                        <td style={styles.tableCell}>
                          <button
                            style={{
                              ...styles.manageButton,
                              background:
                                user.status === "active"
                                  ? "#7f1d1d"
                                  : "#166534",
                              color: "#ffffff",
                              padding: "9px 15px",
                              borderRadius: "8px",
                              fontWeight: "700",
                              border: "none",
                              cursor: "pointer"
                            }}
                            onClick={() =>
                              updateUserStatus(user.id, user.status)
                            }
                          >
                            {user.status === "active"
                              ? "Suspend Account"
                              : "Activate Account"}
                          </button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </div>
        </>
      );
    })()}
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
    {(() => {
      const pending = adminOrders.filter(
        (o) => o.status === "pending"
      ).length;

      const accepted = adminOrders.filter(
        (o) => o.status === "accepted"
      ).length;

      const paid = adminOrders.filter(
        (o) => o.status === "paid"
      ).length;

      const rejected = adminOrders.filter(
        (o) => o.status === "rejected"
      ).length;

      const getOrderStatusStyle = (status) => {
        const colors = {
          paid: ["#86efac", "rgba(22,163,74,0.15)"],
          accepted: ["#93c5fd", "rgba(37,99,235,0.15)"],
          pending: ["#fcd34d", "rgba(217,119,6,0.15)"],
          rejected: ["#fca5a5", "rgba(220,38,38,0.15)"],
          payment_failed: ["#fca5a5", "rgba(220,38,38,0.15)"],
        };

        const color = colors[String(status || "").toLowerCase()] ||
          ["#cbd5e1", "rgba(100,116,139,0.15)"];

        return {
          display: "inline-flex",
          padding: "6px 12px",
          borderRadius: "20px",
          color: color[0],
          background: color[1],
          border: `1px solid ${color[0]}55`,
          fontSize: "12px",
          fontWeight: "800",
          textTransform: "capitalize",
        };
      };

      return (
        <>
          <h1 style={styles.dashboardTitle}>Order Management</h1>

          <p style={styles.dashboardSubtitle}>
            Monitor, review and track all Mac-Cheru marketplace orders.
          </p>

          <div style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fit,minmax(160px,1fr))",
            gap: "16px",
            margin: "25px 0"
          }}>
            {[
              { label: "Total Orders", value: adminOrders.length, color: "#60a5fa" },
              { label: "Pending", value: pending, color: "#fbbf24" },
              { label: "Accepted", value: accepted, color: "#38bdf8" },
              { label: "Paid", value: paid, color: "#4ade80" },
              { label: "Rejected", value: rejected, color: "#f87171" },
            ].map((item) => (
              <div key={item.label} style={{
                ...styles.activityCard,
                borderTop: `3px solid ${item.color}`
              }}>
                <p style={{ color: "#94a3b8", margin: "0 0 12px" }}>
                  {item.label}
                </p>
                <h2 style={{
                  color: item.color,
                  fontSize: "28px",
                  margin: 0
                }}>
                  {item.value.toLocaleString()}
                </h2>
              </div>
            ))}
          </div>

          <div style={styles.activityCard}>
            <h2 style={{ color: "#f1c957", marginBottom: "20px" }}>
              All Marketplace Orders
            </h2>

            {adminOrders.length === 0 ? (
              <p>No orders found.</p>
            ) : (
              <div style={{ width: "100%", overflowX: "auto" }}>
                <table style={{
                  width: "100%",
                  minWidth: "650px",
                  borderCollapse: "collapse"
                }}>
                  <thead>
                    <tr>
                      <th style={styles.tableHeader}>Product</th>
                      <th style={styles.tableHeader}>Quantity</th>
                      <th style={styles.tableHeader}>Order Status</th>
                      <th style={styles.tableHeader}>Date Placed</th>
                    </tr>
                  </thead>

                  <tbody>
                    {adminOrders.map((order) => (
                      <tr key={order.id}>
                        <td style={styles.tableCell}>
                          <strong style={{ color: "#f8fafc" }}>
                            {order.products?.name || "Unknown product"}
                          </strong>
                        </td>

                        <td style={styles.tableCell}>
                          {order.quantity}
                        </td>

                        <td style={styles.tableCell}>
                          <span style={getOrderStatusStyle(order.status)}>
                            ● {String(order.status || "Unknown").replaceAll("_", " ")}
                          </span>
                        </td>

                        <td style={styles.tableCell}>
                          {order.created_at
                            ? new Date(order.created_at).toLocaleDateString()
                            : "—"}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </div>
        </>
      );
    })()}
  </>
)}
{adminSection === "payments" && (
  <>
    {(() => {
      const paid = adminPayments.filter(
        (p) => p.status === "paid"
      );

      const pending = adminPayments.filter(
        (p) => p.status === "pending"
      );

      const failed = adminPayments.filter(
        (p) => ["failed", "payment_failed"].includes(
          String(p.status || "").toLowerCase()
        )
      );

      const totalSales = paid.reduce(
        (sum, p) => sum + Number(p.amount || 0), 0
      );

      const totalCommission = paid.reduce(
        (sum, p) => sum + Number(p.commission || 0), 0
      );

      const totalSellerEarnings = paid.reduce(
        (sum, p) => sum + Number(p.seller_amount || 0), 0
      );

      const formatMoney = (amount) =>
        `KSh ${Number(amount || 0).toLocaleString("en-KE")}`;

      const paymentStatusStyle = (status) => {
        const value = String(status || "").toLowerCase();

        const colors = {
          paid: ["#86efac", "rgba(22,163,74,0.15)"],
          pending: ["#fcd34d", "rgba(217,119,6,0.15)"],
          failed: ["#fca5a5", "rgba(220,38,38,0.15)"],
          payment_failed: ["#fca5a5", "rgba(220,38,38,0.15)"],
        };

        const color = colors[value] ||
          ["#cbd5e1", "rgba(100,116,139,0.15)"];

        return {
          display: "inline-flex",
          padding: "6px 12px",
          borderRadius: "20px",
          color: color[0],
          background: color[1],
          border: `1px solid ${color[0]}55`,
          fontSize: "12px",
          fontWeight: "800",
          textTransform: "capitalize",
        };
      };

      const summaryCards = [
        {
          label: "Total Transactions",
          value: adminPayments.length,
          color: "#60a5fa",
          money: false,
        },
        {
          label: "Successful Payments",
          value: paid.length,
          color: "#4ade80",
          money: false,
        },
        {
          label: "Pending Payments",
          value: pending.length,
          color: "#fbbf24",
          money: false,
        },
        {
          label: "Failed Payments",
          value: failed.length,
          color: "#f87171",
          money: false,
        },
        {
          label: "Total Paid Sales",
          value: totalSales,
          color: "#38bdf8",
          money: true,
        },
        {
          label: "Platform Commission",
          value: totalCommission,
          color: "#d4af37",
          money: true,
        },
        {
          label: "Seller Earnings",
          value: totalSellerEarnings,
          color: "#c084fc",
          money: true,
        },
      ];

      return (
        <>
          <h1 style={styles.dashboardTitle}>Payment Management</h1>

          <p style={styles.dashboardSubtitle}>
            Monitor transactions, platform commissions and seller earnings.
          </p>

          <div style={{
            display: "grid",
            gridTemplateColumns: "repeat(auto-fit,minmax(175px,1fr))",
            gap: "16px",
            margin: "25px 0"
          }}>
            {summaryCards.map((item) => (
              <div key={item.label} style={{
                ...styles.activityCard,
                borderTop: `3px solid ${item.color}`
              }}>
                <p style={{ color: "#94a3b8", fontSize: "13px" }}>
                  {item.label}
                </p>

                <h2 style={{
                  color: item.color,
                  fontSize: item.money ? "21px" : "28px",
                  overflowWrap: "anywhere"
                }}>
                  {item.money
                    ? formatMoney(item.value)
                    : item.value.toLocaleString()}
                </h2>
              </div>
            ))}
          </div>

          <div style={styles.activityCard}>
            <h2 style={{ color: "#f1c957", marginBottom: "20px" }}>
              Transaction Records
            </h2>

            {adminPayments.length === 0 ? (
              <p>No payment records available yet.</p>
            ) : (
              <div style={{ width: "100%", overflowX: "auto" }}>
                <table style={{
                  width: "100%",
                  minWidth: "850px",
                  borderCollapse: "collapse"
                }}>
                  <thead>
                    <tr>
                      <th style={styles.tableHeader}>Transaction Amount</th>
                      <th style={styles.tableHeader}>Commission</th>
                      <th style={styles.tableHeader}>Seller Earnings</th>
                      <th style={styles.tableHeader}>Payment Status</th>
                      <th style={styles.tableHeader}>Transaction Date</th>
                    </tr>
                  </thead>

                  <tbody>
                    {adminPayments.map((payment) => (
                      <tr key={payment.id}>
                        <td style={styles.tableCell}>
                          <strong style={{ color: "#f8fafc" }}>
                            {formatMoney(payment.amount)}
                          </strong>
                        </td>

                        <td style={styles.tableCell}>
                          <span style={{ color: "#f5d77b" }}>
                            {formatMoney(payment.commission)}
                          </span>
                        </td>

                        <td style={styles.tableCell}>
                          {formatMoney(payment.seller_amount)}
                        </td>

                        <td style={styles.tableCell}>
                          <span style={paymentStatusStyle(payment.status)}>
                            ● {String(payment.status || "Unknown").replaceAll("_", " ")}
                          </span>
                        </td>

                        <td style={styles.tableCell}>
                          {payment.created_at
                            ? new Date(payment.created_at).toLocaleDateString()
                            : "—"}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </div>
        </>
      );
    })()}
  </>
)}
{adminSection === "wallet" && (
  <>
    <div style={{ marginBottom: "30px" }}>
      <h1 style={styles.dashboardTitle}>Admin Commission Wallet</h1>
      <p style={styles.dashboardSubtitle}>
        Manage platform commission, available funds and withdrawal requests.
      </p>
    </div>

    {/* WALLET SUMMARY */}
    <div
      style={{
        display: "grid",
        gridTemplateColumns: "repeat(auto-fit, minmax(190px, 1fr))",
        gap: "18px",
        marginBottom: "28px",
      }}
    >
      {[
        {
          title: "Total Confirmed Commission",
          amount: walletCommission,
          icon: "💰",
          color: "#e6c45b",
        },
        {
          title: "Available Balance",
          amount: Math.max(0, walletCommission - walletReserved),
          icon: "🏦",
          color: "#22c55e",
        },
        {
          title: "Pending Withdrawals",
          amount: walletPending,
          icon: "⏳",
          color: "#f59e0b",
        },
      ].map((item) => (
        <div
          key={item.title}
          style={{
            background: "linear-gradient(145deg, #172943, #101d32)",
            border: "1px solid rgba(212,175,55,0.25)",
            borderRadius: "16px",
            padding: "23px",
            boxShadow: "0 8px 24px rgba(0,0,0,0.18)",
            minWidth: 0,
          }}
        >
          <div style={{ fontSize: "27px", marginBottom: "12px" }}>
            {item.icon}
          </div>

          <p style={{ color: "#9eafc5", fontSize: "13px", margin: "0 0 9px" }}>
            {item.title}
          </p>

          <h2
            style={{
              color: item.color,
              fontSize: "24px",
              margin: 0,
              overflowWrap: "anywhere",
            }}
          >
            KSh {Number(item.amount || 0).toLocaleString("en-KE")}
          </h2>
        </div>
      ))}
    </div>

    {/* WITHDRAWAL FORM */}
    <div
      style={{
        background: "#111f35",
        border: "1px solid #293b56",
        borderRadius: "16px",
        padding: "25px",
        marginBottom: "28px",
      }}
    >
      <div style={{ fontSize: "28px", marginBottom: "10px" }}>💸</div>

      <h2 style={{ color: "#e6c45b", marginTop: 0 }}>
        Withdraw Commission
      </h2>

      <p style={{ color: "#9eafc5", lineHeight: 1.6 }}>
        Submit a withdrawal request for your available platform commission.
      </p>

      <div
        style={{
          background: "#0d192c",
          borderRadius: "10px",
          padding: "15px",
          margin: "18px 0",
          border: "1px solid #34445e",
        }}
      >
        <p style={{ color: "#9eafc5", margin: "0 0 5px", fontSize: "13px" }}>
          Currently available
        </p>

        <h2 style={{ color: "#22c55e", margin: 0 }}>
          KSh{" "}
          {Math.max(
            0,
            walletCommission - walletReserved
          ).toLocaleString("en-KE")}
        </h2>
      </div>

      <form
        onSubmit={handleWalletWithdrawal}
        style={{
          display: "grid",
          gridTemplateColumns: "repeat(auto-fit, minmax(220px, 1fr))",
          gap: "18px",
        }}
      >
        <div>
          <label
            style={{
              display: "block",
              color: "#d5deeb",
              marginBottom: "9px",
              fontWeight: 600,
            }}
          >
            Withdrawal Amount (KSh)
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
              padding: "13px",
              borderRadius: "9px",
              border: "1px solid #34445e",
              background: "#0d192c",
              color: "#f1f5f9",
              boxSizing: "border-box",
            }}
          />
        </div>

        <div>
          <label
            style={{
              display: "block",
              color: "#d5deeb",
              marginBottom: "9px",
              fontWeight: 600,
            }}
          >
            M-Pesa Phone Number
          </label>

          <input
            type="tel"
            value={walletPhone}
            onChange={(event) => setWalletPhone(event.target.value)}
            placeholder="0740575196"
            required
            style={{
              width: "100%",
              padding: "13px",
              borderRadius: "9px",
              border: "1px solid #34445e",
              background: "#0d192c",
              color: "#f1f5f9",
              boxSizing: "border-box",
            }}
          />
        </div>

        <div style={{ gridColumn: "1 / -1" }}>
          <button
            type="submit"
            style={{
              ...styles.manageButton,
              width: "100%",
              padding: "14px",
            }}
          >
            💸 Request Withdrawal
          </button>
        </div>

        {walletMessage && (
          <p
            style={{
              gridColumn: "1 / -1",
              color: "#e6c45b",
              background: "#0d192c",
              padding: "13px",
              borderRadius: "9px",
              margin: 0,
            }}
          >
            {walletMessage}
          </p>
        )}
      </form>
    </div>

    {/* WITHDRAWAL HISTORY */}
    <div
      style={{
        background: "#111f35",
        border: "1px solid #293b56",
        borderRadius: "16px",
        padding: "25px",
      }}
    >
      <h2 style={{ color: "#e6c45b", marginTop: 0 }}>
        Withdrawal History
      </h2>

      <p style={{ color: "#9eafc5", fontSize: "13px" }}>
        Review your previous commission withdrawal requests.
      </p>

      <div style={{ overflowX: "auto", marginTop: "20px" }}>
        <table
          style={{
            width: "100%",
            minWidth: "600px",
            borderCollapse: "collapse",
          }}
        >
          <thead>
            <tr>
              {["Amount", "M-Pesa Number", "Status", "Date"].map((heading) => (
                <th
                  key={heading}
                  style={{
                    padding: "14px",
                    textAlign: "left",
                    color: "#e6c45b",
                    background: "#1c2d49",
                    borderBottom: "1px solid #34445e",
                  }}
                >
                  {heading}
                </th>
              ))}
            </tr>
          </thead>

          <tbody>
            {walletHistory.length === 0 ? (
              <tr>
                <td
                  colSpan="4"
                  style={{
                    padding: "25px",
                    textAlign: "center",
                    color: "#9eafc5",
                  }}
                >
                  No withdrawal requests yet.
                </td>
              </tr>
            ) : (
              walletHistory.map((withdrawal) => {
                const status = String(withdrawal.status || "").toLowerCase();

                const statusColor =
                  status === "approved"
                    ? "#22c55e"
                    : status === "rejected"
                    ? "#ef4444"
                    : "#eab308";

                return (
                  <tr key={withdrawal.id}>
                    <td style={{ padding: "14px", color: "#f1f5f9" }}>
                      KSh{" "}
                      {Number(withdrawal.amount || 0).toLocaleString("en-KE")}
                    </td>

                    <td style={{ padding: "14px", color: "#d5deeb" }}>
                      {withdrawal.mpesa_number}
                    </td>

                    <td style={{ padding: "14px" }}>
                      <span
                        style={{
                          display: "inline-block",
                          padding: "5px 11px",
                          borderRadius: "20px",
                          background: `${statusColor}20`,
                          color: statusColor,
                          fontSize: "12px",
                          fontWeight: 700,
                          textTransform: "capitalize",
                        }}
                      >
                        {withdrawal.status}
                      </span>
                    </td>

                    <td style={{ padding: "14px", color: "#d5deeb" }}>
                      {new Date(withdrawal.created_at).toLocaleDateString(
                        "en-KE"
                      )}
                    </td>
                  </tr>
                );
              })
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
    <div className="mc-seller-page">
      <h1 style={{ fontSize: "32px", marginBottom: "10px" }}>
  Seller Dashboard
</h1>
      <p>
  Manage your products, track orders, and monitor your sales on Mac-Cheru.
</p>
{/* SELLER DASHBOARD OVERVIEW */}

<div
  style={{
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit, minmax(190px, 1fr))",
    gap: "18px",
    marginTop: "28px",
    marginBottom: "30px",
  }}
>
  {[
    {
      title: "Total Sales",
      value: `KSh ${sellerTotalSales.toLocaleString()}`,
      icon: "💰",
    },
    {
      title: "Total Orders",
      value: sellerOrders.length,
      icon: "📦",
    },
    {
      title: "Products Listed",
      value: products.length,
      icon: "🛍️",
    },
    {
      title: "Your Earnings",
      value: `KSh ${sellerEarnings.toLocaleString()}`,
      icon: "💳",
    },
  ].map((item) => (
    <div
      key={item.title}
      style={{
        padding: "24px",
        borderRadius: "16px",
        background: "linear-gradient(145deg, #172943, #101d32)",
        border: "1px solid rgba(212,175,55,0.35)",
        borderTop: "4px solid #d4af37",
        boxShadow: "0 8px 22px rgba(0,0,0,0.2)",
      }}
    >
      <div style={{ fontSize: "27px", marginBottom: "12px" }}>
        {item.icon}
      </div>

      <p style={{ fontSize: "14px", margin: "0 0 10px", color: "#a8b5c8" }}>
        {item.title}
      </p>

      <h2
        style={{
          fontSize: "23px",
          margin: 0,
          color: "#f5d77b",
          overflowWrap: "anywhere",
        }}
      >
        {item.value}
      </h2>
    </div>
  ))}
</div>
<div style={{ marginTop: "30px" }}>
  <div className="mc-seller-panel mc-store-panel" style={{ marginTop: "30px" }}>
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
  <h2
  style={{
    fontSize: "24px",
    marginBottom: "18px",
    color: "#f5d77b",
    paddingBottom: "12px",
    borderBottom: "2px solid #d4af37",
  }}
>
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
  <div
  style={{
    marginTop: "20px",
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit, minmax(240px, 1fr))",
    gap: "18px",
  }}
>
    {products.map((product) => (
      <div
        key={product.id}
        style={{
  border: "1px solid rgba(212,175,55,0.3)",
  borderLeft: "5px solid #d4af37",
  borderRadius: "16px",
  padding: "22px",
  background: "linear-gradient(145deg, #172943, #101d32)",
  boxShadow: "0 8px 22px rgba(0,0,0,0.2)",
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
      {/* PROFESSIONAL SELLER ORDERS SECTION */}

<div className="mc-seller-orders" style={{ marginTop: "40px" }}>

  <div className="mc-orders-heading">
    <div>
      <h2>Customer Orders</h2>
      <p>Manage and process orders received from your customers.</p>
    </div>

    <div className="mc-orders-count">
      {sellerOrders.length} Total Orders
    </div>
  </div>

  {sellerOrders.length === 0 ? (
    <div className="mc-empty-orders">
      <div style={{ fontSize: "42px" }}>📦</div>
      <h3>No Orders Yet</h3>
      <p>Customer orders will appear here when someone purchases your products.</p>
    </div>
  ) : (

    <div className="mc-orders-grid">

      {sellerOrders.map((order) => (

        <div className="mc-order-card" key={order.id}>

          <div className="mc-order-top">
            <div>
              <span className="mc-order-label">ORDER</span>
              <h3>{order.products?.name || "Product"}</h3>
            </div>

            <span className={`mc-order-status ${order.status}`}>
              {order.status || "pending"}
            </span>
          </div>

          <div className="mc-order-details">

            <div>
              <span>Product Price</span>
              <strong>
                KSh {Number(order.products?.price || 0).toLocaleString()}
              </strong>
            </div>

            <div>
              <span>Quantity</span>
              <strong>{order.quantity}</strong>
            </div>

            <div>
              <span>Payment Status</span>
              <strong className={`mc-payment-status ${order.payment_status || "pending"}`}>
                {order.payment_status || "pending"}
              </strong>
            </div>

          </div>

          <div className="mc-order-actions">

            <button
              type="button"
              disabled={order.status === "accepted"}
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
              className="mc-accept-order"
            >
              Accept Order
            </button>

            <button
              type="button"
              disabled={order.status === "rejected"}
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
              className="mc-reject-order"
            >
              Reject Order
            </button>

          </div>

        </div>

      ))}

    </div>

  )}

</div>



 {/* Seller Earnings */}

{/* PROFESSIONAL SELLER EARNINGS DASHBOARD */}

<div className="mc-seller-finances">

  <div className="mc-finance-heading">
    <h2>Financial Overview</h2>
    <p>Track your sales, marketplace commission and earnings.</p>
  </div>

  <div className="mc-finance-grid">

    <div className="mc-finance-card">
      <div className="mc-finance-icon">💰</div>
      <p>Total Sales</p>
      <h3>KSh {sellerTotalSales.toLocaleString()}</h3>
      <span>Overall sales value</span>
    </div>

    <div className="mc-finance-card">
      <div className="mc-finance-icon">🏦</div>
      <p>Mac-Cheru Commission</p>
      <h3>KSh {sellerCommission.toLocaleString()}</h3>
      <span>Commission rate: {commissionRate}%</span>
    </div>

    <div className="mc-finance-card mc-finance-highlight">
      <div className="mc-finance-icon">📈</div>
      <p>Your Earnings</p>
      <h3>KSh {sellerEarnings.toLocaleString()}</h3>
      <span>Your earnings after commission</span>
    </div>

    <div className="mc-finance-card">
      <div className="mc-finance-icon">💳</div>
      <p>Available for Withdrawal</p>
      <h3>KSh {sellerEarnings.toLocaleString()}</h3>
      <span>Based on your current earnings</span>
    </div>

  </div>

  <div className="mc-finance-note">
    <strong>Financial Information</strong>
    <p>
      Mac-Cheru automatically deducts the applicable marketplace
      commission from sales. Your earnings represent the amount
      remaining after commission.
    </p>
  </div>

</div>
  {/* Payment Details */}

{/* PROFESSIONAL PAYMENT DETAILS */}

<div className="mc-payment-details">

  <div className="mc-payment-heading">
    <div>
      <h2>Payment Details</h2>
      <p>Manage where you receive your Mac-Cheru earnings.</p>
    </div>
    <span className="mc-payment-icon">💳</span>
  </div>

  <div className="mc-payment-info">
    <strong>M-Pesa Payment Account</strong>
    <p>
      Enter the M-Pesa phone number where you want to receive
      your seller earnings. Make sure the number is correct.
    </p>
  </div>

  <label className="mc-payment-label">
    M-Pesa Phone Number
  </label>

  <input
    type="tel"
    placeholder="e.g. 0712345678"
    value={sellerPhone}
    onChange={(e) => setSellerPhone(e.target.value)}
    className="mc-payment-input"
  />

  <button
    type="button"
    onClick={async () => {
      const { data: { user } } = await supabase.auth.getUser();

      if (!user) {
        alert("Please log in first.");
        return;
      }

      if (!sellerPhone.trim()) {
        alert("Please enter your M-Pesa phone number.");
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
    className="mc-payment-save"
  >
    <span>✓</span> Save Payment Details
  </button>

  <div className="mc-payment-security">
    <span>🔒</span>
    Your payment information is stored securely in your account.
  </div>

</div>
{/* Withdraw Earnings */}

{/* PROFESSIONAL WITHDRAWAL SECTION */}

<div className="mc-withdrawal-panel">

  <div className="mc-withdrawal-heading">
    <div>
      <h2>Withdraw Earnings</h2>
      <p>Request payment of your available seller earnings.</p>
    </div>
    <span className="mc-withdrawal-icon">💸</span>
  </div>

  <div className="mc-withdrawal-balance">
    <span>AVAILABLE BALANCE</span>
    <h3>KSh {sellerEarnings.toLocaleString()}</h3>
    <p>Your current seller earnings</p>
  </div>

  <label className="mc-withdrawal-label">
    Withdrawal Amount (KSh)
  </label>

  <input
    type="number"
    placeholder="Enter amount to withdraw"
    value={withdrawalAmount}
    onChange={(e) => setWithdrawalAmount(e.target.value)}
    min="1"
    className="mc-withdrawal-input"
  />

  <button
    type="button"
    onClick={requestWithdrawal}
    className="mc-withdrawal-button"
  >
    <span>↗</span> Request Withdrawal
  </button>

  <div className="mc-withdrawal-notice">
    <span>ℹ️</span>
    Withdrawal requests are submitted for processing.
  </div>

</div>
{/* Reports & Complaints */}

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
    <div className="mc-buyer-page">
      <div className="mc-buyer-header">
  <div>
    <span className="mc-buyer-eyebrow">WELCOME TO MAC-CHERU</span>
    <h1>Buyer Dashboard</h1>
    <p>
      Discover stores, explore products and manage all your purchases in one place.
    </p>
  </div>

  <div className="mc-buyer-header-icon">
    🛍️
  </div>
</div>
<div className="mc-buyer-stores-section">
  <div className="mc-buyer-section-heading">
    <div>
      <span>DISCOVER MAC-CHERU</span>
      <h2>Explore Stores</h2>
      <p>Find sellers and discover products available in their stores.</p>
    </div>
    <div className="mc-buyer-section-icon">🏪</div>
  </div>

{selectedStore && (
  <div style={{ marginTop: "20px" }}>
    <h3>{selectedStore.store_name} Products</h3>

    {storeProducts.length === 0 ? (
      <p>No products available in this store yet.</p>
    ) : (
      storeProducts.map((product) => (
        <div
  className="mc-buyer-store-product-card"
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

    const commissionRate = Number(settings.commission_rate);
    const commission = amount * (commissionRate / 100);
    const sellerAmount = amount - commission;

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
      console.log("PAYMENT ERROR:", paymentError);
      alert(paymentError.message);
      return;
    }

    // Ask buyer for M-Pesa number
    const phone = prompt("Enter your M-Pesa phone number:");

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
      console.log("MPESA ERROR:", mpesaError);
      alert(mpesaError.message);
      return;
    }

    console.log("MPESA RESPONSE:", mpesaData);

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
      console.log("PAYMENT UPDATE ERROR:", updatePaymentError);
      alert(updatePaymentError.message);
      return;
    }

    alert(
      "M-Pesa payment prompt sent. Please check your phone."
    );
  }}
  className="mc-buyer-buy-button"
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
  className="mc-buyer-store-card"
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

<div className="mc-buyer-section-heading mc-available-products-heading">
  <div>
    <span>SHOP ON MAC-CHERU</span>
    <h2>Available Products</h2>
    <p>Explore products from sellers across the marketplace.</p>
  </div>
  <div className="mc-buyer-section-icon">🛍️</div>
</div>
  {buyerProducts.length === 0 ? (
  <p>No products available yet.</p>
) : (
  <div style={{ marginTop: "20px" }}>
    {buyerProducts.map((product) => (
      <div
  className="mc-buyer-product-card"
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
  <div className="mc-buyer-section-heading mc-buyer-orders-heading">
  <div>
    <span>YOUR PURCHASES</span>
    <h2>My Orders</h2>
    <p>View your purchases and keep track of their progress.</p>
  </div>
  <div className="mc-buyer-section-icon">📦</div>
</div>

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
  <div className="mc-buyer-section-heading mc-buyer-reports-heading">
  <div>
    <span>WE'RE HERE TO HELP</span>
    <h2>Reports & Complaints</h2>
    <p>Contact the Mac-Cheru team if you experience any problems.</p>
  </div>
  <div className="mc-buyer-section-icon">🛟</div>
</div>

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
    <div className="page">
      <nav className="navbar">
  <div style={styles.logo}>Mac-Cheru</div>

  <div className="navLinks">
    <button
      type="button"
      onClick={() => {
        setSelectedStore(null);
        window.scrollTo({ top: 0, behavior: "smooth" });
      }}
    >
      Home
    </button>

    <button
      type="button"
      onClick={() => {
        setSelectedStore(null);
        document.getElementById("stores-section")?.scrollIntoView({
          behavior: "smooth"
        });
      }}
    >
      Stores
    </button>

    <button
      type="button"
      onClick={() => {
        setSelectedStore(null);
        document.getElementById("products-section")?.scrollIntoView({
          behavior: "smooth"
        });
      }}
    >
      Products
    </button>

    <button
      type="button"
      onClick={() => {
        setShowLogin(true);
        window.scrollTo({ top: 0, behavior: "smooth" });
      }}
    >
      Orders
    </button>
  </div>

  <button
    type="button"
    onClick={() => setShowLogin(true)}
  >
    Login / Sign Up
  </button>
</nav>
{/* MAC-CHERU MARKETPLACE HERO */}
<section className="mc-hero">
  <div className="mc-hero-content">
    <span className="mc-eyebrow">WELCOME TO MAC-CHERU</span>

    <h1>Everything You Need, All in One Marketplace.</h1>

    <p>
      Discover great products, explore trusted stores
      and enjoy a better shopping experience.
    </p>

    <div className="mc-hero-actions">
      <button
        type="button"
        onClick={() =>
          document.getElementById("products-section")
            ?.scrollIntoView({ behavior: "smooth" })
        }
      >
        Explore Products
      </button>

      <button
        type="button"
        onClick={() =>
          document.getElementById("stores-section")
            ?.scrollIntoView({ behavior: "smooth" })
        }
      >
        Explore Stores
      </button>
    </div>
  </div>
  <div className="mc-hero-decoration">
    <span>MC</span>
    <small>SHOP • DISCOVER • ENJOY</small>
  </div>
</section>

<section className="mc-benefits">
  <div>🛍️ <strong>Discover Products</strong></div>
  <div>🏪 <strong>Explore Stores</strong></div>
  <div>🔒 <strong>Secure Shopping</strong></div>
</section>
<MarketplaceShowcase onLogin={() => setShowLogin(true)} />
<MarketplaceProducts onLogin={() => setShowLogin(true)} />
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
function MarketplaceShowcase({ onLogin }) {
  const [stores, setStores] = useState([]);
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");
  const [sort, setSort] = useState("default");
  const [selectedStore, setSelectedStore] = useState(null);

  useEffect(() => {
    let active = true;

    async function loadMarketplace() {
      try {
        const [storeResult, productResult] = await Promise.all([
          supabase
            .from("stores")
            .select("id, seller_id, store_name, description")
            .eq("status", "active")
            .limit(6),

          supabase
            .from("products")
            .select("id, seller_id, name, price, description, image_url")
            .eq("status", "active")
            .limit(100)
        ]);

        if (!active) return;

        if (storeResult.error) {
          console.error("Stores:", storeResult.error.message);
        } else {
          setStores(storeResult.data || []);
        }

        if (productResult.error) {
          console.error("Products:", productResult.error.message);
        } else {
          setProducts(productResult.data || []);
        }
      } catch (error) {
        console.error("Marketplace loading failed:", error);
      } finally {
        if (active) setLoading(false);
      }
    }

    loadMarketplace();

    return () => {
      active = false;
    };
  }, []);

  function openStore(store) {
    setSelectedStore(store);

    document.getElementById("products-section")
      ?.scrollIntoView({ behavior: "smooth" });
  }

  const storeProducts = selectedStore
    ? products.filter(
        product => product.seller_id === selectedStore.seller_id
      )
    : products;

  const displayedProducts = storeProducts
    .filter(product =>
      `${product.name || ""} ${product.description || ""}`
        .toLowerCase()
        .includes(search.toLowerCase())
    )
    .sort((a, b) => {
      if (sort === "low") {
        return Number(a.price) - Number(b.price);
      }

      if (sort === "high") {
        return Number(b.price) - Number(a.price);
      }

      return 0;
    });

  return (
    <>
      <section id="stores-section" className="mc-stores">
        <div className="mc-section-heading">
          <span className="mc-section-label">
            MEET OUR SELLERS
          </span>

          <h2>Explore Our Stores</h2>

          <p>
            Discover businesses from our marketplace sellers.
          </p>
        </div>

        {loading ? (
          <p>Loading stores...</p>
        ) : stores.length === 0 ? (
          <div className="mc-empty-products">
            <h3>New stores are coming soon!</h3>
            <p>
              Our sellers will showcase their businesses here.
            </p>
          </div>
        ) : (
          <div className="mc-store-grid">
            {stores.map(store => (
              <article className="mc-store-card" key={store.id}>
                <div className="mc-store-icon">🏪</div>

                <div className="mc-store-info">
                  <h3>{store.store_name}</h3>

                  <p>
                    {store.description ||
                      "Discover this Mac-Cheru store."}
                  </p>

                  <button
                    type="button"
                    onClick={() => openStore(store)}
                  >
                    Explore Store
                  </button>
                </div>
              </article>
            ))}
          </div>
        )}
      </section>

      <section id="products-section" className="mc-products">
        <div className="mc-section-heading">
          <span className="mc-section-label">
            EXPLORE OUR MARKETPLACE
          </span>

          <h2>
            {selectedStore
              ? selectedStore.store_name
              : "Featured Products"}
          </h2>

          <p>
            {selectedStore
              ? "Browse products from this store."
              : "Find what you need from our marketplace sellers."}
          </p>
        </div>

        {selectedStore && (
          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              alignItems: "center",
              flexWrap: "wrap",
              gap: "12px",
              padding: "14px",
              marginBottom: "18px",
              background: "#f4f6fa",
              borderRadius: "10px"
            }}
          >
            <span>
              Viewing: <strong>{selectedStore.store_name}</strong>
            </span>

            <button
              type="button"
              onClick={() => {
                setSelectedStore(null);
                setSearch("");
                setSort("default");
              }}
            >
              View All Products
            </button>
          </div>
        )}

        <div className="mc-product-controls">
          <input
            type="search"
            value={search}
            onChange={event => setSearch(event.target.value)}
            placeholder="Search products..."
            aria-label="Search products"
          />

          <select
            value={sort}
            onChange={event => setSort(event.target.value)}
            aria-label="Sort products"
          >
            <option value="default">Default order</option>
            <option value="low">Price: Low to High</option>
            <option value="high">Price: High to Low</option>
          </select>
        </div>

        {loading ? (
          <p>Loading products...</p>
        ) : displayedProducts.length === 0 ? (
          <div className="mc-empty-products">
            <h3>
              {search
                ? "No matching products found."
                : selectedStore
                  ? "This store has no listed products yet."
                  : "Our marketplace is getting ready!"}
            </h3>

            <p>
              {search
                ? "Try another search."
                : "Products will appear here as sellers list them."}
            </p>
          </div>
        ) : (
          <div className="mc-product-grid">
            {displayedProducts.map(product => (
              <article className="mc-product-card" key={product.id}>
                <div
  className="mc-product-image"
  style={{
    width: "100%",
    height: "230px",
    backgroundColor: "#f1f4f8",
    overflow: "hidden",
    borderRadius: "12px 12px 0 0"
  }}
>
  {product.image_url ? (
    <img
      src={product.image_url}
      alt={product.name || "Product image"}
      style={{
        width: "100%",
        height: "100%",
        objectFit: "cover",
        display: "block"
      }}
    />
  ) : (
    <div className="mc-product-placeholder">
      <span style={{ fontSize: "42px" }}>🛍️</span>
      <span>Product image coming soon</span>
    </div>
  )}
</div>

                <div className="mc-product-info">
                  <h3>{product.name}</h3>

                  <p>
                    {product.description ||
                      "Discover this product."}
                  </p>

                  <strong>
                    KSh {Number(product.price).toLocaleString("en-KE")}
                  </strong>

                  <button
                    type="button"
                    onClick={onLogin}
                  >
                    Login to Shop
                  </button>
                </div>
              </article>
            ))}
          </div>
        )}
      </section>
    </>
  );
}

export default App;
function MarketplaceProducts({ onLogin }) {
  const [items, setItems] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadProducts() {
      const { data, error } = await supabase
        .from("products")
        .select("id, name, price, description")
        .eq("status", "active")
        .limit(8);

      if (error) {
        console.error("Marketplace products:", error.message);
      } else {
        setItems(data || []);
      }

      setLoading(false);
    }

    loadProducts();
  }, []);

  return (
    <section id="products-section" className="mc-products">
      <div className="mc-section-heading">
        <div>
          <span className="mc-section-label">EXPLORE OUR MARKETPLACE</span>
          <h2>Featured Products</h2>
          <p>Discover products from our marketplace sellers.</p>
        </div>
      </div>

      {loading ? (
        <p>Loading products...</p>
      ) : items.length === 0 ? (
        <div className="mc-empty-products">
          <h3>Our marketplace is getting ready!</h3>
          <p>New products will appear here as sellers list them.</p>
        </div>
      ) : (
        <div className="mc-product-grid">
          {items.map((product) => (
            <article className="mc-product-card" key={product.id}>
              <div className="mc-product-placeholder">
                🛍️
              </div>

              <div className="mc-product-info">
                <h3>{product.name}</h3>

                <p>
                  {product.description || "Discover this product on Mac-Cheru."}
                </p>

                <strong>
                  KSh {Number(product.price).toLocaleString("en-KE")}
                </strong>

                <button
                  type="button"
                  onClick={() => {
                    onLogin();
                    window.scrollTo({
                      top: 0,
                      behavior: "smooth"
                    });
                  }}
                >
                  Login to Shop
                </button>
              </div>
            </article>
          ))}
        </div>
      )}
    </section>
  );
}
function MarketplaceStores({ onLogin }) {
  const [stores, setStores] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadStores() {
      const { data, error } = await supabase
        .from("stores")
        .select("id, store_name, description")
        .eq("status", "active")
        .limit(6);

      if (error) {
        console.error("Marketplace stores:", error.message);
      } else {
        setStores(data || []);
      }

      setLoading(false);
    }

    loadStores();
  }, []);

  return (
    <section id="stores-section" className="mc-stores">
      <div className="mc-section-heading">
        <span className="mc-section-label">MEET OUR SELLERS</span>
        <h2>Explore Our Stores</h2>
        <p>Discover businesses and products from our marketplace sellers.</p>
      </div>

      {loading ? (
        <p>Loading stores...</p>
      ) : stores.length === 0 ? (
        <div className="mc-empty-products">
          <h3>New stores are coming soon!</h3>
          <p>Our sellers will be showcasing their businesses here.</p>
        </div>
      ) : (
        <div className="mc-store-grid">
          {stores.map((store) => (
            <article className="mc-store-card" key={store.id}>
              <div className="mc-store-icon">🏪</div>

              <div className="mc-store-info">
                <h3>{store.store_name}</h3>

                <p>
                  {store.description ||
                    "Discover products from this Mac-Cheru seller."}
                </p>

                <button
                  type="button"
                  onClick={onLogin}
                >
                  Sign in to Shop
                </button>
              </div>
            </article>
          ))}
        </div>
      )}
    </section>
  );
}
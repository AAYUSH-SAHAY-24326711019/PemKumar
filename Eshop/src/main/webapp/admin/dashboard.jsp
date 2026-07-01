<%@ page import="com.DAO.ProductDAO"%>
<%@ page import="com.DAO.UserDAO"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Product"%>
<%@ page import="com.DAO.OrderDAO"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.ResultSet"%>

<%
ProductDAO pdao = new ProductDAO(DBConnect.getConn());
UserDAO udao = new UserDAO(DBConnect.getConn());
OrderDAO odao =
new OrderDAO(DBConnect.getConn());

double revenue =
odao.getTotalRevenue();

int totalOrders =
odao.getTotalOrders();

int todayOrders =
odao.getTodayOrders();

double todayRevenue =
odao.getTodayRevenue();

int productsSold =
odao.getProductsSold();

double avgOrderValue =
odao.getAverageOrderValue();

int inactiveProducts =
pdao.getInactiveProductCount();

StringBuilder labels = new StringBuilder();
StringBuilder values = new StringBuilder();

ResultSet salesRs = odao.getLast7DaysSales();

while(salesRs.next()) {

    labels.append("'")
          .append(salesRs.getString("sale_date"))
          .append("',");

    values.append(
          salesRs.getDouble("revenue"))
          .append(",");
}


StringBuilder productLabels =
new StringBuilder();

StringBuilder productValues =
new StringBuilder();

ResultSet topProductsRs =
odao.getTop5ProductsChart();

while(topProductsRs.next()) {

    productLabels
    .append("'")
    .append(topProductsRs.getString("product_name"))
    .append("',");

    productValues
    .append(topProductsRs.getInt("qty"))
    .append(",");
}



int products = pdao.getProductCount();
int activeProducts = pdao.getActiveProductCount();
int categories = pdao.getCategoryCount();
int users = udao.getUserCount();
%>

<!DOCTYPE html>
<html>
<head>

<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

    :root{
        --bg: #f4f6f9;
        --surface: #ffffff;
        --border: #e7eaf0;
        --text-primary: #1f2937;
        --text-secondary: #6b7280;
        --accent: #4f6ef7;
        --accent-soft: #eef1ff;
        --success: #16a34a;
        --success-soft: #eafaf0;
        --warning: #d97706;
        --warning-soft: #fef6e7;
        --danger: #dc2626;
        --danger-soft: #fdecec;
        --radius: 14px;
        --shadow-sm: 0 1px 2px rgba(16,24,40,0.04), 0 1px 3px rgba(16,24,40,0.06);
        --shadow-md: 0 4px 10px rgba(16,24,40,0.05), 0 2px 4px rgba(16,24,40,0.04);
    }

    *{
        box-sizing: border-box;
    }

    body{
        background-color: var(--bg);
        color: var(--text-primary);
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    }

    .container{
        max-width: 1200px;
    }

    /* Header */
    .bg-dark.text-white{
        background: linear-gradient(135deg, #1f2a44 0%, #2c3a5e 100%) !important;
        border-radius: var(--radius);
        box-shadow: var(--shadow-md);
        padding: 2rem 2.25rem !important;
    }

    .bg-dark.text-white h2{
        font-weight: 700;
        letter-spacing: -0.02em;
        margin-bottom: 0.35rem;
    }

    .bg-dark.text-white p{
        color: #c9d2e6;
        font-size: 0.95rem;
    }

    /* Generic card reset */
    .card{
        background-color: var(--surface);
        border: 1px solid var(--border) !important;
        border-radius: var(--radius) !important;
        box-shadow: var(--shadow-sm) !important;
        transition: transform 0.15s ease, box-shadow 0.15s ease;
    }

    .card:hover{
        transform: translateY(-2px);
        box-shadow: var(--shadow-md) !important;
    }

    /* Top summary cards */
    .row > .col-md-3 .card .card-body,
    .row > .col-md-2 .card .card-body{
        padding: 1.4rem 1.1rem;
    }

    .col-md-3 .card h3,
    .col-md-2 .card h4{
        font-weight: 800;
        color: var(--text-primary);
        margin-bottom: 0.25rem;
        letter-spacing: -0.02em;
    }

    .col-md-3 .card p,
    .col-md-2 .card p{
        color: var(--text-secondary);
        font-size: 0.82rem;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.04em;
        margin-bottom: 0;
    }

    /* Color accents per stat card position (purely visual, no logic touched) */
    .row.mt-0 .col-md-3:nth-child(1) .card,
    .col-md-3:nth-child(1) .card{
        border-top: 3px solid var(--accent) !important;
    }
    .col-md-3:nth-child(2) .card{
        border-top: 3px solid var(--success) !important;
    }
    .col-md-3:nth-child(3) .card{
        border-top: 3px solid var(--warning) !important;
    }
    .col-md-3:nth-child(4) .card{
        border-top: 3px solid #7c3aed !important;
    }

    .row.mt-4 .col-md-2:nth-child(1) .card{ border-top: 3px solid var(--accent) !important; }
    .row.mt-4 .col-md-2:nth-child(2) .card{ border-top: 3px solid var(--success) !important; }
    .row.mt-4 .col-md-2:nth-child(3) .card{ border-top: 3px solid var(--warning) !important; }
    .row.mt-4 .col-md-2:nth-child(4) .card{ border-top: 3px solid #0891b2 !important; }
    .row.mt-4 .col-md-2:nth-child(5) .card{ border-top: 3px solid #7c3aed !important; }
    .row.mt-4 .col-md-2:nth-child(6) .card{ border-top: 3px solid var(--danger) !important; }

    /* Action buttons */
    .mt-4 .btn{
        border-radius: 10px;
        font-weight: 600;
        font-size: 0.9rem;
        padding: 0.55rem 1.25rem;
        margin-right: 0.6rem;
        margin-bottom: 0.6rem;
        border: none;
        box-shadow: var(--shadow-sm);
        transition: all 0.15s ease;
    }

    .mt-4 .btn:hover{
        transform: translateY(-1px);
        box-shadow: var(--shadow-md);
    }

    .mt-4 .btn-success{
        background-color: var(--success);
    }

    .mt-4 .btn-primary{
        background-color: var(--accent);
    }

    .mt-4 .btn-warning{
        background-color: var(--warning);
        color: #ffffff;
        width: auto !important;
    }

    /* Inventory Health card */
    .card .card-header{
        background-color: var(--surface);
        border-bottom: 1px solid var(--border);
        font-weight: 700;
        font-size: 0.95rem;
        color: var(--text-primary);
        padding: 1rem 1.25rem;
        border-radius: var(--radius) var(--radius) 0 0 !important;
    }

    .card .card-body p{
        font-size: 0.92rem;
        color: var(--text-secondary);
        margin-bottom: 0.6rem;
    }

    .card .card-body p b{
        color: var(--text-primary);
        font-weight: 700;
    }

    /* Section heading */
    h3.mt-5{
        font-weight: 700;
        font-size: 1.15rem;
        color: var(--text-primary);
        letter-spacing: -0.01em;
    }

    /* Chart cards */
    .card canvas{
        padding: 0.5rem 0.25rem;
    }

    footer.dashboard-footer{
        text-align: center;
        color: var(--text-secondary);
        font-size: 0.8rem;
        padding: 2rem 0 1rem;
    }

</style>

</head>

<body>

<div class="container mt-4">

<!-- <h2 class="text-center mb-4">
Admin Dashboard
</h2> -->

<div class="bg-dark text-white p-4 rounded shadow mb-4">
    <h2>E-Shop Admin Dashboard</h2>
    <p class="mb-0">
        Manage Products, Users and Store Information
    </p>
</div>

<div class="row g-3">

<div class="col-md-3">
<div class="card text-center shadow-lg border-0">
<div class="card-body">
<h3><%=products%></h3>
<p>Total Products</p>
</div>
</div>
</div>

<div class="col-md-3">
<div class="card text-center shadow">
<div class="card-body">
<h3><%=users%></h3>
<p>Total Users</p>
</div>
</div>
</div>

<div class="col-md-3">
<div class="card text-center shadow">
<div class="card-body">
<h3><%=activeProducts%></h3>
<p>Active Products</p>
</div>
</div>
</div>

<div class="col-md-3">
<div class="card text-center shadow">
<div class="card-body">
<h3><%=categories%></h3>
<p>Categories</p>
</div>
</div>
</div>

</div>

<div class="mt-4">

<a href="add_product.jsp"
class="btn btn-success">

Add Product

</a>

<a href="all_products.jsp"
class="btn btn-primary">

All Products

</a>

<a href="/Eshop/index.jsp"
class="btn btn-primary">

Go to home page

</a>

<a href="sales_report.jsp"
class="btn btn-warning w-100 mb-2">

Sales Reports

</a>

</div>

</div>

<div class="row mt-4 g-3">

<div class="col-md-2">
<div class="card shadow border-0">
<div class="card-body text-center">
<h4><%=String.format("%.0f", revenue)%></h4>
<p>Total Revenue</p>
</div>
</div>
</div>

<div class="col-md-2">
<div class="card shadow border-0">
<div class="card-body text-center">
<h4><%=String.format("%.0f", todayRevenue)%></h4>
<p>Today's Revenue</p>
</div>
</div>
</div>

<div class="col-md-2">
<div class="card shadow border-0">
<div class="card-body text-center">
<h4><%=totalOrders%></h4>
<p>Total Orders</p>
</div>
</div>
</div>

<div class="col-md-2">
<div class="card shadow border-0">
<div class="card-body text-center">
<h4><%=todayOrders%></h4>
<p>Today's Orders</p>
</div>
</div>
</div>

<div class="col-md-2">
<div class="card shadow border-0">
<div class="card-body text-center">
<h4><%=productsSold%></h4>
<p>Items Sold</p>
</div>
</div>
</div>

<div class="col-md-2">
<div class="card shadow border-0">
<div class="card-body text-center">
<h4><%=String.format("%.0f", avgOrderValue)%></h4>
<p>Avg Order</p>
</div>
</div>
</div>

<div class="card shadow mt-4">

<div class="card-header">
Inventory Health
</div>

<div class="card-body">

<p>Active Products : <b><%=activeProducts%></b></p>

<p>Inactive Products : <b><%=inactiveProducts%></b></p>

<p>Total Categories : <b><%=categories%></b></p>

</div>

</div>

</div>
<div class="card shadow mt-4">

    <div class="card-header">

        Sales Per Day (Last 7 Days)

    </div>

    <div class="card-body">

        <canvas id="salesChart"
                height="120"></canvas>

    </div>

</div>
<h3 class="mt-5">
Top Selling Products
</h3>
<div class="card shadow mt-4">

    <div class="card-header">

        Top 5 Selling Products

    </div>

    <div class="card-body">

        <canvas id="topProductsChart"
                height="120"></canvas>

    </div>

</div>

<footer class="dashboard-footer">
    E-Shop Admin Panel
</footer>

</div>

<%-- <script>

const ctx = document.getElementById('statsChart');

new Chart(ctx, {

    type: 'bar',

    data: {

        labels: [
            'Products',
            'Users',
            'Active Products',
            'Categories'
        ],

        datasets: [{

            label: 'Store Statistics',

            data: [
                <%=products%>,
                <%=users%>,
                <%=activeProducts%>,
                <%=categories%>
            ]

        }]
    }
});

</script> --%>
<script>

const ctx =
document.getElementById('salesChart');

new Chart(ctx, {

    type: 'line',

    data: {

        labels: [

            <%=labels.toString()%>

        ],

        datasets: [{

            label: 'Revenue',

            data: [

                <%=values.toString()%>

            ],

            tension: 0.4,

            fill: true,

            borderColor: '#4f6ef7',

            backgroundColor: 'rgba(79, 110, 247, 0.12)',

            pointBackgroundColor: '#4f6ef7',

            pointBorderColor: '#ffffff',

            pointBorderWidth: 2,

            pointRadius: 4,

            borderWidth: 2.5

        }]
    },

    options: {

        responsive: true,

        plugins: {

            legend: {

                display: true,

                labels: {

                    color: '#1f2937',

                    font: { weight: '600' }
                }
            }
        },

        scales: {

            x: {

                grid: { display: false },

                ticks: { color: '#6b7280' }
            },

            y: {

                grid: { color: '#eef0f4' },

                ticks: { color: '#6b7280' }
            }
        }
    }
});

const productCtx =
	document.getElementById(
	'topProductsChart'
	);

	new Chart(productCtx, {

	    type: 'bar',

	    data: {

	        labels: [

	            <%=productLabels.toString()%>

	        ],

	        datasets: [{

	            label: 'Units Sold',

	            data: [

	                <%=productValues.toString()%>

	            ],

	            backgroundColor: [

	                '#4f6ef7',

	                '#16a34a',

	                '#d97706',

	                '#7c3aed',

	                '#0891b2'

	            ],

	            borderRadius: 8,

	            maxBarThickness: 48

	        }]
	    },

	    options: {

	        responsive: true,

	        plugins: {

	            legend: {

	                display: true,

	                labels: {

	                    color: '#1f2937',

	                    font: { weight: '600' }
	                }
	            }
	        },

	        scales: {

	            x: {

	                grid: { display: false },

	                ticks: { color: '#6b7280' }
	            },

	            y: {

	                beginAtZero: true,

	                grid: { color: '#eef0f4' },

	                ticks: { color: '#6b7280' }
	            }
	        }
	    }
	});
</script>
</body>
</html>

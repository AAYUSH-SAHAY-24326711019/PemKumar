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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

<div class="row">

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

<div class="row mt-4">

<div class="col-md-2">
<div class="card shadow border-0">
<div class="card-body text-center">
<h4>₹<%=String.format("%.0f", revenue)%></h4>
<p>Total Revenue</p>
</div>
</div>
</div>

<div class="col-md-2">
<div class="card shadow border-0">
<div class="card-body text-center">
<h4>₹<%=String.format("%.0f", todayRevenue)%></h4>
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
<h4>₹<%=String.format("%.0f", avgOrderValue)%></h4>
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

            fill: true

        }]
    },

    options: {

        responsive: true,

        plugins: {

            legend: {

                display: true
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

	            ]

	        }]
	    },

	    options: {

	        responsive: true,

	        plugins: {

	            legend: {

	                display: true
	            }
	        },

	        scales: {

	            y: {

	                beginAtZero: true
	            }
	        }
	    }
	});
</script>
</body>
</html>
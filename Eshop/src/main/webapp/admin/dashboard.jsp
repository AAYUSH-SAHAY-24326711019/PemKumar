<%@ page import="com.DAO.ProductDAO"%>
<%@ page import="com.DAO.UserDAO"%>
<%@ page import="com.DB.DBConnect"%>

<%
ProductDAO pdao = new ProductDAO(DBConnect.getConn());
UserDAO udao = new UserDAO(DBConnect.getConn());

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

</head>

<body>

<div class="container mt-4">

<h2 class="text-center mb-4">
Admin Dashboard
</h2>

<div class="row">

<div class="col-md-3">
<div class="card text-center shadow">
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

</div>

</div>

</body>
</html>
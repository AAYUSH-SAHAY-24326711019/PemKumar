<%@ page import="java.sql.*"%>
<%@ page import="com.DB.DBConnect"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Sales Report</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

</head>

<body>

<div class="container mt-4">

<h2>Sales Report</h2>

<form method="get">

<div class="row">

<div class="col-md-4">

<label>From Date</label>

<input type="date"
name="fromDate"
class="form-control"
required>

</div>

<div class="col-md-4">

<label>To Date</label>

<input type="date"
name="toDate"
class="form-control"
required>

</div>

<div class="col-md-4 d-flex align-items-end">

<button
class="btn btn-primary">

Generate Report

</button>

</div>

</div>

</form>

<hr>

<%

String fromDate =
request.getParameter("fromDate");

String toDate =
request.getParameter("toDate");

if(fromDate != null && toDate != null){

Connection conn =
DBConnect.getConn();

PreparedStatement ps =
conn.prepareStatement(

"SELECT COUNT(*) total_orders, " +
"IFNULL(SUM(total_amount),0) revenue " +
"FROM orders " +
"WHERE DATE(order_date) BETWEEN ? AND ?"

);

ps.setString(1, fromDate);
ps.setString(2, toDate);

ResultSet rs =
ps.executeQuery();

if(rs.next()){

%>

<div class="row">

<div class="col-md-6">

<div class="card shadow">

<div class="card-body">

<h3>

<%=rs.getInt("total_orders")%>

</h3>

<p>Total Orders</p>

</div>

</div>

</div>

<div class="col-md-6">

<div class="card shadow">

<div class="card-body">

<h3>

 <%=rs.getDouble("revenue")%>

</h3>

<p>Total Revenue</p>

</div>

</div>

</div>

</div>

<%

}

%>

<h3 class="mt-4">

Products Sold

</h3>

<table class="table table-bordered">

<tr>

<th>Product</th>
<th>Qty Sold</th>
<th>Revenue</th>

</tr>

<%

PreparedStatement ps2 =
conn.prepareStatement(

"SELECT product_name," +
"SUM(quantity) qty," +
"SUM(subtotal) revenue " +
"FROM order_items oi " +
"JOIN orders o ON oi.order_id=o.id " +
"WHERE DATE(o.order_date) BETWEEN ? AND ? " +
"GROUP BY product_name " +
"ORDER BY qty DESC"

);

ps2.setString(1, fromDate);
ps2.setString(2, toDate);

ResultSet rs2 =
ps2.executeQuery();

while(rs2.next()){

%>

<tr>

<td>

<%=rs2.getString("product_name")%>

</td>

<td>

<%=rs2.getInt("qty")%>

</td>

<td>

Rs. <%=rs2.getDouble("revenue")%>

</td>

</tr>

<%

}

%>

</table>

<button
onclick="window.print()"
class="btn btn-success">

Print Report

</button>

<%

}

%>

</div>

</body>
</html>
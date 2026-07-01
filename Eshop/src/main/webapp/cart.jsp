<%@ page import="java.util.*" %>
<%@ page import="com.entity.Cart" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="all_component/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<title>Cart</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<div class="container mt-4">

<h3>Your Cart</h3>

<table class="table table-bordered mt-3">

    <tr>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total</th>
        <th>Action</th>
    </tr>

<%
    List<Cart> cart_list = (List<Cart>) session.getAttribute("cart");

    double grandTotal = 0;

    if(cart_list != null) {

        for(Cart c : cart_list) {

            grandTotal += c.getTotal();
%>

    <tr>

        <td>
            <%=c.getPname()%>
        </td>

        <td>
            ₹<%=c.getPrice()%>
        </td>

        <td>
            <%=c.getQuantity()%>
        </td>

        <td>
            ₹<%=c.getTotal()%>
        </td>

        <td>

            <a href="remove?pid=<%=c.getPid()%>" 
               class="btn btn-danger btn-sm">

               Remove

            </a>

        </td>

    </tr>

<%
        }
    }
%>

    <tr>

        <td colspan="4" class="text-end">

            <b>Total Amount:</b>

        </td>

        <td>

            <b>₹<%=grandTotal%></b>

        </td>

    </tr>

</table>

<!-- 🔥 Checkout Button Updated -->

<a href="checkout.jsp" class="btn btn-success">

    Checkout

</a>

</div>

</body>
</html>
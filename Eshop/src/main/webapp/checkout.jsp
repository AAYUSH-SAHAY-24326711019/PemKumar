<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="all_component/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<title>Checkout</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<div class="container mt-4">

    <h3>Checkout Page</h3>

    <form>

        <div class="mb-3">
            <label>Full Name</label>
            <input type="text" class="form-control">
        </div>

        <div class="mb-3">
            <label>Address</label>
            <textarea class="form-control"></textarea>
        </div>

        <div class="mb-3">
            <label>Phone Number</label>
            <input type="text" class="form-control">
        </div>

        <div class="mb-3">
            <label>Payment Method</label>

            <select class="form-control">

                <option>Cash On Delivery</option>
                <option>UPI</option>
                <option>Card Payment</option>

            </select>
        </div>

        <button class="btn btn-success">
            Place Order
        </button>

    </form>

</div>

</body>
</html>
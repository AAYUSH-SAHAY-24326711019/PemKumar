<!-- <!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="css/style.css">
<title>Order Success</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

</head>
<body>

<div class="container text-center mt-5">

    <h1 class="text-success">

        Payment Successful ✅

    </h1>

    <h3>

        Order Placed Successfully

    </h3>

    <a href="index.jsp"
       class="btn btn-primary mt-3">

        Continue Shopping

    </a>

</div>

</body>
</html> -->

<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>Order Success</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

</head>
<body>

<div class="container mt-5 text-center">

<h1 class="text-success">

Order Placed Successfully

</h1>

<h4>

Invoice Number:

<%=session.getAttribute("invoiceNo")%>

</h4>

<br>

<a href="invoice"
class="btn btn-primary">

Download Invoice

</a>

<a href="index.jsp"
class="btn btn-success">

Continue Shopping

</a>

</div>

</body>
</html>
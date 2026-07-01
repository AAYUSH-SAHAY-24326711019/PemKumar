<%@ page import="com.DAO.ProductDAO"%>
<%@ page import="com.entity.Product"%>
<%@ page import="com.DB.DBConnect"%>

<%
int id = Integer.parseInt(request.getParameter("id"));

ProductDAO dao =
new ProductDAO(DBConnect.getConn());

Product p =
dao.getProductById(id);
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Product Details</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="css/style.css">

</head>

<body>

<%@ include file="all_component/navbar.jsp" %>

<div class="container mt-5">

    <div class="row">

        <div class="col-md-5">

            <img src="img/<%=p.getPhoto()%>"
                 class="img-fluid border rounded product-img">

        </div>

        <div class="col-md-7">

            <h2>
                <%=p.getProductName()%>
            </h2>

            <hr>

            <h3 class="text-success">
                ₹<%=p.getPrice()%>
            </h3>

            <br>

            <p>
                <b>Brand :</b>
                <%=p.getBrand()%>
            </p>

            <p>
                <b>Category :</b>
                <%=p.getCategory()%>
            </p>

            <p>
                <b>Status :</b>
                <%=p.getStatus()%>
            </p>

            <p>
                <b>Description :</b>
            </p>

            <p>
                <%=p.getDescription()%>
            </p>

            <br>

            <!-- FIXED ADD TO CART BUTTON -->

            <a href="<%=request.getContextPath()%>/cart?pid=<%=p.getId()%>&pname=<%=p.getProductName()%>&price=<%=p.getPrice()%>"
               class="btn btn-primary">

                Add To Cart

            </a>

            <a href="index.jsp"
               class="btn btn-secondary">

                Back

            </a>

        </div>

    </div>

</div>

<%@ include file="all_component/footer.jsp" %>

</body>
</html>
<%@ page import="java.util.List" %>
<%@ page import="com.DAO.ProductDAO" %>
<%@ page import="com.entity.Product" %>
<%@ page import="com.DB.DBConnect" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="all_component/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Products</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<div class="container mt-4">

    <h3>Latest Products</h3>

    <div class="row">

    <%
        ProductDAO dao = new ProductDAO(DBConnect.getConn());
        List<Product> list = dao.getAllProducts();

        for(Product p : list) {
    %>

        <div class="col-md-3 mb-4">

            <div class="card">

                <!-- 🔥 FIXED IMAGE PATH -->
                <%-- <img src="${pageContext.request.contextPath}/img/<%=p.getPhoto()%>" 
                     class="card-img-top" 
                     style="height:200px; object-fit:cover;"> --%>
                     
                  <img src="img/<%=p.getPhoto()%>"
					     class="card-img-top product-img"
					     alt="<%=p.getProductName()%>">

                <div class="card-body">

                    <h5 class="card-title"><%=p.getProductName()%></h5>

                    <p class="text-success fw-bold">
                        <%=p.getPrice()%>
                    </p>

                    <a href="cart?pid=<%=p.getId()%>&pname=<%=p.getProductName()%>&price=<%=p.getPrice()%>" 
                       class="btn btn-primary w-100">
                       Add to Cart
                    </a>

                </div>

            </div>

        </div>

    <%
        }
    %>

    </div>

</div>
<%@ include file="../all_component/footer.jsp" %>
</body>
</html>
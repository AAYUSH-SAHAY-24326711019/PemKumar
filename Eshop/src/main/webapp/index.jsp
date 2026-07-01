<%@ page import="java.util.*, com.DAO.ProductDAO, com.entity.Product, com.DB.DBConnect" %>

<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ include file="all_component/navbar.jsp" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>E-Shop</title>

<link rel="stylesheet"
      href="css/style.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">
</head>

<body>

<div class="container mt-4">
	
    <h1 class="mb-2">

        Welcome to E-Shop 🛒

    </h1>

    <p>

        Buy Electronics like Amazon

    </p>

    <hr>

    <h3 class="mb-4">

        Latest Products

    </h3>

    <div class="row">

    <%

        ProductDAO dao =
        new ProductDAO(DBConnect.getConn());

        List<Product> list =
        dao.getAllProducts();

        for(Product p : list) {

    %>

        <div class="col-md-3 mb-4">

            <div class="card h-100 shadow-sm">

                <!-- PRODUCT IMAGE -->

			<a href="product_details.jsp?id=<%=p.getId()%>">
			
			    <img src="img/<%=p.getPhoto()%>"
			         class="card-img-top product-img">
			
			</a>
			
			<!-- PRODUCT BODY -->
			
			<div class="card-body text-center">
			
			    <a href="product_details.jsp?id=<%=p.getId()%>"
			       style="text-decoration:none;color:black;">
			
			        <h5 class="card-title">
			
			            <%=p.getProductName()%>
			
			        </h5>

    			</a>

                    <p>

                        Brand: <%=p.getBrand()%>

                    </p>

                    <p class="text-success fw-bold">

                        <%=p.getPrice()%>

                    </p>

                    <!-- ADD TO CART -->

                    <a href="cart?pid=<%=p.getId()%>&pname=<%=p.getProductName()%>&price=<%=p.getPrice()%>"
                       class="btn btn-primary w-100">

                        Add To Cart

                    </a>

                    <!-- ONLY ADMIN CAN SEE -->

                    <%

                    String admin =
                    (String)session.getAttribute("admin");

                    if(admin != null) {

                    %>

                    <a href="admin/edit_product.jsp?id=<%=p.getId()%>"
                       class="btn btn-warning w-100 mt-2">

                        Edit Product

                    </a>

                    <%

                    }

                    %>

                </div>

            </div>

        </div>

    <%

        }

    %>

    </div>

</div>
	<%@ include file="all_component/footer.jsp" %>

</body>

</html>
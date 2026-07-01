<%@ page import="java.util.*,com.DAO.ProductDAO,com.entity.Product,com.DB.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Products</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

<link rel="stylesheet"
      href="../css/style.css">

</head>
<body>

<div class="container mt-5">

    <h2 class="text-center mb-4">
        All Products
    </h2>

    <table class="table table-bordered table-hover shadow">

        <thead class="table-dark">

            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Action</th>
            </
            

        </thead>

        <tbody>

        <%
        ProductDAO dao =
        new ProductDAO(DBConnect.getConn());

        List<Product> list =
        dao.getAllProducts();

        for(Product p : list){
        %>

        <tr>

            <td><%=p.getId()%></td>

            <td><%=p.getProductName()%></td>

            <td><%=p.getPrice()%></td>

            <td>

                <a href="edit_product.jsp?id=<%=p.getId()%>"
                   class="btn btn-warning btn-sm">

                   Edit

                </a>

            </td>

        </tr>

        <%
        }
        %>

        </tbody>
    </table>
</div>

<%@ include file="../all_component/footer.jsp" %>


</body>
</html>
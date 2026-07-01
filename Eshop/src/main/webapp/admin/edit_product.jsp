<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.DAO.ProductDAO"%>
<%@ page import="com.entity.Product"%>
<%@ page import="com.DB.DBConnect"%>

<%
int id = Integer.parseInt(request.getParameter("id"));

ProductDAO dao =
new ProductDAO(DBConnect.getConn());

Product p = dao.getProductById(id);

if(p == null){
    out.println("<h3>Product Not Found</h3>");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Product</title>

<link rel="stylesheet"
      href="../css/style.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <div class="row">

        <div class="col-md-6 offset-md-3">

            <div class="card p-4">

                <h3 class="text-center mb-4">

                    Edit Product

                </h3>

                <form action="<%=request.getContextPath()%>/edit_product"
                      method="post">

                    <input type="hidden"
                           name="id"
                           value="<%=p.getId()%>">

                    <div class="mb-3">

                        <label>Product Name</label>

                        <input type="text"
                               name="pname"
                               class="form-control"
                               value="<%=p.getProductName()%>">

                    </div>

                    <div class="mb-3">

                        <label>Brand</label>

                        <input type="text"
                               name="brand"
                               class="form-control"
                               value="<%=p.getBrand()%>">

                    </div>

                    <div class="mb-3">

                        <label>Price</label>

                        <input type="text"
                               name="price"
                               class="form-control"
                               value="<%=p.getPrice()%>">

                    </div>

                    <div class="mb-3">

                        <label>Category</label>

                        <input type="text"
                               name="category"
                               class="form-control"
                               value="<%=p.getCategory()%>">

                    </div>

                    <div class="mb-3">

                        <label>Status</label>

                        <input type="text"
                               name="status"
                               class="form-control"
                               value="<%=p.getStatus()%>">

                    </div>

                    <div class="mb-3">

                        <label>Photo Name</label>

                        <input type="text"
                               name="photo"
                               class="form-control"
                               value="<%=p.getPhoto()%>">

                    </div>

                    <div class="mb-3">

                        <label>Description</label>

                        <textarea name="description"
                                  class="form-control"
                                  rows="4"><%=p.getDescription()%></textarea>

                    </div>

                    <button type="submit"
                            class="btn btn-success w-100">

                        Update Product

                    </button>

                </form>

            </div>

        </div>

    </div>

</div>

</body>

</html>
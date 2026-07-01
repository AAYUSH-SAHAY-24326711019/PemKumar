<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../all_component/navbar.jsp" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Product</title>
<link rel="stylesheet" href="../css/style.css">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<div class="container mt-4">

    <div class="row">

        <div class="col-md-6 offset-md-3">

            <div class="card">

                <div class="card-body">

                    <h3 class="text-center">Add Product</h3>

                    <!-- 🔥 IMPORTANT FORM -->

                    <form action="<%=request.getContextPath()%>/add_product" method="post">

                        <div class="mb-3">

                            <label>Product Name</label>

                            <input type="text" 
                                   name="pname" 
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Brand</label>

                            <input type="text" 
                                   name="brand" 
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Price</label>

                            <input type="number" 
                                   name="price" 
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Category</label>

                            <input type="text" 
                                   name="category" 
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Status</label>

                            <select name="status" class="form-control">

                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>

                            </select>

                        </div>

                        <div class="mb-3">

                            <label>Photo Name</label>

                            <input type="text" 
                                   name="photo" 
                                   class="form-control"
                                   placeholder="iphone.jpg"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Description</label>

                            <textarea name="description" 
                                      class="form-control"
                                      rows="4"></textarea>

                        </div>

                        <div class="text-center">

                            <button type="submit" 
                                    class="btn btn-primary">

                                Add Product

                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>
</div>

<%@ include file="../all_component/footer.jsp" %>

</body>
</html>
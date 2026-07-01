<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Register</title>
<link rel="stylesheet" href="css/style.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <div class="row">

        <div class="col-md-4 offset-md-4">

            <div class="card">

                <div class="card-body">

                    <h3 class="text-center">

                        User Register

                    </h3>

                    <form action="<%=request.getContextPath()%>/register"
                          method="post">

                        <div class="mb-3">

                            <label>Name</label>

                            <input type="text"
                                   name="name"
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Email</label>

                            <input type="email"
                                   name="email"
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Phone</label>

                            <input type="text"
                                   name="phno"
                                   class="form-control"
                                   required>

                        </div>

                        <div class="mb-3">

                            <label>Password</label>

                            <input type="password"
                                   name="password"
                                   class="form-control"
                                   required>

                        </div>

                        <button type="submit"
                                class="btn btn-primary w-100">

                            Register

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

</body>
</html>
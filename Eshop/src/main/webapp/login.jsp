<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Login</title>

<link rel="stylesheet"
      href="css/style.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <div class="row">

        <div class="col-md-4 offset-md-4">

            <div class="card p-4">

                <h3 class="text-center">

                    User Login

                </h3>

                <form action="<%=request.getContextPath()%>/login"
                      method="post">

                    <input type="email"
                           name="email"
                           class="form-control mt-3"
                           placeholder="Enter Email">

                    <input type="password"
                           name="password"
                           class="form-control mt-3"
                           placeholder="Enter Password">

                    <button class="btn btn-primary mt-3 w-100">

                        Login

                    </button>

                </form>

            </div>

        </div>

    </div>

</div>

</body>

</html>
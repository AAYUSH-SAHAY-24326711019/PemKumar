<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.entity.User" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<link rel="stylesheet"
      href="<%=request.getContextPath()%>/css/style.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet">

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <div class="container-fluid">

        <a class="navbar-brand"
           href="<%=request.getContextPath()%>/index.jsp">

            E-Shop

        </a>

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/index.jsp">

                        Home

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/cart.jsp">

                        Cart

                    </a>

                </li>

                <%

                User userobj =
                (User)session.getAttribute("userobj");

                if(userobj == null) {

                %>

                <!-- BEFORE LOGIN -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/login.jsp">

                        Login

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/register.jsp">

                        Register

                    </a>

                </li>

                <%

                } else {

                %>

                <!-- AFTER LOGIN -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="#">

                        Welcome <%=userobj.getName()%>

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/logout">

                        Logout

                    </a>

                </li>

                <%

                String admin =
                (String)session.getAttribute("admin");

                if(admin != null) {

                %>

                <!-- ADMIN PANEL -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%=request.getContextPath()%>/admin/dashboard.jsp">

                        Admin

                    </a>

                </li>

                <%

                }

                }

                %>

            </ul>

        </div>

    </div>

</nav>

</body>

</html>
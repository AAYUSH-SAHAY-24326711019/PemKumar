//package com.user.servlet;
//
//import java.io.IOException;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import com.DB.DBConnect;
//import com.DAO.UserDAO;
//import com.entity.User;
//
//@WebServlet("/register")
//public class RegisterServlet extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//
//    @Override
//    protected void doPost(HttpServletRequest request,
//                          HttpServletResponse response)
//            throws ServletException, IOException {
//
//        try {
//
//            String name = request.getParameter("name");
//            String email = request.getParameter("email");
//            String phno = request.getParameter("phno");
//            String password = request.getParameter("password");
//
//            User us = new User(name, email, phno, password);
//
//            UserDAO dao = new UserDAO(DBConnect.getConn());
//
//            boolean f = dao.userRegister(us);
//
//            if (f) {
//
//                response.sendRedirect("login.jsp");
//
//            } else {
//
//                response.getWriter().println("Registration Failed");
//
//            }
//
//        } catch (Exception e) {
//
//            e.printStackTrace();
//
//        }
//    }
//}


package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.DB.DBConnect;
import com.DAO.UserDAO;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String name = request.getParameter("name");

            String email = request.getParameter("email");

            String phno = request.getParameter("phno");

            String password = request.getParameter("password");

            // ADMIN EMAIL BLOCK

            if(email.equals("prem@gmail.com")) {

                response.getWriter().println(
                        "Admin Cannot Register Here");

                return;
            }

            User us = new User(name,
                               email,
                               phno,
                               password);

            UserDAO dao = new UserDAO(DBConnect.getConn());

            boolean f = dao.userRegister(us);

            if (f) {

                response.sendRedirect("login.jsp");

            } else {

                response.getWriter().println(
                        "Registration Failed");

            }

        } catch (Exception e) {

            e.printStackTrace();

        }
    }
}
package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAO;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String email =
            request.getParameter("email");

            String password =
            request.getParameter("password");

            UserDAO dao =
            new UserDAO(DBConnect.getConn());

            User u =
            dao.login(email, password);

            if(u != null) {

                HttpSession session =
                request.getSession();

                session.setAttribute(
                "userobj", u);

                // ADMIN CHECK

                if(email.equals(
                "admin@gmail.com")) {
//                "pk2335301@gmail.com")) {

                    session.setAttribute(
                    "admin", "true");
                }

                response.sendRedirect(
                "index.jsp");

            } else {

                response.getWriter().println(
                "Invalid Login");
            }

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}
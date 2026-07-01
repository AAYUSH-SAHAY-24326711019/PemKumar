package com.user.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.entity.Cart;

@WebServlet("/remove")
public class RemoveCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int pid = Integer.parseInt(request.getParameter("pid"));

        HttpSession session = request.getSession();

        List<Cart> cart = (List<Cart>) session.getAttribute("cart");

        if (cart != null) {

            cart.removeIf(c -> c.getPid() == pid);

        }

        response.sendRedirect("cart.jsp");
    }
}
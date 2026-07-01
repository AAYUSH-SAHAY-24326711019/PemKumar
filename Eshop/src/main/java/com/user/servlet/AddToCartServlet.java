package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import com.entity.Cart;

@WebServlet("/cart")
public class AddToCartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int pid = Integer.parseInt(request.getParameter("pid"));
        String pname = request.getParameter("pname");
        double price = Double.parseDouble(request.getParameter("price"));

        HttpSession session = request.getSession();

        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart");

        if (cartList == null) {
            cartList = new ArrayList<Cart>();
        }

        Cart c = new Cart(pid, pname, price, 1);
        cartList.add(c);

        session.setAttribute("cart", cartList);

        response.sendRedirect("product.jsp");
    }
}
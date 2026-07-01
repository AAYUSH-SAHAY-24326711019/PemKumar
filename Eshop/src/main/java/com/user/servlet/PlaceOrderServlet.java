package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import com.DAO.OrderDAO;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Order;
import com.entity.OrderItem;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();

            User user =
            (User) session.getAttribute("userobj");

            if(user == null) {

                response.sendRedirect("login.jsp");
                return;
            }

            ArrayList<Cart> cart =
            (ArrayList<Cart>) session.getAttribute("cart");

            if(cart == null || cart.isEmpty()) {

                response.sendRedirect("cart.jsp");
                return;
            }

            String address =
            request.getParameter("address");

            String paymentMethod =
            request.getParameter("paymentMethod");

            double grandTotal = 0;

            for(Cart c : cart) {

                grandTotal += c.getTotal();
            }

            String invoiceNo =
            "INV-" +
            UUID.randomUUID()
            .toString()
            .substring(0,8)
            .toUpperCase();

            Order order = new Order();

            order.setInvoiceNo(invoiceNo);
            order.setUserId(user.getId());
            order.setCustomerName(user.getName());
            order.setPhone(user.getPhno());
            order.setAddress(address);
            order.setPaymentMethod(paymentMethod);
            order.setTotalAmount(grandTotal);
            order.setStatus("PLACED");

            OrderDAO dao =
            new OrderDAO(DBConnect.getConn());

            int orderId =
            dao.saveOrder(order);

            for(Cart c : cart) {

                OrderItem item =
                new OrderItem();

                item.setOrderId(orderId);
                item.setProductId(c.getPid());
                item.setProductName(c.getPname());
                item.setQuantity(c.getQuantity());
                item.setUnitPrice(c.getPrice());
                item.setSubtotal(c.getTotal());

                dao.saveOrderItem(item);
            }

            session.setAttribute(
            "lastOrderId",
            orderId);

            session.setAttribute(
            "invoiceNo",
            invoiceNo);

            cart.clear();

            response.sendRedirect(
            "order_success.jsp");

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}
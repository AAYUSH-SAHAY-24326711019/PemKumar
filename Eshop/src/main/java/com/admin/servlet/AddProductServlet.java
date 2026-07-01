package com.admin.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.DAO.ProductDAO;
import com.DB.DBConnect;
import com.entity.Product;

@WebServlet("/add_product")
public class AddProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String pname = request.getParameter("pname");
            String brand = request.getParameter("brand");

            double price = Double.parseDouble(request.getParameter("price"));

            String category = request.getParameter("category");
            String status = request.getParameter("status");
            String photo = request.getParameter("photo");
            String description = request.getParameter("description");

            Product p = new Product(
                    pname,
                    brand,
                    price,
                    category,
                    status,
                    photo,
                    description
            );

            ProductDAO dao = new ProductDAO(DBConnect.getConn());

            boolean f = dao.addProduct(p);

            if(f) {

                response.sendRedirect("product.jsp");

            } else {

                response.getWriter().println("Product Add Failed");

            }

        } catch(Exception e) {

            e.printStackTrace();

        }
    }
}
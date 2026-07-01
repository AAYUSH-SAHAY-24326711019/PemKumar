package com.admin.servlet;

import java.io.IOException;

import com.DAO.ProductDAO;
import com.DB.DBConnect;
import com.entity.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/edit_product")
public class EditProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id =
            Integer.parseInt(request.getParameter("id"));

            String pname =
            request.getParameter("pname");

            String brand =
            request.getParameter("brand");

            double price =
            Double.parseDouble(
            request.getParameter("price"));

            String category =
            request.getParameter("category");

            String status =
            request.getParameter("status");

            String photo =
            request.getParameter("photo");

            String description =
            request.getParameter("description");

            Product p = new Product();

            p.setId(id);
            p.setProductName(pname);
            p.setBrand(brand);
            p.setPrice(price);
            p.setCategory(category);
            p.setStatus(status);
            p.setPhoto(photo);
            p.setDescription(description);

            ProductDAO dao =
            new ProductDAO(DBConnect.getConn());

            boolean f =
            dao.updateProduct(p);

            if(f) {

                response.sendRedirect(
                "admin/all_products.jsp");

            } else {

                response.getWriter().println(
                "Product Update Failed");
            }

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}
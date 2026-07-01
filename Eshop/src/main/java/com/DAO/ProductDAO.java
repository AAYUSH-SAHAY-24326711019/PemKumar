
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Product;

public class ProductDAO {

    private Connection conn;

    public ProductDAO(Connection conn) {

        this.conn = conn;
    }

    // =========================
    // ADD PRODUCT
    // =========================

    public boolean addProduct(Product p) {

        boolean f = false;

        try {

            String sql =
            "insert into products(product_name,brand,price,category,status,photo,description) values(?,?,?,?,?,?,?)";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            ps.setString(1, p.getProductName());
            ps.setString(2, p.getBrand());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getCategory());
            ps.setString(5, p.getStatus());
            ps.setString(6, p.getPhoto());
            ps.setString(7, p.getDescription());

            int i = ps.executeUpdate();

            if(i > 0) {

                f = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return f;
    }

    // =========================
    // GET ALL PRODUCTS
    // =========================

    public List<Product> getAllProducts() {

        List<Product> list =
        new ArrayList<Product>();

        try {

            String sql =
            "select * from products";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                Product p =
                new Product();

                p.setId(rs.getInt("id"));

                p.setProductName(
                rs.getString("product_name"));

                p.setBrand(
                rs.getString("brand"));

                p.setPrice(
                rs.getDouble("price"));

                p.setCategory(
                rs.getString("category"));

                p.setStatus(
                rs.getString("status"));

                p.setPhoto(
                rs.getString("photo"));

                p.setDescription(
                rs.getString("description"));

                list.add(p);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // =========================
    // GET PRODUCT BY ID
    // =========================

    public Product getProductById(int id) {

        Product p = null;

        try {

            String sql =
            "select * from products where id=?";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                p = new Product();

                p.setId(rs.getInt("id"));

                p.setProductName(
                rs.getString("product_name"));

                p.setBrand(
                rs.getString("brand"));

                p.setPrice(
                rs.getDouble("price"));

                p.setCategory(
                rs.getString("category"));

                p.setStatus(
                rs.getString("status"));

                p.setPhoto(
                rs.getString("photo"));

                p.setDescription(
                rs.getString("description"));
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return p;
    }

    // =========================
    // UPDATE PRODUCT
    // =========================

    public boolean updateProduct(Product p) {

        boolean f = false;

        try {

            String sql =
            "update products set product_name=?, brand=?, price=?, category=?, status=?, photo=?, description=? where id=?";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            ps.setString(1, p.getProductName());

            ps.setString(2, p.getBrand());

            ps.setDouble(3, p.getPrice());

            ps.setString(4, p.getCategory());

            ps.setString(5, p.getStatus());

            ps.setString(6, p.getPhoto());

            ps.setString(7, p.getDescription());

            ps.setInt(8, p.getId());

            int i = ps.executeUpdate();

            if(i > 0) {

                f = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return f;
    }
    
    public int getProductCount() {

        int count = 0;

        try {

            String sql = "select count(*) from products";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                count = rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return count;
    }

    public int getActiveProductCount() {

        int count = 0;

        try {

            String sql = "select count(*) from products where status='Active'";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                count = rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return count;
    }

    public int getCategoryCount() {

        int count = 0;

        try {

            String sql = "select count(distinct category) from products";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                count = rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return count;
    }
    
    public int getInactiveProductCount() {

        int count = 0;

        try {

            String sql =
            "select count(*) from products where status='Inactive'";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()) {

                count = rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return count;
    }
}
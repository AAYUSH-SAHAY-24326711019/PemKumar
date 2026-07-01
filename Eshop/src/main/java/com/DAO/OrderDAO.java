package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.entity.Order;
import com.entity.OrderItem;

import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    private Connection conn;

    public OrderDAO(Connection conn) {
        this.conn = conn;
    }

    public int saveOrder(Order o) {

        int orderId = 0;

        try {

            String sql =
            "insert into orders(invoice_no,user_id,customer_name,phone,address,payment_method,total_amount,status) values(?,?,?,?,?,?,?,?)";

            PreparedStatement ps =
            conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, o.getInvoiceNo());
            ps.setInt(2, o.getUserId());
            ps.setString(3, o.getCustomerName());
            ps.setString(4, o.getPhone());
            ps.setString(5, o.getAddress());
            ps.setString(6, o.getPaymentMethod());
            ps.setDouble(7, o.getTotalAmount());
            ps.setString(8, o.getStatus());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            if(rs.next()) {

                orderId = rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return orderId;
    }

    public boolean saveOrderItem(OrderItem item) {

        boolean f = false;

        try {

            String sql =
            "insert into order_items(order_id,product_id,product_name,quantity,unit_price,subtotal) values(?,?,?,?,?,?)";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getProductId());
            ps.setString(3, item.getProductName());
            ps.setInt(4, item.getQuantity());
            ps.setDouble(5, item.getUnitPrice());
            ps.setDouble(6, item.getSubtotal());

            int i = ps.executeUpdate();

            if(i > 0) {

                f = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return f;
    }
    public double getTotalRevenue() {

        double revenue = 0;

        try {

            String sql =
            "select ifnull(sum(total_amount),0) from orders";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()) {

                revenue = rs.getDouble(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return revenue;
    }

    public int getTotalOrders() {

        int count = 0;

        try {

            String sql =
            "select count(*) from orders";

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

    public int getTodayOrders() {

        int count = 0;

        try {

            String sql =
            "select count(*) from orders where date(order_date)=curdate()";

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
    
    public ResultSet getTopProducts() {

        try {

            String sql =
            "select product_name,sum(quantity) qty " +
            "from order_items " +
            "group by product_name " +
            "order by qty desc limit 5";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            return ps.executeQuery();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return null;
    }
    public double getTodayRevenue() {

        double revenue = 0;

        try {

            String sql =
            "select ifnull(sum(total_amount),0) from orders where date(order_date)=curdate()";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()) {

                revenue = rs.getDouble(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return revenue;
    }

    public int getProductsSold() {

        int count = 0;

        try {

            String sql =
            "select ifnull(sum(quantity),0) from order_items";

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

    public double getAverageOrderValue() {

        double avg = 0;

        try {

            String sql =
            "select ifnull(avg(total_amount),0) from orders";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()) {

                avg = rs.getDouble(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return avg;
    }
    public ResultSet getLast7DaysSales() {

        try {

            String sql =
            "SELECT DATE(order_date) sale_date, " +
            "SUM(total_amount) revenue " +
            "FROM orders " +
            "WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) " +
            "GROUP BY DATE(order_date) " +
            "ORDER BY sale_date";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            return ps.executeQuery();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return null;
    }
    public ResultSet getTop5ProductsChart() {

        try {

            String sql =
            "SELECT product_name, " +
            "SUM(quantity) qty " +
            "FROM order_items " +
            "GROUP BY product_name " +
            "ORDER BY qty DESC " +
            "LIMIT 5";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            return ps.executeQuery();

        } catch(Exception e) {

            e.printStackTrace();
        }

        return null;
    }
    
    public Order getOrderById(int orderId) {

        Order o = null;

        try {

            String sql =
            "select * from orders where id=?";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            ps.setInt(1, orderId);

            ResultSet rs =
            ps.executeQuery();

            if(rs.next()) {

                o = new Order();

                o.setId(rs.getInt("id"));
                o.setInvoiceNo(rs.getString("invoice_no"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setPhone(rs.getString("phone"));
                o.setAddress(rs.getString("address"));
                o.setPaymentMethod(rs.getString("payment_method"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setStatus(rs.getString("status"));
                o.setOrderDate(rs.getTimestamp("order_date"));
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return o;
    }
    
    public List<OrderItem> getOrderItems(int orderId) {

        List<OrderItem> list =
        new ArrayList<>();

        try {

            String sql =
            "select * from order_items where order_id=?";

            PreparedStatement ps =
            conn.prepareStatement(sql);

            ps.setInt(1, orderId);

            ResultSet rs =
            ps.executeQuery();

            while(rs.next()) {

                OrderItem item =
                new OrderItem();

                item.setId(rs.getInt("id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setProductId(rs.getInt("product_id"));
                item.setProductName(rs.getString("product_name"));
                item.setQuantity(rs.getInt("quantity"));
                item.setUnitPrice(rs.getDouble("unit_price"));
                item.setSubtotal(rs.getDouble("subtotal"));

                list.add(item);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return list;
    }
}
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {

    private Connection conn;

    public UserDAO(Connection conn) {
        super();
        this.conn = conn;
    }

    // 🔥 Register Method

    public boolean userRegister(User us) {

        boolean f = false;

        try {

            String sql = "insert into users(name,email,phno,password) values(?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setString(4, us.getPassword());

            int i = ps.executeUpdate();

            if (i == 1) {

                f = true;

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return f;
    }

    // 🔥 Login Method

    public User login(String email, String password) {

        User u = null;

        try {

            String sql = "select * from users where email=? and password=?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                u = new User();

                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPhno(rs.getString("phno"));
                u.setPassword(rs.getString("password"));

            }

        } catch(Exception e) {

            e.printStackTrace();

        }

        return u;
    }
    public int getUserCount() {

        int count = 0;

        try {

            String sql = "select count(*) from users";

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
}
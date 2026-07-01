package com.entity;

public class User {

    private int id;
    private String name;
    private String email;
    private String phno;
    private String password;

    public User() {
        super();
    }

    public User(String name, String email, String phno, String password) {
        super();
        this.name = name;
        this.email = email;
        this.phno = phno;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhno() {
        return phno;
    }

    public void setPhno(String phno) {
        this.phno = phno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
package com.entity;

public class Cart {

    private int pid;
    private String pname;
    private double price;
    private int quantity;
    private double total;

    public Cart() {}

    public Cart(int pid, String pname, double price, int quantity) {
        this.pid = pid;
        this.pname = pname;
        this.price = price;
        this.quantity = quantity;
        this.total = price * quantity;
    }

    public int getPid() { return pid; }
    public void setPid(int pid) { this.pid = pid; }

    public String getPname() { return pname; }
    public void setPname(String pname) { this.pname = pname; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }
}
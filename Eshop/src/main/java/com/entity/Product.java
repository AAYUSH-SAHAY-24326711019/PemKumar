package com.entity;

public class Product {

    private int id;
    private String productName;
    private String brand;
    private double price;
    private String category;
    private String status;
    private String photo;
    private String description;

    public Product() {
        super();
    }

    public Product(String productName, String brand, double price, String category,
                   String status, String photo, String description) {
        super();
        this.productName = productName;
        this.brand = brand;
        this.price = price;
        this.category = category;
        this.status = status;
        this.photo = photo;
        this.description = description;
    }

    // 🔥 GETTERS & SETTERS

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
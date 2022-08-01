/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Pham Minh Giang
 */
public class OrderDetailS {
    int orderID;
    Product product;
    int quantity;
    double price;

    public OrderDetailS() {
    }

    public OrderDetailS(int orderID, Product product, int quantity, double price) {
        this.orderID = orderID;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "OrderDetailS{" + "orderID=" + orderID + ", product=" + product + ", price=" + price + ", quantity=" + quantity + '}';
    }

}

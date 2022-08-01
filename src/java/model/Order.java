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
public class Order {
    private int orderID;
    private int accountID;
    private String date;
    private String name;
    private String address;
    private String phone;
    private String email;
    private double money;
    private String note;
    private boolean status;

    public Order() {
    }

    public Order(int orderID, int accountID, String date, String name, String address, String phone, String email, double money, String note, boolean status) {
        this.orderID = orderID;
        this.accountID = accountID;
        this.date = date;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.money = money;
        this.note = note;
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", accountID=" + accountID + ", date=" + date + ", name=" + name + ", address=" + address + ", phone=" + phone + ", email=" + email + ", money=" + money + ", note=" + note + ", status=" + status + '}';
    }
    
    
}

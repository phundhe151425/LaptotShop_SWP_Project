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
public class Product {
    private int id;
    private String name;
    private double price;
    private float discount;
    private double saleprice;
    private int quantity;
    private String imgURL;
    private String description;
    private Brand brand;
    private Category category;
    private OperatingSystem os;
    private RAM ram;
    private CPU cpu;
    private Display display;
    private Capacity capacity;
    private Card card;
    private String createdate;
    private boolean status;
    private String modifydate;
   
    public Product() {
 
    }

    public Product(int id, String name, double price, float discount, double saleprice, int quantity, String imgURL, String description, Brand brand, Category category, OperatingSystem os, RAM ram, CPU cpu, Display display, Capacity capacity, Card card, String createdate, boolean status, String modifydate) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.saleprice = saleprice;
        this.quantity = quantity;
        this.imgURL = imgURL;
        this.description = description;
        this.brand = brand;
        this.category = category;
        this.os = os;
        this.ram = ram;
        this.cpu = cpu;
        this.display = display;
        this.capacity = capacity;
        this.card = card;
        this.createdate = createdate;
        this.status = status;
        this.modifydate = modifydate;
    }

    

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }



    public double getSaleprice() {
        return saleprice;
    }

    public void setSaleprice(double saleprice) {
        this.saleprice = saleprice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public OperatingSystem getOs() {
        return os;
    }

    public void setOs(OperatingSystem os) {
        this.os = os;
    }

    public RAM getRam() {
        return ram;
    }

    public void setRam(RAM ram) {
        this.ram = ram;
    }

    public CPU getCpu() {
        return cpu;
    }

    public void setCpu(CPU cpu) {
        this.cpu = cpu;
    }

    public Display getDisplay() {
        return display;
    }

    public void setDisplay(Display display) {
        this.display = display;
    }

    public Capacity getCapacity() {
        return capacity;
    }

    public void setCapacity(Capacity capacity) {
        this.capacity = capacity;
    }

    public Card getCard() {
        return card;
    }

    public void setCard(Card card) {
        this.card = card;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getModifydate() {
        return modifydate;
    }

    public void setModifydate(String modifydate) {
        this.modifydate = modifydate;
    }

    
    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", discount=" + discount + ", saleprice=" + saleprice + ", quantity=" + quantity + ", imgURL=" + imgURL + ", description=" + description + ", brand=" + brand + ", category=" + category + ", os=" + os + ", ram=" + ram + ", cpu=" + cpu + ", display=" + display + ", capacity=" + capacity + ", card=" + card + ", createdate=" + createdate + ", status=" + status + ", modifydate=" + modifydate + '}';
    }

   
}

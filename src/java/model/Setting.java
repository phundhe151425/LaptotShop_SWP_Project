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
public class Setting {

    private int id;
    private String type;
    private String value;
    private String order;
    private String description;
    private boolean status;

    public Setting() {
    }

    public Setting(int id, String type, String value, String order, String description, boolean status) {
        this.id = id;
        this.type = type;
        this.value = value;
        this.order = order;
        this.description = description;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Setting{" + "id=" + id + ", type=" + type + ", value=" + value + ", order=" + order + ", description=" + description + ", status=" + status + '}';
    }

    

}

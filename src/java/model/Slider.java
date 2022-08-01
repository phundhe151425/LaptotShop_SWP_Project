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
public class Slider {
    private int id;
    private String title;
    private String content;
    private String imgURL;
    private boolean status;

    public Slider() {
    }

    public Slider(int id, String title, String content, String imgURL, boolean status) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.imgURL = imgURL;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Slider{" + "id=" + id + ", title=" + title + ", content=" + content + ", imgURL=" + imgURL + ", status=" + status + '}';
    }
    
}

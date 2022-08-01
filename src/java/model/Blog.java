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
public class Blog {
    private int id;
    private String imgURL;
    private String  authorName;
    private String title;
    private String content;
    private String createDate;
    private String modyfieDate;
    private boolean status;

    public Blog() {
    }

    public Blog(int id, String imgURL, String authorName, String title, String content, String createDate, String modyfieDate, boolean status) {
        this.id = id;
        this.imgURL = imgURL;
        this.authorName = authorName;
        this.title = title;
        this.content = content;
        this.createDate = createDate;
        this.modyfieDate = modyfieDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
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

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getModyfieDate() {
        return modyfieDate;
    }

    public void setModyfieDate(String modyfieDate) {
        this.modyfieDate = modyfieDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Blog{" + "id=" + id + ", imgURL=" + imgURL + ", authorName=" + authorName + ", title=" + title + ", content=" + content + ", createDate=" + createDate + ", modyfieDate=" + modyfieDate + ", status=" + status + '}';
    }
    
    
}

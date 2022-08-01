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
public class Feedback {
    private int feedbackID;
    private int productID;
    private Account account;
    private String content;
    private String createDate;
    private boolean status;

    public Feedback() {
    }

    public Feedback(int feedbackID, int productID, Account account, String content, String createDate, boolean status) {
        this.feedbackID = feedbackID;
        this.productID = productID;
        this.account = account;
        this.content = content;
        this.createDate = createDate;
        this.status = status;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Feedback{" + "feedbackID=" + feedbackID + ", productID=" + productID + ", account=" + account + ", content=" + content + ", createDate=" + createDate + ", status=" + status + '}';
    }

    
    
}

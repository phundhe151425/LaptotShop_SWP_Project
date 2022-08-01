/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import model.Account;
import model.Feedback;
import model.Feedbacks;
import model.Product;

/**
 *
 * @author Pham Minh Giang
 */
public class FeedbackDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public boolean checkFeedback(int accountID, int productID) {
        String sql = "select * from [Order] o \n"
                + "join OrderDetail od on o.Order_ID = od.Order_ID\n"
                + "where o.Account_ID = " + accountID + " and od.Product_ID = " + productID;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public List<Feedback> getAllFeedbackByProID(int id) {
        List<Feedback> list = new ArrayList<>();
        String sql = "select * from Feedback f\n"
                + "join Account a on f.Account_ID = a.Account_ID\n"
                + "where f.Product_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccountID(rs.getInt(3));
                a.setName(rs.getString(11));
                list.add(new Feedback(rs.getInt(1), rs.getInt(2), a,
                        rs.getString(4), rs.getString(6), rs.getBoolean(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addFeedback(Feedback f) {
        String sql = "insert into Feedback values(?, ?, ?, null, ?, 1)";
        LocalDate curdate = java.time.LocalDate.now();
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, f.getProductID());
            ps.setInt(2, f.getAccount().getAccountID());
            ps.setString(3, f.getContent());
            ps.setString(4, curdate.toString());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        FeedbackDAO f = new FeedbackDAO();
        System.out.println(f.fulltextSearch("asus"));
    }

    //phu
    public List<Feedbacks> getAllFeedbacks() {
        List<Feedbacks> list = new ArrayList<>();
        String sql = "select fb.Feedback_ID,fb.Product_ID, p.Product_Name,a.Account_ID, a.Name,a.Phone, fb.Content, fb.CreateDate, fb.Feedback_Status from Feedback fb\n"
                + "join Product p on fb.Product_ID=p.Product_ID\n"
                + "join Account a on a.Account_ID=fb.Account_ID";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(2));
                p.setName(rs.getString(3));
                Account a = new Account();
                a.setAccountID(rs.getInt(4));
                a.setName(rs.getString(5));
                a.setPhone(rs.getString(6));
                list.add(new Feedbacks(rs.getInt(1),
                        p,
                        a,
                        rs.getString(7),
                        rs.getString(8),
                        rs.getBoolean(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalFeedback() {
        int total = 0;
        String sql = "select count(*) from Feedback";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return total;
    }

    public List<Feedbacks> listPageFeedback(int index) {
        List<Feedbacks> list = new ArrayList<>();
        String sql = "select fb.Feedback_ID,fb.Product_ID, p.Product_Name,a.Account_ID, a.Name, a.Phone, fb.Content, fb.CreateDate, fb.Feedback_Status from Feedback fb\n"
                + "join Product p on fb.Product_ID=p.Product_ID\n"
                + "join Account a on a.Account_ID=fb.Account_ID\n"
                + "order by fb.Feedback_ID offset ? row fetch next 9 rows only";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(2));
                p.setName(rs.getString(3));
                Account a = new Account();
                a.setAccountID(rs.getInt(4));
                a.setName(rs.getString(5));
                a.setPhone(rs.getString(6));
                list.add(new Feedbacks(rs.getInt(1),
                        p,
                        a,
                        rs.getString(7),
                        rs.getString(8),
                        rs.getBoolean(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updatedStatus(String id, String status) {
        String sql = "UPDATE [dbo].[Feedback]\n"
                + "   SET [Feedback_Status] = " + status + "\n"
                + "  WHERE Feedback_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
//            ps.setBoolean(1, status);
//            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Feedbacks> sortFb(String choice, List<Feedbacks> list) {
        Collections.sort(list, (Feedbacks fb1, Feedbacks fb2) -> {
            if (choice.equals("1")) {
                return fb1.getProduct().getId() > fb2.getProduct().getId() ? 1 : -1;
            }
            if (choice.equals("2")) {
                return fb1.getProduct().getId() > fb2.getProduct().getId() ? -1 : 1;
            }
            if (choice.equals("3")) {
                return fb1.getCreatedDate().compareTo(fb2.getCreatedDate());
            }
            if (choice.equals("4")) {
                return fb2.getCreatedDate().compareTo(fb1.getCreatedDate());
            }
            return fb1.getContent().compareTo(fb2.getContent());
        });
        return list;
    }

    public Feedbacks getFeedbackByID(String id) {

        String sql = "select fb.Feedback_ID,fb.Product_ID, p.Product_Name,a.Account_ID, a.Name, a.Phone, fb.Content, fb.CreateDate, fb.Feedback_Status from Feedback fb\n"
                + "join Product p on fb.Product_ID=p.Product_ID\n"
                + "join Account a on a.Account_ID=fb.Account_ID\n"
                + "where fb.Feedback_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(2));
                p.setName(rs.getString(3));
                Account a = new Account();
                a.setAccountID(rs.getInt(4));
                a.setName(rs.getString(5));
                a.setPhone(rs.getString(6));
                return (new Feedbacks(rs.getInt(1),
                        p,
                        a,
                        rs.getString(7),
                        rs.getString(8),
                        rs.getBoolean(9)));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Feedbacks> filterStatusFeedback(String fstatus) {
        List<Feedbacks> list = new ArrayList<>();
        String sql = "";
        if (fstatus.equals("1")) {
            sql = "select fb.Feedback_ID,fb.Product_ID, p.Product_Name,a.Account_ID, a.Name, fb.Content, fb.CreateDate, fb.Feedback_Status from Feedback fb\n"
                    + "join Product p on fb.Product_ID=p.Product_ID\n"
                    + "join Account a on a.Account_ID=fb.Account_ID\n"
                    + " where fb.Feedback_Status = 'True'";
        }
        if (fstatus.equals("2")) {
            sql = "select fb.Feedback_ID,fb.Product_ID, p.Product_Name,a.Account_ID, a.Name, fb.Content, fb.CreateDate, fb.Feedback_Status from Feedback fb\n"
                    + "                    join Product p on fb.Product_ID=p.Product_ID\n"
                    + "                    join Account a on a.Account_ID=fb.Account_ID\n"
                    + "                     where fb.Feedback_Status = 'False'";
        }

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(2));
                p.setName(rs.getString(3));
                Account a = new Account();
                a.setAccountID(rs.getInt(4));
                a.setName(rs.getString(5));
                a.setPhone(rs.getString(6));
                list.add(new Feedbacks(rs.getInt(1),
                        p,
                        a,
                        rs.getString(7),
                        rs.getString(8),
                        rs.getBoolean(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Feedbacks> fulltextSearch(String search) {
        List<Feedbacks> list = new ArrayList<>();
        String sql = "select fb.Feedback_ID,fb.Product_ID, p.Product_Name,a.Account_ID, a.Name, a.Phone, fb.Content, fb.CreateDate, fb.Feedback_Status from Feedback fb\n"
                + " join Product p on fb.Product_ID=p.Product_ID\n"
                + " join Account a on a.Account_ID=fb.Account_ID\n"
                + " where contains(p.Product_Name, '\"*" + search + "*\"') or\n"
                + " contains(fb.Content, '\"*" + search + "*\"') or\n"
                + " contains(a.Name, '\"*" + search + "*\"') or\n"
                + " contains(a.Phone, '\"*" + search + "*\"')";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(2));
                p.setName(rs.getString(3));
                Account a = new Account();
                a.setAccountID(rs.getInt(4));
                a.setName(rs.getString(5));
                a.setPhone(rs.getString(6));
                list.add(new Feedbacks(rs.getInt(1),
                        p,
                        a,
                        rs.getString(7),
                        rs.getString(8),
                        rs.getBoolean(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }
   
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import model.Order;

/**
 *
 * @author Pham Minh Giang
 */
public class OrderDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public List<Order> getOrderByCustomer(String id) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where Account_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getDouble(8),
                        rs.getString(9), rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalOrderByCustomer(String id) {
        int total = 0;
        String sql = "select count(*) from [Order] where Account_ID = " + id;
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

    public List<Order> getOrderPaging(String id, int index) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where Account_ID = " + id + " \n"
                + "order by Order_ID offset ? row fetch next 5 rows only";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getDouble(8),
                        rs.getString(9), rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getAll() {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order]";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getDouble(8),
                        rs.getString(9), rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Order getOrderByID(int id) {
        Order o = new Order();
        String sql = "select * from [Order] \n"
                + "where Order_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                o.setAccountID(rs.getInt(2));
                o.setOrderID(rs.getInt(1));
                o.setDate(rs.getString(3));
                o.setName(rs.getString(4));
                o.setAddress(rs.getString(5));
                o.setPhone(rs.getString(6));
                o.setEmail(rs.getString(7));
                o.setMoney(rs.getDouble(8));
                o.setNote(rs.getString(9));
            }
        } catch (Exception e) {
        }
        return o;
    }

    public List<Order> searchOrder(String search) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] \n"
                + "where contains(*,'\"*" + search + "*\"')";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getDouble(8),
                        rs.getString(9), rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> sortOrder(String choice, List<Order> list) {
        Collections.sort(list, (Order o1, Order o2) -> {
            if (choice.equals("date")) {
                return o1.getDate().compareTo(o2.getDate());
            }
            if (choice.equals("name")) {
                return o2.getName().compareTo(o1.getName());
            }
            if (choice.equals("cost")) {
                return o1.getMoney() > o2.getMoney() ? 1 : -1;
            }
            return o1.getOrderID() > o1.getOrderID() ? -1 : 1;
        });

        return list;
    }

    public List<Order> getOrderByOrderDate(String from, String to) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where 1=1";
        if (from != "" && from != null) {
            sql += "and Order_Date > '" + from + "'";
        }
        if (to != "" && to != null) {
            sql += "and Order_Date < '" + to + "'";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getDouble(8),
                        rs.getString(9), rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalOrder(int year, int month, int startDay, int endDay) {
        String sql = "select count(*) from [Order]\n"
                + "where YEAR(Order_Date) = ? and MONTH(Order_Date) = ? and DAY(Order_Date) between ? and ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, year);
            st.setInt(2, month);
            st.setInt(3, startDay);
            st.setInt(4, endDay);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Order> getListOrder(int year, int month, int startDay, int endDay) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order]\n"
                + "where YEAR(Order_Date) = ? and MONTH(Order_Date) = ? and DAY(Order_Date) between ? and ? ";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ps.setInt(3, startDay);
            ps.setInt(4, endDay);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getDouble(8),
                        rs.getString(9), rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Double> sortListOrderAmount(int year, int month, int startDay, int endDay) {
        List<Double> list = new ArrayList<>();
        double total = 0.0;
        String sql = "select top 100 sum(TotalMoney) as Total from [Order] where \n"
                + "YEAR(Order_Date) = ? and MONTH(Order_Date) = ? and DAY(Order_Date) between ? and ?\n"
                + "group by Order_Date\n"
                + "order by Order_Date";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ps.setInt(3, startDay);
            ps.setInt(4, endDay);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getDouble(1);
                list.add(total);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<String> getListDateOrder(int year, int month, int startDay, int endDay) {
        List<String> list = new ArrayList<>();
        String total = "";
        String sql = "select top 100 sum(TotalMoney) as Total, Day(Order_Date) as date  from [Order] where \n"
                + "YEAR(Order_Date) = ? and MONTH(Order_Date) = ? and DAY(Order_Date) between ? and ?\n"
                + "group by Order_Date\n"
                + "order by Order_Date";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ps.setInt(3, startDay);
            ps.setInt(4, endDay);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getString(2);
                list.add(total);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        System.out.println(o.sortListOrderAmount(2022, 7, 1, 30).get(0));;

    }
    
     public int getTotalOrderByOrderDate(String year, String month, String from, String to) {
        int total = 0;
        List<Order> list = new ArrayList<>();
        String sql = "select count(*) from [Order] where 1=1 ";
//        if (accountID != "" && accountID != null) {
//            sql += " and Account_ID = '" + accountID + "'";
//        }
        if (year != "" && year != null) {
            sql += " and YEAR(Order_Date) = " + year + "";
        }
        if (month != "" && month != null) {
            sql += " and MONTH(Order_Date) =" + month + "";
        }
        if (from != "" && from != null && to != "" && to != null) {
            sql += " and DAY(Order_Date) between " + from + " and " + to + "";
        }

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
     
     public double getTotalEarningByOrderDate(String year, String month, String from, String to) {
        double total = 0;
        List<Order> list = new ArrayList<>();
        String sql = "select  SUM(TotalMoney) from [Order] where 1=1 ";
//        if (accountID != "" && accountID != null) {
//            sql += "and Account_ID = '" + accountID + "'";
//        }
        if (year != "" && year != null) {
            sql += " and YEAR(Order_Date) = " + year + "";
        }
        if (month != "" && month != null) {
            sql += " and MONTH(Order_Date) =" + month + "";
        }
        if (from != "" && from != null && to != "" && to != null) {
            sql += " and DAY(Order_Date) between " + from + " and " + to + "";
        }

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return total;
    }
     
     public List<Order> getOrderByOrderDate(String year, String month, String from, String to) {
        List<Order> list = new ArrayList<>();
        String sql = "select * from [Order] where 1=1";
        if (year != "" && year != null) {
            sql += " and YEAR(Order_Date) = " + year + "";
        }
        if (month != "" && month != null) {
            sql += " and MONTH(Order_Date) =" + month + "";
        }
        if (from != "" && from != null && to != "" && to != null) {
            sql += " and DAY(Order_Date) between " + from + " and " + to + "";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getDouble(8),
                        rs.getString(9), rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }
     
     public List<Double> getListAmountByDate(String year, String month, String from, String to) {
        List<Double> list = new ArrayList<>();
//        String sql = "select top 5 sum(TotalMoney) from [Order] where Order_Status=1 ";
//        if (year != "" && year != null) {
//            sql += " and YEAR(Order_Date) = " + year + "";
//        }
//        if (month != "" && month != null) {
//            sql += " and MONTH(Order_Date) =" + month + "";
//        }
//        if (from != "" && from != null && to != "" && to != null ) {
//            sql += " and DAY(Order_Date) between "+from+" and "+to+"";
//        }
//        sql += " group by Order_Date order by Order_Date desc";
//        if (accountID != "" && accountID != null) {
//            sql += "and Account_ID = '" + accountID + "'";
//        }
        String sql = "select sum(TotalMoney) from [Order] where Order_Status=1  and YEAR(Order_Date) =?\n"
                + "and MONTH(Order_Date) = ? and DAY(Order_Date) between ? and ? group by Order_Date order by Order_Date";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, year);
            ps.setString(2, month);
            ps.setString(3, from);
            ps.setString(4, to);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getDouble(1));
            }
        } catch (Exception e) {
        }
        return list;
    }
     
     public List<String> getListDateByLatest(String year, String month, String from, String to) {
        List<String> list = new ArrayList<>();
//        String sql = "select top 5 DAY(Order_Date) as Total from [Order] where Order_Status=1 ";
//        if (year != "" && year != null) {
//            sql += " and YEAR(Order_Date) = " + year + "";
//        }
//        if (month != "" && month != null) {
//            sql += " and MONTH(Order_Date) =" + month + "";
//        }
//        if (from != "" && from != null && to != "" && to != null ) {
//            sql += " and DAY(Order_Date) between "+from+" and "+to+"";
//        }
//        sql += " group by Order_Date order by Order_Date desc";
        String sql = "select DAY(Order_Date) as Total from [Order] where Order_Status=1  and YEAR(Order_Date) =?\n"
                + "and MONTH(Order_Date) = ? and DAY(Order_Date) between ? and ? group by Order_Date order by Order_Date ";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, year);
            ps.setString(2, month);
            ps.setString(3, from);
            ps.setString(4, to);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }
}

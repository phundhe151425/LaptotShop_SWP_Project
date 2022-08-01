/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.OrderDetailS;
import model.Product;

/**
 *
 * @author Pham Minh Giang
 */
public class OrderDetailSDAO extends DBContext{
      private PreparedStatement ps;
    private ResultSet rs;
    
    public List<OrderDetailS> getOrderDetail(int orderID) {
        String sql = "select * from OrderDetail od\n"
                + "join Product p on p.Product_ID = od.Product_ID\n"
                + "where Order_ID = ?";
        List<OrderDetailS> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(2));
                p.setName(rs.getString(6));
                p.setImgURL(rs.getString(11));
                list.add(new OrderDetailS(rs.getInt(1), p, rs.getInt(3), rs.getDouble(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        OrderDetailSDAO o = new OrderDetailSDAO();
        List<OrderDetailS> list = o.getOrderDetail(1);
        System.out.println(list.size());
        System.out.println(list.get(0).toString());
    }
}

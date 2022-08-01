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
import model.Brand;
import model.CPU;
import model.Capacity;
import model.Card;
import model.Cart;
import model.Category;
import model.Display;
import model.OperatingSystem;
import model.OrderDetail;
import model.Product;
import model.RAM;

/**
 *
 * @author Pham Minh Giang
 */
public class OrderDetailDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public List<OrderDetail> getOrderDetail(int orderID) {
        String sql = "select od.Order_ID, p.Product_Name, p.Product_SalePrice, od.Quantity, p.Product_ImgURL from OrderDetail od\n"
                + "join Product p on p.Product_ID = od.Product_ID\n"
                + "where Order_ID = ?";
        List<OrderDetail> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(orderID,
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        OrderDetailDAO o = new OrderDetailDAO();
        List<OrderDetail> list = o.getOrderDetail(1);
        System.out.println(list.size());
    }
}

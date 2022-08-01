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
import model.Display;

/**
 *
 * @author Pham Minh Giang
 */
public class DisplayDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public List<Display> getAll() {
        List<Display> list = new ArrayList<>();
        String sql = "select * from Display";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Display(rs.getInt(1), rs.getString(2), rs.getBoolean(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}

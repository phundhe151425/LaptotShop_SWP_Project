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
import java.util.Comparator;
import java.util.List;
import model.Setting;

/**
 *
 * @author Pham Minh Giang
 */
public class SettingDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public List<Setting> getAll() {
        List<Setting> list = new ArrayList<>();
        String sql = "select * from Setting";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<String> getAllType() {
        List<String> list = new ArrayList<>();
        String sql = "select distinct [Type] from Setting";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Setting> search(String key) {
        List<Setting> list = new ArrayList<>();
        String sql = "select * from Setting\n"
                + "where contains(*,'\"*" + key + "*\"')";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Setting> fillter(String type, String status) {
        List<Setting> list = new ArrayList<>();
        String sql = "select * from Setting where 1=1";
        if (type != "" && type != null) {
            sql += " and [type] = '" + type + "'";
        }
        if (status != "" && status != null) {
            sql += " and Setting_Status = " + status;
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Setting> sort(String key, List<Setting> l) {
        Collections.sort(l, (Setting s1, Setting s2) -> {
            if (key.equals("ID")) {
                return s1.getId() > s2.getId() ? 1 : -1;
            }
            if (key.equals("Type")) {
                return s1.getType().compareTo(s2.getType());
            }
            if (key.equals("Value")) {
                return s1.getValue().compareTo(s2.getValue());
            }
            if (key.equals("Order")) {
                return s1.getOrder().compareTo(s2.getOrder());
            }
            return s1.getId() > s2.getId() ? 1 : -1;
        });
        return l;
    }

    public void insert(Setting s) {
        String sql = "insert into Setting values('" + s.getType() + "','" + s.getValue() + "','" + s.getOrder() + "','" + s.getDescription() + "','" + s.isStatus() + "')";
        try {
            ps = connection.prepareStatement(sql);
            ps.executeQuery();
        } catch (Exception e) {
        }
    }

    public void updateSettingStatus(String id, String status) {
        String sql = "update Setting set Setting_Status = " + status + " where Setting_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Setting getSettingByID(int id) {
        Setting s = new Setting();
        String sql = "  select * from Setting where Setting_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt(1));
                s.setType(rs.getString(2));
                s.setValue(rs.getString(3));
                s.setOrder(rs.getString(4));
                s.setDescription(rs.getString(5));
                s.setStatus(rs.getBoolean(6));
            }
        } catch (Exception e) {
        }
        return s;
    }

    public void updateSetting(int id, String type, String value, String order, String des) {
        String sql = "update Setting set [Type] = '" + type + "',[Value]='" + value + "', [Order] = '" + order + "',"
                + " [Description] = '" + des + "' where Setting_ID=" + id;
        try {
            ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        SettingDAO s = new SettingDAO();
        System.out.println(s.fillter("qwer", "all").size());
    }
}

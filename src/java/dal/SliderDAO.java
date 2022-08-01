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
import model.Slider;

/**
 *
 * @author Pham Minh Giang
 */
public class SliderDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public List<Slider> getAll() {
        List<Slider> list = new ArrayList<>();
        String sql = "select * from Slider";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Slider(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getBoolean(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Slider> searchSlider(String search) {
        List<Slider> list = new ArrayList<>();
        String sql = "select * from Slider\n"
                + "where contains(*, '\"*" + search + "*\"')";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Slider(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Slider> filterSlider(int status) {
        List<Slider> list = new ArrayList<>();
        String sql = "select * from Slider where Slide_Status = " + status;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Slider(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Slider getSliderByID(int id) {
        Slider slider = new Slider();
        String sql = "select * from Slider where Slide_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                slider = new Slider(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5));
            }
        } catch (Exception e) {
        }
        return slider;
    }

    public void UpdateInfo(int id, String title, String imgURL, String content) {
        String sql = "update Slider set Title = N'" + title + "', Content = N'" + content + "',"
                + " ImgURL = '" + imgURL + "' where Slide_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateStatus(int id, int status) {
        String sql = "update Slider set Slide_Status = " + status + " where Slide_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        SliderDAO sd = new SliderDAO();
        System.out.println(sd.filterSlider(1).size());
    }

}

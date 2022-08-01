/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import com.sun.xml.ws.security.opt.impl.tokens.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import model.Blog;
import sun.util.calendar.CalendarDate;

/**
 *
 * @author Pham Minh Giang
 */
public class BlogDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public List<Blog> getAll() {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from  Blog";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> getAll1() {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog where Blog_Status = 1";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Blog getBlogByID(String id) {
        Blog blog = new Blog();
        String sql = "select * from  Blog where Blog_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                blog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8));
            }
        } catch (Exception e) {
        }
        return blog;
    }

    public List<Blog> SearchBlog(String search) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog \n"
                + "where Blog_Status = 1\n"
                + "and contains(*, '\"*" + search + "*\"')";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;

    }

    public void Insert(Blog b) {
        String sql = "insert into Blog values('" + b.getImgURL() + "', N'" + b.getAuthorName() + "',"
                + " N'" + b.getTitle() + "', N'" + b.getContent() + "', '" + b.getCreateDate() + "', null, '" + b.isStatus() + "')";
        try {
            ps = connection.prepareStatement(sql);
//            ps.setString(1, b.getImgURL());
//            ps.setString(2, b.getAuthorName());
//            ps.setString(3, b.getTitle());
//            ps.setString(4, b.getContent());
//            ps.setString(5, b.getCreateDate());
//            ps.setString(6, b.getModyfieDate());
//            ps.setBoolean(7, b.isStatus());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Blog> Search(String search) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog\n"
                + "where contains(*,'\"*" + search + "*\"')";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Blog> Sort(String choice, List<Blog> list) {
        Collections.sort(list, (Blog b1, Blog b2) -> {
            if (choice.equals("0")) {
                return b1.getId() > b2.getId() ? 1 : -1;
            }
            if (choice.equals("1")) {
                return b1.getCreateDate().compareTo(b2.getCreateDate());
            }
            if (choice.equals("2")) {
                return b2.getCreateDate().compareTo(b1.getCreateDate());
            }
            return b1.getId() > b2.getId() ? 1 : -1;
        });

        return list;
    }

    public List<String> getAllAuthor() {
        List<String> list = new ArrayList<>();
        String sql = "select distinct AuthorName from Blog";
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

    public List<Blog> filter(String author) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog where AuthorName like '" + author + "'";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getBoolean(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void Update(int id, String title, String image, String author, String content, String modify) {
        String sql = "update Blog set  ImgURL ='" + image + "',  AuthorName = N'" + author + "', Title = N'" + title + "' ,"
                + "Content =N'" + content + "', ModifiedDate = '" + modify + "' where Blog_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editStatus(int status, int id) {
        String sql = "update Blog set Blog_Status = " + status + " where Blog_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        BlogDAO b = new BlogDAO();
        LocalDate first = java.time.LocalDate.now();
//        SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy");
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String date = dtf.format(LocalDate.now()).toString();

        System.out.println(java.time.LocalDate.now().toString());
    }
}

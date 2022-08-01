/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Brand;
import model.CPU;
import model.Capacity;
import model.Card;
import model.Cart;
import model.Category;
import model.Display;
import model.Item;
import model.OperatingSystem;
import model.OrderDetail;
import model.Product;
import model.RAM;

/**
 *
 * @author Pham Minh Giang
 */
public class ProductDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "  select * from Product p\n"
                + " join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + " join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID where p.Product_Status = 1 and p.Product_Quantity != 0";

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAllProductManage() {
        List<Product> list = new ArrayList<>();
        String sql = "  select * from Product p\n"
                + " join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + " join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID";

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getSaleProduct() {
        ProductDAO p = new ProductDAO();
        List<Product> list = new ArrayList<>();
        List<Integer> listID = new ArrayList<>();
        String sql = "select top(10) p.Product_ID, count(p.Product_ID) as Countt from OrderDetail o \n"
                + "join Product p on o.Product_ID = p.Product_ID\n"
                + "where p.Product_Status = 1\n"
                + "group by p.Product_ID\n"
                + "order by Countt desc";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listID.add(rs.getInt(1));
            }
        } catch (Exception e) {
        }
        for (Integer i : listID) {
            list.add(p.getProductByID(i));
        }
        return list;

    }

    public List<Product> getNewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select  top(10) * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID "
                + "where p.Product_Status = 1 and p.Product_Quantity != 0"
                + "order by Product_ID DESC";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByCate(String cate) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID where p.Product_Status = 1 "
                + "and cat.Category_Name = '" + cate + "'";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) {
        Product p = null;
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID where p.Product_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                p = (new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));

            }

        } catch (Exception e) {
        }
        return p;
    }

    public Product getProductByID(int productID) {
        Product p = new Product();
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID where p.Product_ID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            rs = ps.executeQuery();
            if (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                p = (new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }

        } catch (Exception e) {
        }
        return p;
    }

    public int getTotalProduct() {
        int total = 0;
        String sql = "select count(*) from Product";
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

    public int getTotalProductByBrand(String id) {
        int total = 0;
        String sql = "select count(*) from Product where Brand_ID = " + id;
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

    public int getTotalProductByStatus(String status) {
        int total = 0;
        String sql = "select count(*) from Product where Product_Status = " + status;
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

    public int getTotalProductBySearch(String search) {
        int total = 0;
        String sql = "select count(*) from Product where contains(Product_Name, '\"*" + search + "*\"') or\n"
                + "contains(Product_Description, '\"*" + search + "*\"')";
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

    public int getTotalProductByFillter(String category, String brand, String display, String cpu) {
        int total = 0;
        String sql = "select count(*) from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID\n"
                + "where 1=1";

        if (category != null && category != "") {
            sql += " and cat.Category_Name = '" + category + "'";
        }
        if (brand != null && brand != "") {
            sql += " and b.Brand_Name = '" + brand + "'";
        }
        if (display != null && display != "") {
            sql += " and d.Display_Name = '" + display + "'";
        }
        if (cpu != null && cpu != "") {
            sql += " and cpu.CPU_Name = '" + cpu + "'";
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

    public List<Product> listProPaging(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID "
                + "where p.Product_Status = 1 "
                + "order by Product_ID offset ? row fetch next 9 rows only";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> listProManagePaging(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID\n"
                + "order by Product_ID offset ? row fetch next 5 rows only";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> listProOrder(int index, String sort) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID\n"
                + "where 1 = 1";
//                + "order by Product_ID offset ? row fetch next 5 rows only";
        if (sort.equals("1")) {
            sql += "order by p.Product_Price offset ? row fetch next 5 rows only";
        }
        if (sort.equals("2")) {
            sql += "order by p.Product_Price DESC offset ? row fetch next 5 rows only";
        }
        if (sort.equals("3")) {
            sql += "order by p.Product_Name offset ? row fetch next 5 rows only";
        }
        if (sort.equals("4")) {
            sql += "order by p.Product_Name DESC offset ? row fetch next 5 rows only";
        }
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> ListProductSortPaging(int index, String sort) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID\n"
                + "where 1 = 1";
//                + "order by Product_ID offset ? row fetch next 5 rows only";
        if (sort.equals("1")) {
            sql += "order by p.Product_Price offset ? row fetch next 9 rows only";
        }
        if (sort.equals("2")) {
            sql += "order by p.Product_Price DESC offset ? row fetch next 9 rows only";
        }
        if (sort.equals("3")) {
            sql += "order by p.Product_Name offset ? row fetch next 9 rows only";
        }
        if (sort.equals("4")) {
            sql += "order by p.Product_Name DESC offset ? row fetch next 9 rows only";
        }
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> ListProductByBrandIdOrStatus(int index, String brandid, String status) {
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID where 1=1";
        if (brandid != null && brandid != "") {
            int id = Integer.parseInt(brandid);
            sql += "and p.Brand_ID = " + id + " order by Product_ID offset ? row fetch next 5 rows only";
        }
        if (status != null && status != "") {
            int s = Integer.parseInt(status);
            sql += "and p.Product_Status =" + s + " order by Product_ID offset ? row fetch next 5 rows only";
        }
        List<Product> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> ListProductSearch(int index, String search) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID\n"
                + "where contains(p.Product_Name, '\"*" + search + "*\"') or\n"
                + "contains(p.Product_Description, '\"*" + search + "*\"')"
                + "order by Product_ID offset ? row fetch next 5 rows only";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> ListProductSearchPaging(int index, String search) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID\n"
                + "where contains(p.Product_Name, '\"*" + search + "*\"') or\n"
                + "contains(p.Product_Description, '\"*" + search + "*\"')"
                + "order by Product_ID offset ? row fetch next 9 rows only";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> ListProductFillterPaging(int index, String categoryy, String brandd, String displayy, String cpuu) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID\n"
                + "where 1=1";
        if (categoryy != null && categoryy != "") {
            sql += " and cat.Category_Name = '" + categoryy + "'";
        }
        if (brandd != null && brandd != "") {
            sql += " and b.Brand_Name = '" + brandd + "'";
        }
        if (displayy != null && displayy != "") {
            sql += " and d.Display_Name = '" + displayy + "'";
        }
        if (cpuu != null && cpuu != "") {
            sql += " and cpu.CPU_Name = '" + cpuu + "'";
        }
        sql += " order by p.Product_ID offset ? row fetch next 9 rows only";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int addOrder(int accountID, String name, String address, String email, String phone, String note, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        int orderID = 0;
        try {
            // add order
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([Account_ID]\n"
                    + "           ,[Order_Date]\n"
                    + "           ,[CustomerName]\n"
                    + "           ,[Address]\n"
                    + "           ,[Phone]\n"
                    + "           ,[Email]\n"
                    + "           ,[TotalMoney]\n"
                    + "           ,[Order_Note]\n"
                    + "           ,[Order_Status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, accountID);
            ps.setString(2, date);
            ps.setString(3, name);
            ps.setString(4, address);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setDouble(7, cart.getTotalPrice());
            ps.setString(8, note);
            ps.setInt(9, 1);
            ps.executeUpdate();

            // take orderID
            String sql1 = "SELECT TOP 1 [Order_ID]\n"
                    + "      ,[Account_ID]\n"
                    + "      ,[Order_Date]\n"
                    + "      ,[CustomerName]\n"
                    + "      ,[Address]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Email]\n"
                    + "      ,[TotalMoney]\n"
                    + "      ,[Order_Note]\n"
                    + "      ,[Order_Status]\n"
                    + "  FROM [PROJECT_SWP391_SUMMER2022].[dbo].[Order]\n"
                    + "  order by Order_ID desc";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            rs = ps1.executeQuery();

            if (rs.next()) {
                orderID = rs.getInt(1);
                for (Item i : cart.getItem()) {
                    String sql2 = "INSERT INTO [dbo].[OrderDetail]\n"
                            + "           ([Order_ID]\n"
                            + "           ,[Product_ID]\n"
                            + "           ,[Quantity]\n"
                            + "           ,[Price])\n"
                            + "     VALUES\n"
                            + "           (?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?)";
                    PreparedStatement ps2 = connection.prepareStatement(sql2);
                    ps2.setInt(1, orderID);
                    ps2.setInt(2, i.getProduct().getId());
                    ps2.setInt(3, i.getQuantity());
                    ps2.setDouble(4, i.getPrice());
                    ps2.executeUpdate();
                }
            }
            // update quantity of product
            String sql3 = "UPDATE [dbo].[Product]\n"
                    + "SET [Product_Quantity] = Product_Quantity - ?\n"
                    + "WHERE Product_ID = ?";
            PreparedStatement ps3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItem()) {
                ps3.setInt(1, i.getQuantity());
                ps3.setInt(2, i.getProduct().getId());
                ps3.executeUpdate();
            }

        } catch (Exception e) {
        }
        return orderID;
    }

    public List<Product> filter(String cate, String brand, String display, String cpu) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p  \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID \n"
                + "where 1=1 and p.Product_Status = 1";
        if (cate != null && cate != "") {
            sql += "and cat.Category_Name = '" + cate + "' ";
        }
        if (brand != null && brand != "") {
            sql += "and b.Brand_Name = '" + brand + "' ";
        }
        if (display != null && display != "") {
            sql += "and d.Display_Name = '" + display + "' ";
        }
        if (cpu != null && cpu != "") {
            sql += "and  cpu.CPU_Name = '" + cpu + "' ";
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand b = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU c = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display d = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(4), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        b, category, os, ram, c, d, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> sortPro(String choice, List<Product> list) {
        Collections.sort(list, (Product p1, Product p2) -> {
            if (choice.equals("1")) {
                return p1.getPrice() > p2.getPrice() ? 1 : -1;
            }
            if (choice.equals("2")) {
                return p1.getPrice() > p2.getPrice() ? -1 : 1;
            }
            if (choice.equals("3")) {
                return p1.getName().compareTo(p2.getName());
            }
            if (choice.equals("4")) {
                return p2.getName().compareTo(p1.getName());
            }

            return p1.getCreatedate().compareTo(p2.getCreatedate());
        });
        return list;
    }

    public List<Product> fulltextSearch(String search) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID\n"
                + "where contains(p.Product_Name, '\"*" + search + "*\"') or\n"
                + "contains(p.Product_Description, '\"*" + search + "*\"')";

        try {
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        List<Product> list = p.getProductBuyMost(2022, 7, 1, 30);
        System.out.println(list.get(0).getName());
    }

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

    public List<Brand> getAllBrand() {
        String sql = "select * from Brand";
        List<Brand> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setId(rs.getInt(1));
                b.setName(rs.getString(2));
                b.setStatus(rs.getBoolean(3));
                list.add(b);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<CPU> getAllCPU() {
        String sql = "select * from CPU";
        List<CPU> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                CPU c = new CPU();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setStatus(rs.getBoolean(3));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Capacity> getAllCapacity() {
        String sql = "select * from Capacity";
        List<Capacity> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Capacity c = new Capacity();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setStatus(rs.getBoolean(3));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Card> getAllCard() {
        String sql = "select * from Card";
        List<Card> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Card c = new Card();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setStatus(rs.getBoolean(3));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategory() {
        String sql = "select * from Category";
        List<Category> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setStatus(rs.getBoolean(3));
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Display> getAllDisplay() {
        String sql = "select * from Display";
        List<Display> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Display d = new Display();
                d.setId(rs.getInt(1));
                d.setName(rs.getString(2));
                d.setStatus(rs.getBoolean(3));
                list.add(d);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<OperatingSystem> getAllOS() {
        String sql = "select * from OperatingSystem";
        List<OperatingSystem> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                OperatingSystem o = new OperatingSystem();
                o.setId(rs.getInt(1));
                o.setName(rs.getString(2));
                o.setStatus(rs.getBoolean(3));
                list.add(o);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<RAM> getAllRAM() {
        String sql = "select * from RAM";
        List<RAM> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                RAM r = new RAM();
                r.setId(rs.getInt(1));
                r.setName(rs.getString(2));
                r.setStatus(rs.getBoolean(3));
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void addNewProduct(Product p) {
        String sql = "insert into Product values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1,null)";
        p.setSaleprice(p.getPrice() - p.getPrice() * p.getDiscount());
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setFloat(3, p.getDiscount());
            ps.setDouble(4, p.getSaleprice());
            ps.setInt(5, p.getQuantity());
            ps.setString(6, p.getImgURL());
            ps.setString(7, p.getDescription());
            ps.setInt(8, p.getBrand().getId());
            ps.setInt(9, p.getCategory().getId());
            ps.setInt(10, p.getOs().getId());
            ps.setInt(11, p.getRam().getId());
            ps.setInt(12, p.getCpu().getId());
            ps.setInt(13, p.getDisplay().getId());
            ps.setInt(14, p.getCapacity().getId());
            ps.setInt(15, p.getCard().getId());
            ps.setString(16, date);
            ps.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public List<Product> getListProductByBrandIdOrStatus(String brandid, String status) {
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID where 1=1";
        if (brandid != null && brandid != "") {
            int id = Integer.parseInt(brandid);
            sql += "and p.Brand_ID = " + id;
        }
        if (status != null && status != "") {
            int s = Integer.parseInt(status);
            sql += "and p.Product_Status =" + s;
        }
        List<Product> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getListProductByStatus(int status) {
        String sql = "select * from Product p \n"
                + "join Brand b on p.Brand_ID = b.Brand_ID\n"
                + "join Category cat on p.Category_ID = cat.Category_ID\n"
                + "join OperatingSystem o on p.OS_ID = o.OS_ID\n"
                + "join RAM r on p.RAM_ID = r.RAM_ID\n"
                + "join CPU cpu on p.CPU_ID = cpu.CPU_ID\n"
                + "join Display d on p.Display_ID = d.Display_ID\n"
                + "join Capacity cap on p.Capacity_ID = cap.Capacity_ID\n"
                + "join Card car on p.Card_ID = car.Card_ID where p.Product_Status = ?";
        List<Product> list = new ArrayList<>();

        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt(20), rs.getString(21), rs.getBoolean(22));
                Category category = new Category(rs.getInt(23), rs.getString(24), rs.getBoolean(25));
                OperatingSystem os = new OperatingSystem(rs.getInt(26), rs.getString(27), rs.getBoolean(28));
                RAM ram = new RAM(rs.getInt(29), rs.getString(30), rs.getBoolean(31));
                CPU cpu = new CPU(rs.getInt(32), rs.getString(33), rs.getBoolean(34));
                Display display = new Display(rs.getInt(35), rs.getString(36), rs.getBoolean(37));
                Capacity capaciry = new Capacity(rs.getInt(38), rs.getString(39), rs.getBoolean(40));
                Card card = new Card(rs.getInt(41), rs.getString(42), rs.getBoolean(43));
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3),
                        rs.getFloat(4), rs.getDouble(5), rs.getInt(6), rs.getString(7), rs.getString(8),
                        brand, category, os, ram, cpu, display, capaciry, card,
                        rs.getString(17), rs.getBoolean(18), rs.getString(19)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void UpdateProductStatus(int status, int id) {
        String sql = "update Product set Product_Status = ? where Product_ID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateProduct(Product p) {
        String sql = "update Product set Product_Name = ?, Product_Price = ?, Discount = ?, Product_SalePrice = ?, Product_Quantity = ?, Product_ImgURL = ?\n"
                + ", Product_Description = ?, Brand_ID = ?,Category_ID = ?, OS_ID = ?, RAM_ID = ?, CPU_ID = ?, Display_ID = ?, Capacity_ID = ?, Card_ID = ?, "
                + "Product_Status = ?,Product_ModifyDate = ?\n"
                + "where Product_ID = ? ";
        double saleprice = p.getPrice() - p.getDiscount() * p.getPrice();
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setFloat(3, p.getDiscount());
            ps.setDouble(4, saleprice);
            ps.setInt(5, p.getQuantity());
            ps.setString(6, p.getImgURL());
            ps.setString(7, p.getDescription());
            ps.setInt(8, p.getBrand().getId());
            ps.setInt(9, p.getCategory().getId());
            ps.setInt(10, p.getOs().getId());
            ps.setInt(11, p.getRam().getId());
            ps.setInt(12, p.getCpu().getId());
            ps.setInt(13, p.getDisplay().getId());
            ps.setInt(14, p.getCapacity().getId());
            ps.setInt(15, p.getCard().getId());
            ps.setBoolean(16, p.isStatus());
            ps.setString(17, date);
            ps.setInt(18, p.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> getProductBuyMost(int year, int month, int startDay, int endDay) {
        List<Product> list = new ArrayList<>();
        String sql = "select Top 5 SUM(od.Quantity) AS TotalQuantity,p.Product_ID,p.Product_Name,p.Product_Price, p.Product_SalePrice, b.Brand_Name,p.Product_ImgURL,o.Order_Date from OrderDetail od\n"
                + "join Product p on od.Product_ID = p.Product_ID\n"
                + "join [Order] o on od.Order_ID = o.Order_ID\n"
                + "join Brand b on p.Brand_ID = b.Brand_ID \n"
                + "where\n"
                + "YEAR(o.Order_Date) = ? and MONTH(o.Order_Date) = ? and DAY(o.Order_Date) between ? and ?\n"
                + "group by p.Product_ID,p.Product_Name,p.Product_Price, p.Product_SalePrice, b.Brand_Name,p.Product_ImgURL,o.Order_Date\n"
                + "order by TotalQuantity DESC";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ps.setInt(3, startDay);
            ps.setInt(4, endDay);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(2));
                p.setName(rs.getString(3));
                p.setPrice(rs.getDouble(4));
                p.setSaleprice(rs.getDouble(5));
                Brand b = new Brand();
                b.setName(rs.getString(6));
                p.setBrand(b);
                p.setImgURL(rs.getString(7));
                list.add(p);

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getAccountBuyMost(int year, int month, int startDay, int endDay) {
        List<Account> list = new ArrayList<>();
        String sql = "select Top 5 count(a.Account_ID) as TongDonHang,a.Account_ID,a.[Name],a.Email,a.Phone,a.[Address] from [Order] o\n"
                + "join Account a on o.Account_ID = a.Account_ID\n"
                + "where\n"
                + "YEAR(o.Order_Date) = ? and MONTH(o.Order_Date) = ? and DAY(o.Order_Date) between ? and ?\n"
                + "group by a.Account_ID,a.[Name],a.Email,a.Phone,a.[Address]\n"
                + "order by TongDonHang DESC";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ps.setInt(3, startDay);
            ps.setInt(4, endDay);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccountID(rs.getInt(2));
                a.setName(rs.getString(3));
                a.setEmail(rs.getString(4));
                a.setPhone(rs.getString(5));
                a.setAddress(rs.getString(6));
                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<String> getDay(int year, int month, int startDay, int endDay) {
        List<String> list = new ArrayList<>();
        String sql = "select sum(od.Quantity), o.Order_Date,DAY(o.Order_Date) from OrderDetail od\n"
                + "join [Order] o on od.Order_ID = o.Order_ID\n"
                + "where\n"
                + "YEAR(o.Order_Date) = ? and MONTH(o.Order_Date) = ? and DAY(o.Order_Date) between ? and ?\n"
                + "group by  o.Order_Date ";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ps.setInt(3, startDay);
            ps.setInt(4, endDay);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(3));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Integer> getTotalProductEachDay(int year, int month, int startDay, int endDay) {
        List<Integer> list = new ArrayList<>();
        String sql = "select sum(od.Quantity), o.Order_Date,DAY(o.Order_Date) from OrderDetail od\n"
                + "join [Order] o on od.Order_ID = o.Order_ID\n"
                + "where\n"
                + "YEAR(o.Order_Date) = ? and MONTH(o.Order_Date) = ? and DAY(o.Order_Date) between ? and ?\n"
                + "group by  o.Order_Date ";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ps.setInt(3, startDay);
            ps.setInt(4, endDay);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (Exception e) {
        }
        return list;
    }
}

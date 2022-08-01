/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Account;
import model.Role;

/**
 *
 * @author DUC THINH
 */
public class AccountDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public Account checkAccount(String username, String password) {
        String sql = "select * from Account a\n"
                + "join Role_Account r on a.Role_ID = r.Role_ID\n"
                + "where a.Username = ? and a.[Password] = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                account.setAccountID(rs.getInt(1));
                account.setUsername(username);
                account.setPassword(password);
                account.setName(rs.getString(4));
                account.setGender(rs.getBoolean(5));
                account.setEmail(rs.getString(6));
                account.setPhone(rs.getString(7));
                account.setAddress(rs.getString(8));
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                r.setRoleName(rs.getString(12));
                account.setRole(r);
                return account;
            }

        } catch (SQLException e) {
        }
        return null;
    }

    public void changePass(int accountID, String newPass) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "     SET [Password] = ?\n"
                + " WHERE Account_ID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, accountID);
            ps.setString(2, newPass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Account> getAll() { // giang
        List<Account> list = new ArrayList<>();
        String sql = " select * from Account a\n"
                + "  join Role_Account r on a.Role_ID = r.Role_ID";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                r.setRoleName(rs.getString(12));
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), r, rs.getBoolean(10)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getByGender(int gender) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account a join Role_Account r on a.Role_ID = r.Role_ID"
                + "where Gender = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, gender);
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                r.setRoleName(rs.getString(12));
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), r, rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getByRole(int role) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account a \n"
                + "join Role_Account r on a.Role_ID = r.Role_ID\n"
                + "where a.Role_ID = " + role;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                r.setRoleName(rs.getString(12));
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), r, rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getByStatus(int status) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account a\n"
                + "join Role_Account r on a.Role_ID = r.Role_ID\n"
                + "where a.Account_Status = " + status;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                r.setRoleName(rs.getString(12));
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), r, rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getAllSort(String str, List<Account> l) { // giang
        List<Account> list = new ArrayList<>();
        Collections.sort(l, new Comparator<Account>() {
            @Override
            public int compare(Account o1, Account o2) {
                if (str.equals("Account_ID")) {
                    return o1.getAccountID() > o2.getAccountID() ? 1 : -1;
                }
                if (str.equals("Name")) {
                    return o1.getName().compareTo(o2.getName());
                }
                if (str.equals("Email")) {
                    return o1.getEmail().compareTo(o2.getEmail());
                }
                if (str.equals("Phone")) {
                    return o1.getPhone().compareTo(o2.getPhone());
                }
                if (str.equals("Role_ID")) {
                    return o1.getRole().getRoleName().compareTo(o2.getRole().getRoleName());
                }
                return o1.getAccountID() > o2.getAccountID() ? 1 : -1;
            }
        });
        return l;
    }

    public List<Account> fillter(String gender, String roleID, String status) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account a join Role_Account r on a.Role_ID = r.Role_ID\n"
                + "where 1=1";
        if (gender != null && gender != "") {
            sql += " and Gender = " + gender;
        }
        if (roleID != null && roleID != "") {
            sql += " and a.Role_ID = " + roleID;
        }
        if (status != null && status != "") {
            sql += " and Account_Status = " + status;
        }
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                r.setRoleName(rs.getString(12));
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), r, rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> SearchUser(String str) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account\n"
                + "where contains(*,'\"*" + str + "*\"')";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), r, rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Integer> getAllGender() {
        List<Integer> list = new ArrayList<>();
        String sql = "select DISTINCT Gender from Account";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();
        String sql = "select * from Role_Account";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(1));
                r.setRoleName(rs.getString(2));
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account getAcountByID(int id) {
        String sql = "  select * from Account a\n"
                + "  join Role_Account r  on a.Role_ID = r.Role_ID\n"
                + "  where a.Account_ID = ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                r.setRoleName(rs.getString(12));
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), r, rs.getBoolean(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void UpdateUserRole(String id, String role) {
        String sql = "update Account set Role_ID = " + role + " where Account_ID = " + id;

        try {
            ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateUserStatus(String id, String status) {
        String sql = "update Account set Account_Status = " + status + " where Account_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account checkUserExist(String username) {
        String sql = "select * from Account where Username = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                return account;
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    public Account checkEmailExist(String email) {
        String sql = "select * from Account where Email = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                Account account = new Account();
                return account;
            }
        } catch (SQLException ex) {

        }
        return null;
    }

    public void registerNewAcc(Account a) {
        String sql = "insert into Account values(?,?,?,?,?,?,?,2,1)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, a.getUsername());
            ps.setString(2, a.getPassword());
            ps.setString(3, a.getName());
            ps.setBoolean(4, a.isGender());
            ps.setString(5, a.getEmail());
            ps.setString(6, a.getPhone());
            ps.setString(7, a.getAddress());
            ps.executeUpdate();
        } catch (SQLException ex) {
        }

    }

    public void changePass(String Username, String newPass) {
        String sql = "UPDATE [dbo].[Account] \n"
                + "SET [Password] = ?\n"
                + "WHERE Username = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(2, Username);
            ps.setString(1, newPass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account getAccountByUser(String username) {
        String sql = "select * from Account where Username = ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                Account account = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        r,
                        rs.getBoolean(10));
                return account;
            }

        } catch (SQLException e) {
        }
        return null;
    }

    public Account getAccountByEmailUsername(String username, String email) {
        String sql = "select * from Account where Username = ? and Email = ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                Account account = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getBoolean(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        r,
                        rs.getBoolean(10));
                return account;
            }

        } catch (SQLException e) {
        }
        return null;
    }

    public void updateInfor(String id, String name, boolean gender, String email, String phone, String address) {
        String sql = "update Account set Name = N'" + name + "',"
                + " Gender = '" + gender + "', Email= N'" + email + "', Phone = '" + phone + "',"
                + " Address = N'" + address + "' where Account_ID = " + id;
        try {
            ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Account> listPaging(int index) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account order by Account_ID\n"
                + "offset  ? row fetch next 5 rows only;";
        try {
            ps = connection.prepareCall(sql);
            ps.setInt(1, (index - 1) * 5);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), r, rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;

    }

    public int getTotalAccount() {
        String sql = "select count(*) from Account";
        int total = 0;
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

    // fulltext search : name, email, phone, address for account
    public List<Account> SearchCustomer(String search) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account \n"
                + "where contains(*, '\"*" + search + "*\"') and Role_ID = 2";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getBoolean(5), rs.getString(6), rs.getString(7), rs.getString(8), r, rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> FilterCustomer(int status) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account a\n"
                + "join Role_Account r on a.Role_ID = r.Role_ID\n"
                + "where a.Role_ID =2 and a.Account_Status = " + status;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                r.setRoleName(rs.getString(12));
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), r, rs.getBoolean(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getAllCustomer() {
        List<Account> list = new ArrayList<>();
        String sql = " select * from Account a\n"
                + "join Role_Account r on a.Role_ID = r.Role_ID\n"
                + "where a.Role_ID = 2";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                r.setRoleID(rs.getInt(9));
                r.setRoleName(rs.getString(12));
                list.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), r, rs.getBoolean(10)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> sortCustomer(String choice, List<Account> list) {
        Collections.sort(list, (Account a1, Account a2) -> {
            if (choice.equals("name")) {
                return a1.getName().compareTo(a2.getName());
            }
            if (choice.equals("email")) {
                return a1.getEmail().compareTo(a2.getEmail());
            }
            if (choice.equals("phone")) {
                return a1.getPhone().compareTo(a2.getPhone());
            }
            return a1.getAccountID() > a2.getAccountID() ? 1 : -1; //To change body of generated lambdas, choose Tools | Templates.
        });
        return list;
    }
    
    public void insertUser(Account a){
        String sql = "insert into Account values(?,?,?,?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, a.getUsername());
            ps.setString(2, a.getPassword());
            ps.setString(3, a.getName());
            ps.setBoolean(4, a.isGender());
            ps.setString(5, a.getEmail());
            ps.setString(6, a.getPhone());
            ps.setString(7, a.getAddress());
            ps.setInt(8, a.getRole().getRoleID());
            ps.setBoolean(9, a.isStatus());
            ps.executeUpdate();
        } catch (SQLException ex) {
        }
    }


    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
        List<Account> list = new ArrayList<>();
        boolean b = Boolean.parseBoolean("true");
        System.out.println(b);
    }

}

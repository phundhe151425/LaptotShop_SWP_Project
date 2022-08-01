/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import Validate.Validate;
import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Role;

/**
 *
 * @author Pham Minh Giang
 */
public class AddUserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        Validate validate = new Validate();
        AccountDAO a = new AccountDAO();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String roleID = request.getParameter("roleID");
        String status = request.getParameter("status");

        Account account = null;
        account = a.checkEmailExist(email);

        if (validate.checkPhone(phone) == false || validate.validateEmail(email) == false
                || account != null
                || username.trim().equals("") || password.trim().equals("")
                || name.trim().equals("") || email.trim().equals("")
                || phone.trim().equals("") || address.trim().equals("")) {

            String index_raw = request.getParameter("index");
            if (index_raw == null) {
                index_raw = "1";
            }
            int total = a.getTotalAccount();
            int page = total / 5;
            if (total % 5 != 0) {
                page += 1;
            }
            int index = Integer.parseInt(index_raw);
            List<Account> listAccount = a.listPaging(index);
            List<Integer> listGender = a.getAllGender();
            List<Role> listRole = a.getAllRole();

            session.setAttribute("listUser", a.getAll());
            request.setAttribute("check", "list");
            request.setAttribute("page", page);
            request.setAttribute("index", index);
            request.setAttribute("GenderList", listGender);
            request.setAttribute("RoleList", listRole);
            request.setAttribute("UserList", listAccount);
            request.getRequestDispatcher("Admin/userlist.jsp").forward(request, response);
        } else {
            Role r = new Role();
            r.setRoleID(Integer.parseInt(roleID));
            boolean b = true;
            if (status.equals("0")) {
                b = false;
            }

            Account acc = new Account();
            acc.setUsername(username);
            acc.setPassword(password);
            acc.setName(name);
            acc.setGender(Boolean.parseBoolean(gender));
            acc.setEmail(email);
            acc.setPhone(phone);
            acc.setAddress(address);
            acc.setRole(r);
            acc.setStatus(b);
            a.insertUser(acc);
            response.sendRedirect("userlist");
        }

//        HttpSession session = request.getSession();
//        String index_raw = request.getParameter("index");
//        if (index_raw == null) {
//            index_raw = "1";
//        }
//        int total = a.getTotalAccount();
//        int page = total / 5;
//        if (total % 5 != 0) {
//            page += 1;
//        }
//        int index = Integer.parseInt(index_raw);
//        List<Account> listAccount = a.listPaging(index);
//        List<Integer> listGender = a.getAllGender();
//        List<Role> listRole = a.getAllRole();
//
//        session.setAttribute("listUser", a.getAll());
//        request.setAttribute("check", "list");
//        request.setAttribute("page", page);
//        request.setAttribute("index", index);
//        request.setAttribute("GenderList", listGender);
//        request.setAttribute("RoleList", listRole);
//        request.setAttribute("UserList", listAccount);
//        request.getRequestDispatcher("Admin/userlist.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MarketingController;

import Validate.Validate;
import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author Pham Minh Giang
 */
public class EditCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet EditCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditCustomerServlet at " + request.getContextPath() + "</h1>");
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
        AccountDAO ad = new AccountDAO();
        Validate v = new Validate();
        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String gender_raw = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int id = Integer.parseInt(id_raw);
        boolean gender = Boolean.parseBoolean(gender_raw);

        boolean checkmail = true;
        Account account = ad.getAcountByID(id);
        List<Account> list = ad.getAll();
        for (Account a : list) {
            if(a.getAccountID() == id){
                list.remove(a);
                break;
            }
        }
        for (Account a : list) {
            if (a.getEmail().equals(email)) {
                checkmail = false;
            }
        }
        System.out.println(checkmail);
        if (v.checkPhone(phone) == false || v.validateEmail(email) == false
                || checkmail == false
                || name.trim().equals("") || email.trim().equals("")
                || phone.trim().equals("") || address.trim().equals("")) {
            if (checkmail == false) {
                request.setAttribute("emailMess", "Email is already exist!");
            }
            if (name.trim().equals("")) {
                request.setAttribute("nameMess", "Name can not empty!");
            }
            if (email.trim().equals("")) {
                request.setAttribute("emailMess", "Email can not empty!");
            }
            if (phone.trim().equals("")) {
                request.setAttribute("phoneMess", "Phone can not empty!");
            }
            if (address.trim().equals("")) {
                request.setAttribute("addressMess", "Address can not empty!");
            }
            Account a = ad.getAcountByID(id);
            request.setAttribute("Customer", a);
            request.getRequestDispatcher("Marketing/customerdetail.jsp").forward(request, response);
        } else {
            ad.updateInfor(id_raw, name, gender, email, phone, address);
            Account a = ad.getAcountByID(id);
            request.setAttribute("Customer", a);
            request.getRequestDispatcher("Marketing/customerdetail.jsp").forward(request, response);
        }

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

        String status_raw = request.getParameter("status");
        String id_raw = request.getParameter("id");

        int id = Integer.parseInt(id_raw);
        String status = "0";
        if (status_raw.equals("InActive")) {
            status = "1";
        }
        AccountDAO a = new AccountDAO();
        a.UpdateUserStatus(id_raw, status);

        response.sendRedirect("customermanage");
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

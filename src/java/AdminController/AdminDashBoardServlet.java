/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import dal.AccountDAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Order;

/**
 *
 * @author DUC THINH
 */
public class AdminDashBoardServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminDashBoardServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDashBoardServlet at " + request.getContextPath() + "</h1>");
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
        Account account = (Account) session.getAttribute("account");

        OrderDAO orderDAO = new OrderDAO();
        int totalOrder = orderDAO.getTotalOrderByOrderDate("", "","", "");
        double totalEarning = orderDAO.getTotalEarningByOrderDate( "", "","", "");
        
        AccountDAO accountDAO = new AccountDAO();
        List<Account> listAccount = accountDAO.getAllCustomer();

        request.setAttribute("listAccount", listAccount);
        request.setAttribute("accountName", account.getName());
        request.setAttribute("totalOrder", totalOrder);
        request.setAttribute("totalEarning", totalEarning);
        request.getRequestDispatcher("Admin/Admin_Dashboard.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

//        String accountID = request.getParameter("accountID");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        request.setAttribute("year", year);
        request.setAttribute("month", month);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        OrderDAO orderDAO = new OrderDAO();
        int totalOrder = 0;
        double totalEarning = 0;
        totalOrder = orderDAO.getTotalOrderByOrderDate(year, month,from ,to);
        totalEarning = orderDAO.getTotalEarningByOrderDate(year, month,from ,to);

        List<Order> listOrder = orderDAO.getOrderByOrderDate(year, month,from ,to);
        AccountDAO accountDAO = new AccountDAO();
        List<Account> listAccount = accountDAO.getAllCustomer();
        List<Double> listAmount = orderDAO.getListAmountByDate(year, month,from ,to);
        List<String> listDay = orderDAO.getListDateByLatest(year, month,from ,to);
        
        

        request.setAttribute("fromDate", fromDate);
        request.setAttribute("toDate", toDate);
        request.setAttribute("listAccount", listAccount);
        request.setAttribute("listAmount", listAmount);
        request.setAttribute("listDay", listDay);
        request.setAttribute("accountName", account.getName());
        request.setAttribute("totalOrder", totalOrder);
        request.setAttribute("totalEarning", totalEarning);
        request.getRequestDispatcher("Admin/Admin_Dashboard.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SaleController;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;

/**
 *
 * @author DUC THINH
 */
public class SaleDashboardServlet extends HttpServlet {

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
            out.println("<title>Servlet SaleDashboardServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleDashboardServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Sale/saledashboard.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        String year_raw = request.getParameter("year");
        String month_raw = request.getParameter("month");
        String startDay_raw = request.getParameter("from");
        String endDay_raw = request.getParameter("to");
        
        OrderDAO od = new OrderDAO();
        
        int year = 0, month = 0, startDay = 0, endDay = 0;
        try {
            year = Integer.parseInt(year_raw);
            month = Integer.parseInt(month_raw);
            startDay = Integer.parseInt(startDay_raw);
            endDay = Integer.parseInt(endDay_raw);
        } catch (Exception e) {
        }
        int total = 0;
        int totalSuccess = 0;
        
        List<Order> listO = new ArrayList<>();
        List<Order> listSortO = new ArrayList<>();
        List<Double> listAmount = new ArrayList<>();
        List<String> listDay = new ArrayList<>();
        double sumTotal = 0;
        
        total = od.getTotalOrder(year, month, startDay, endDay);
        
        listO = od.getListOrder(year, month, startDay, endDay);
        for (Order o : listO) {
            sumTotal = sumTotal + o.getMoney();
        }
        listAmount = od.sortListOrderAmount(year, month, startDay, endDay);
        listDay = od.getListDateOrder(year, month, startDay, endDay);
        
        request.setAttribute("year", year);
        request.setAttribute("month", month);
        request.setAttribute("startDay", startDay);
        request.setAttribute("endDay", endDay);
        
        request.setAttribute("sumTotal", sumTotal);
        request.setAttribute("listAmount", listAmount);
        request.setAttribute("listDay", listDay);
        request.setAttribute("total", total);
        request.getRequestDispatcher("Sale/saledashboard.jsp").forward(request, response);
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

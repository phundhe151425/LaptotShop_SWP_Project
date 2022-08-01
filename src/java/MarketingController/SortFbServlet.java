/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MarketingController;

import dal.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Feedbacks;

/**
 *
 * @author MSI
 */
public class SortFbServlet extends HttpServlet {

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
            out.println("<title>Servlet SortFbServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortFbServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

        FeedbackDAO dao = new FeedbackDAO();
        List<Feedbacks> listFeedback = dao.getAllFeedbacks();
        String sort = request.getParameter("sort");
        listFeedback = dao.sortFb(sort, listFeedback);

        String index_raw = request.getParameter("index");
        if (index_raw == null) {
            index_raw = "1";
        }
        int index = Integer.parseInt(index_raw);

        int total = dao.getTotalFeedback();
        int page = total / 9;
        if (total % 9 != 0) {
            page += 1;
        }
        int start = (index - 1) * 9;
        int end = Math.min(index * 9, total);

        request.setAttribute("index", index);
        request.setAttribute("check", "sort");
        request.setAttribute("page", page);
        request.setAttribute("sort", sort);
        request.setAttribute("listFeedback", listFeedback.subList(start, end));
        request.getRequestDispatcher("feedbacklist.jsp").forward(request, response);
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

        FeedbackDAO dao = new FeedbackDAO();

        List<Feedbacks> listFeedback = dao.getAllFeedbacks();

        String sort = request.getParameter("sort");
        listFeedback = dao.sortFb(sort, listFeedback);

        String index_raw = request.getParameter("index");
        if (index_raw == null) {
            index_raw = "1";
        }
        int index = Integer.parseInt(index_raw);

        int total = listFeedback.size();
        int page = total / 9;
        if (total % 9 != 0) {
            page += 1;
        }
        int start = (index - 1) * 9;
        int end = Math.min(index * 9, total);

        // sider
        request.setAttribute("index", index);
        //end sider
        request.setAttribute("check", "sort");
        request.setAttribute("sort", sort);
        request.setAttribute("page", page);
        request.setAttribute("listFeedback", listFeedback.subList(start, end));
        request.getRequestDispatcher("feedbacklist.jsp").forward(request, response);
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

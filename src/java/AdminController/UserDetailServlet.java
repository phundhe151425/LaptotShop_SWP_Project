/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import dal.AccountDAO;
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
import model.Role;

/**
 *
 * @author Pham Minh Giang
 */
public class UserDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet UserDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserDetailServlet at " + request.getContextPath() + "</h1>");
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
        int id = 0;

            id = Integer.parseInt(request.getParameter("id"));
            AccountDAO a = new AccountDAO();
            Account ac = a.getAcountByID(id);
            List<Role> listRole = a.getAllRole();
            List<Integer> listStatus = new ArrayList();
            listStatus.add(1);
            listStatus.add(0);
            
            for (int i = 0; i < listRole.size(); i++) {
                if(listRole.get(i).getRoleName().equalsIgnoreCase(ac.getRole().getRoleName())){
                    listRole.remove(listRole.get(i));
                }
            }
            int status;
            if(ac.isStatus()){
                status = 1;
            }else{
                status = 0;
            }
            for (int i = 0; i < listStatus.size(); i++) {
                if(listStatus.get(i)==status){
                    listStatus.remove(listStatus.get(i));
                }
            }

            request.setAttribute("role", ac.getRole());
            request.setAttribute("status", ac.isStatus());
            request.setAttribute("RoleList", listRole);
            request.setAttribute("StatusList", listStatus);
            request.setAttribute("Account", ac);
       
        request.getRequestDispatcher("Admin/userdetail.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CartController;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;

/**
 *
 * @author MSI
 */
public class BuyServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        ProductDAO dao = new ProductDAO();
        List<Product> listProduct = dao.getAll();
        String p = request.getParameter("p");
        String index = request.getParameter("index");
        String id = request.getParameter("id");
        String num = request.getParameter("num");

        Product product = dao.getProductByID(id);
        int number = Integer.parseInt(num);
        
        String path = "";
        if (p.equals("home")) {
            path = "home";
            session.setAttribute("path", path);
        }
        if (p.equals("product")) {
            path = "product?index=" + index;
            session.setAttribute("path", path);
        }
        if (p.equals("detail")) {
            path = "productdetail?id=" + id;
            session.setAttribute("path", path);
        }

        if (session.getAttribute("account") == null) {
            response.sendRedirect("login");
        } 
        if(number > product.getQuantity()|| number<=0){
            request.setAttribute("Mess", "We only have " + product.getQuantity()+" product!");
//            request.getRequestDispatcher("productdetail?id="+ id).forward(request, response);
            response.sendRedirect("productdetail?id="+ id);
        }
        else {
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }

            if (txt.isEmpty()) {
                txt = id + ":" + num;
            } else {
                txt += "," + id + ":" + num;
            }
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(60 * 5);
            response.addCookie(c);
            response.sendRedirect(path);
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
        processRequest(request, response);
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

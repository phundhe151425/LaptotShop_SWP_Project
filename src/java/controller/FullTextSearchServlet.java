/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BrandDAO;
import dal.CPUDAO;
import dal.CategoryDAO;
import dal.DisplayDAO;
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
import model.Brand;
import model.CPU;
import model.Cart;
import model.Category;
import model.Display;
import model.Product;

/**
 *
 * @author Pham Minh Giang
 */
public class FullTextSearchServlet extends HttpServlet {

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
            out.println("<title>Servlet FullTextSearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FullTextSearchServlet at " + request.getContextPath() + "</h1>");
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

        ProductDAO p = new ProductDAO();

        String search = request.getParameter("search");
        String index_raw = request.getParameter("index");

        int total = p.getTotalProductBySearch(search);
        int page = total / 9;
        if (total % 9 != 0) {
            page += 1;
        }
        if (index_raw == null) {
            index_raw = "1";
        }
        int index = Integer.parseInt(index_raw);
        
        if(search == null && search == ""){
            response.sendRedirect("home");
        }
        List<Product> productList = p.ListProductSearchPaging(index, search);
         
        session.setAttribute("listProduct", productList);
//        int start = (index-1)*9;
//        int end = Math.min((index*9), total);
        
        List<Product> listProduct = p.getAll();      
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr != null){
            for (Cookie c : arr) {
                if(c.getName().equals("cart")){
                    txt += c.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, listProduct);
        request.setAttribute("cart", cart);

        session.setAttribute("productList", productList);
        request.setAttribute("check", "search");
        request.setAttribute("index", index);
        request.setAttribute("page", page);
        request.setAttribute("search", search);
        request.getRequestDispatcher("product.jsp").forward(request, response);
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

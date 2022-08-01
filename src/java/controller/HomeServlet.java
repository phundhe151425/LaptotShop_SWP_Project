/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BlogDAO;
import dal.BrandDAO;
import dal.CPUDAO;
import dal.CategoryDAO;
import dal.DisplayDAO;
import dal.ProductDAO;
import dal.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Blog;
import model.Brand;
import model.CPU;
import model.Cart;
import model.Category;
import model.Display;
import model.Product;
import model.Slider;

/**
 *
 * @author Pham Minh Giang
 */
public class HomeServlet extends HttpServlet {

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
            out.println("<title>Servlet HomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
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
        BlogDAO b = new BlogDAO();
        SliderDAO s = new SliderDAO();
        List<Product> listSell = p.getSaleProduct();
        List<Product> listNew = p.getNewProduct();
        List<Blog> blog = b.getAll();
        List<Slider> slider = s.getAll();

        List<Product> listProduct = p.getAll();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie c : arr) {
                if (c.getName().equals("cart")) {
                    txt += c.getValue();
                }
            }
        }

        CategoryDAO cate = new CategoryDAO();
        BrandDAO br = new BrandDAO();
        DisplayDAO d = new DisplayDAO();
        CPUDAO cpu = new CPUDAO();

        List<Category> categoryList = cate.getAll();
        List<Brand> brandList = br.getAll();
        List<Display> displayList = d.getAll();
        List<CPU> cpuList = cpu.getAll();

        session.setAttribute("cpuList", cpuList);
        session.setAttribute("displayList", displayList);
        session.setAttribute("brandList", brandList);
        session.setAttribute("categoryList", categoryList);

        Cart cart = new Cart(txt, listProduct);
        request.setAttribute("slider", slider);
        request.setAttribute("cart", cart);
        request.setAttribute("blog", blog);
        request.setAttribute("listSell", listSell);
        request.setAttribute("listNew", listNew);
//        request.setAttribute("pageInclude", "homepage.jsp");
        if (session.getAttribute("errorm") != null) {
            session.removeAttribute("errorm");
        }
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
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

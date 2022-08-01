/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MarketingController;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.CPU;
import model.Capacity;
import model.Card;
import model.Category;
import model.Display;
import model.OperatingSystem;
import model.Product;
import model.RAM;

/**
 *
 * @author DUC THINH
 */
public class ProductDetailManageServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductDetailManageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailManageServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        String id_raw = request.getParameter("id");
        String index = request.getParameter("index");
        int id = Integer.parseInt(id_raw);
        if(index == null){
            index = "1";
        }
        ProductDAO pd = new ProductDAO();
        Product p = (Product) pd.getProductByID(id);
        List<Brand> brandList = pd.getAllBrand();
        List<Category> categoryList = pd.getAllCategory();
        List<OperatingSystem> osList = pd.getAllOS();
        List<RAM> ramList = pd.getAllRAM();
        List<CPU> cpuList = pd.getAllCPU();
        List<Display> displayList = pd.getAllDisplay();
        List<Capacity> capacityList = pd.getAllCapacity();
        List<Card> cardList = pd.getAllCard();
        request.setAttribute("brandlist", brandList);
        request.setAttribute("categorylist", categoryList);
        request.setAttribute("oslist", osList);
        request.setAttribute("ramlist", ramList);
        request.setAttribute("cpulist", cpuList);
        request.setAttribute("displaylist", displayList);
        request.setAttribute("capacitylist", capacityList);
        request.setAttribute("cardlist", cardList);
        request.setAttribute("index", index);
        request.setAttribute("product", p);
        request.getRequestDispatcher("Marketing/productdetailmanage.jsp").forward(request, response);

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

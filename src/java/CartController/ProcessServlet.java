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
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author MSI
 */
public class ProcessServlet extends HttpServlet {

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
            out.println("<title>Servlet ProcessServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessServlet at " + request.getContextPath() + "</h1>");
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
        ProductDAO dao = new ProductDAO();
        List<Product> listProduct = dao.getAll();
        
        Cookie[] arr = request.getCookies();
        String txt = "";
        if(arr != null){
            for (Cookie o : arr) {
                if(o.getName().equals("cart")){
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        
        Cart cart = new Cart(txt, listProduct);
        String num_raw = request.getParameter("num");
        String id_raw = request.getParameter("id");
        int id, num;
        try {
            num = Integer.parseInt(num_raw);
            id = Integer.parseInt(id_raw);
            Product product = dao.getProductByID(id);
            int numStore = product.getQuantity();
            if(num == -1 && (cart.getQuantityByID(id) <= 1)){
                cart.deleteItem(id);
            }
            else{
                if(num==1 && cart.getQuantityByID(id) > numStore-1){
                    num = 0;
                }
                double price = product.getSaleprice();
                Item i = new Item(product, num, price);
                cart.addItem(i);
            }
        } catch (Exception e) {
        }
        
        List<Item> listItem = cart.getItem();
        txt = "";
        if(listItem.size() >0){
            txt = listItem.get(0).getProduct().getId() + ":"
                    +listItem.get(0).getQuantity();
            for (int i = 1; i < listItem.size(); i++) {
                txt += "," + listItem.get(i).getProduct().getId() + ":"
                    +listItem.get(i).getQuantity();
            }
        }
        
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(60*5);
        response.addCookie(c);
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("shopping-cart.jsp").forward(request, response);
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
        ProductDAO dao = new ProductDAO();
        List<Product> listProduct = dao.getAll();

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
        
        String id = request.getParameter("id");
        String[] ids = txt.split(",");
        String out = "";
        for (int i = 0; i < ids.length; i++) {
            String[] s = ids[i].split(":");
            if (!s[0].equals(id)) {
                if (out.isEmpty()) {
                    out = ids[i];
                } else {
                    txt += "," + ids[i];
                }
            }
        }
        if (!out.isEmpty()) {
            Cookie c = new Cookie("cart", out);
            c.setMaxAge(60 * 5);
            response.addCookie(c);
        }
        Cart cart = new Cart(out, listProduct);
        request.setAttribute("cart", cart);
//        request.setAttribute("pageInclude", "shopping-cart.jsp");
//        request.getRequestDispatcher("index.jsp").forward(request, response);
        request.getRequestDispatcher("shopping-cart.jsp").forward(request, response);
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

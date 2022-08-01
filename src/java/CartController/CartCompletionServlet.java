/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CartController;

import AccountController.SendEmail;
import Validate.Validate;
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
import model.Account;
import model.Cart;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author MSI
 */
public class CartCompletionServlet extends HttpServlet {

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
            out.println("<title>Servlet CartCompletionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartCompletionServlet at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        String name = request.getParameter("name").trim();
        String address = request.getParameter("address").trim();
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String note = request.getParameter("note");
        Validate va = new Validate();
        Account temp_ac = new Account();
        temp_ac.setName(name);
        temp_ac.setAddress(address);
        temp_ac.setEmail(email);
        temp_ac.setPhone(phone);
        session.setAttribute("temp_ac", temp_ac);
        session.setAttribute("note", note);
        boolean checkPhone = va.checkPhone(phone);
        String error;
        if (name == null || name.equals("")) {
            error = "Name can not empty";
            session.setAttribute("errorm", error);
            response.sendRedirect("cartcontact");
        } else {
            if (address == null || address.equals("")) {
                error = "Address can not empty";
                session.setAttribute("errorm", error);
                response.sendRedirect("cartcontact");
            } else {
                if (checkPhone == false) {
                    error = "Must be phone number in VietNam";
                    session.setAttribute("errorm", error);
                    response.sendRedirect("cartcontact");
                }

                if (checkPhone == true) {
                    if (session.getAttribute("errorm") != null) {
                        session.removeAttribute("errorm");
                    }
                    ProductDAO dao = new ProductDAO();
                    List<Product> listProduct = dao.getAll();

                    Cookie[] arr = request.getCookies();
                    String txt = "";
                    if (arr != null) {
                        for (Cookie o : arr) {
                            if (o.getName().equals("cart")) {
                                txt += o.getValue();
                            }
                        }
                    }
                    Cart cart = new Cart(txt, listProduct);
                    Account a = (Account) session.getAttribute("account");
                    if (a == null) {
                        response.sendRedirect("login");
                    } else {
                        SendEmail sendEmail = new SendEmail();
//            String code = sendEmail.randomAlphaNumeric(9);
                        double totalPrice = cart.getTotalPrice();
                        int orderID = dao.addOrder(a.getAccountID(), name, address, email, phone, note, cart);
                        List<OrderDetail> listOrderDetail = dao.getOrderDetail(orderID);
                        sendEmail.sendCartCompletion(a, orderID, email, name, phone, address, listOrderDetail);

                        Cookie c = new Cookie("cart", "");
                        c.setMaxAge(0);
                        response.addCookie(c);
                        request.setAttribute("orderid", orderID);
                        request.setAttribute("note", note);
                        request.setAttribute("totalprice", totalPrice);
                        request.setAttribute("listorder", listOrderDetail);
                        request.getRequestDispatcher("cartcompletion.jsp").forward(request, response);
                    }
                }
            }
        }
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

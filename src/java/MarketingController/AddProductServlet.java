/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MarketingController;

import Validate.Validate;
import dal.ProductDAO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
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
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class AddProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    private static final long SerialVersionUID = 1L;
    private static final String UPLOAD_DIR = "img";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String name = request.getParameter("name").trim();
        String price_raw = request.getParameter("price");
        String discount_raw = request.getParameter("discount");
        String quantity_raw = request.getParameter("quantity");
        String image = uploadFile(request);
        String description = request.getParameter("description");
        String brand_raw = request.getParameter("brand");
        String category_raw = request.getParameter("category");
        String os_raw = request.getParameter("os");
        String ram_raw = request.getParameter("ram");
        String cpu_raw = request.getParameter("cpu");
        String display_raw = request.getParameter("display");
        String capacity_raw = request.getParameter("capacity");
        String card_raw = request.getParameter("card");
        ProductDAO pd = new ProductDAO();
        String index_raw = request.getParameter("index");
        List<Product> productList = pd.getAllProductManage();
        int total = productList.size();
        int page = total / 5;
        if (total % 5 != 0) {
            page += 1;
        }
        if (index_raw == null) {
            index_raw = "1";
        }

        int index = Integer.parseInt(index_raw);
        int start = (index - 1) * 5;
        int end = Math.min((index * 5), total);
        List<Brand> brandList = pd.getAllBrand();
        List<Category> categoryList = pd.getAllCategory();
        List<OperatingSystem> osList = pd.getAllOS();
        List<RAM> ramList = pd.getAllRAM();
        List<CPU> cpuList = pd.getAllCPU();
        List<Display> displayList = pd.getAllDisplay();
        List<Capacity> capacityList = pd.getAllCapacity();
        List<Card> cardList = pd.getAllCard();
        session.setAttribute("listproduct", productList);
        request.setAttribute("productlist", productList.subList(start, end));
        request.setAttribute("image", image);
        request.setAttribute("description", description);
        request.setAttribute("brandid", brand_raw);
        request.setAttribute("osid", os_raw);
        request.setAttribute("ramid", ram_raw);
        request.setAttribute("cpuid", cpu_raw);
        request.setAttribute("displayid", display_raw);
        request.setAttribute("capacityid", capacity_raw);
        request.setAttribute("cardid", card_raw);
        request.setAttribute("brandlist", brandList);
        request.setAttribute("categorylist", categoryList);
        request.setAttribute("oslist", osList);
        request.setAttribute("ramlist", ramList);
        request.setAttribute("cpulist", cpuList);
        request.setAttribute("displaylist", displayList);
        request.setAttribute("capacitylist", capacityList);
        request.setAttribute("cardlist", cardList);
        request.setAttribute("index", index);
        request.setAttribute("page", page);
        request.setAttribute("type", "default");

        if (name == null || name.equals("")) {
            request.setAttribute("error", "Name can not empty");
            request.getRequestDispatcher("Marketing/productmanage.jsp").forward(request, response);
        } else {
            boolean checkProductExist = false;

            for (Product pro : productList) {
                if (pro.getName().equalsIgnoreCase(name)) {
                    checkProductExist = true;
                    break;
                }
            }
            if (checkProductExist) {
                request.setAttribute("error", "Product is already exist");
                request.getRequestDispatcher("Marketing/productmanage.jsp").forward(request, response);
            }
            if (checkProductExist == false) {
                double price = -1;
                float discount = -1;
                int quantity = -1;
                
                try {
                    price = Double.parseDouble(price_raw);
                    quantity = Integer.parseInt(quantity_raw);
                    discount = Float.parseFloat(discount_raw);
                } catch (Exception e) {
//                    request.getRequestDispatcher("Marketing/productmanage.jsp").forward(request, response);
                }          
                if (quantity < 0 || discount < 0 || discount > 1 || price < 0) {

                    request.getRequestDispatcher("Marketing/productmanage.jsp").forward(request, response);
                } else {
                    int brandid = Integer.parseInt(brand_raw);
                    int categoryid = Integer.parseInt(category_raw);
                    int osid = Integer.parseInt(os_raw);
                    int ramid = Integer.parseInt(ram_raw);
                    int cpuid = Integer.parseInt(cpu_raw);
                    int displayid = Integer.parseInt(display_raw);
                    int capacityid = Integer.parseInt(capacity_raw);
                    int cardid = Integer.parseInt(card_raw);
                    Product p = new Product();
                    Brand b = new Brand();
                    b.setId(brandid);
                    Category ca = new Category();
                    ca.setId(categoryid);
                    OperatingSystem o = new OperatingSystem();
                    o.setId(osid);
                    RAM r = new RAM();
                    r.setId(ramid);
                    CPU c = new CPU();
                    c.setId(cpuid);
                    Display d = new Display();
                    d.setId(displayid);
                    Capacity cap = new Capacity();
                    cap.setId(capacityid);
                    Card car = new Card();
                    car.setId(cardid);
                    p.setName(name);
                    p.setPrice(price);
                    p.setDiscount(discount);
                    p.setQuantity(quantity);
                    p.setImgURL(image);
                    p.setDescription(description);
                    p.setBrand(b);
                    p.setCategory(ca);
                    p.setOs(o);
                    p.setRam(r);
                    p.setCpu(c);
                    p.setDisplay(d);
                    p.setCapacity(cap);
                    p.setCard(car);
                    pd.addNewProduct(p);
                    response.sendRedirect("productmanage");
                }
            }
        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        try {
            Part filePart = request.getPart("image");
            fileName = (String) getFileName(filePart);
            String applicationPath = request.getServletContext().getRealPath("");
            String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {
                e.printStackTrace();
                fileName = "";
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }

        } catch (Exception e) {
            fileName = "";
        }
        return fileName;
    }

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        System.out.println("*****partHeader :" + partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }

        return null;
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

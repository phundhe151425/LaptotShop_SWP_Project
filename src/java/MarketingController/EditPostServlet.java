/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MarketingController;

import dal.BlogDAO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Blog;

/**
 *
 * @author Pham Minh Giang
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class EditPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long SerialVersionUID = 1L;
    private static final String UPLOAD_DIR = "img";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditPostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPostServlet at " + request.getContextPath() + "</h1>");
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
        String status_raw = request.getParameter("status");
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);
        int status = 0;
        if (status_raw.equals("Off")) {
            status = 1;
        }
        BlogDAO b = new BlogDAO();
        b.editStatus(status, id);

        List<Blog> listBlog = b.getAll();
        List<String> listAuthor = b.getAllAuthor();

        String index_raw = request.getParameter("index");
        if (index_raw == null) {
            index_raw = "1";
        }
        int index = Integer.parseInt(index_raw);
        int total = listBlog.size();
        int page = total / 5;
        if (total % 5 != 0) {
            page += 1;
        }
        int start = (index - 1) * 5;
        int end = Math.min((index * 5), total);

        session.setAttribute("listAuthor", listAuthor);
        request.setAttribute("check", "list");
        request.setAttribute("index", index);
        request.setAttribute("page", page);
        request.setAttribute("listBlog", listBlog.subList(start, end));
        request.getRequestDispatcher("Marketing/bloglist.jsp").forward(request, response);

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
        HttpSession session = request.getSession();

        String filename = null;

        String id_raw = request.getParameter("id");
        String title = request.getParameter("title");
        String image = uploadFile(request);
        String author = request.getParameter("author");
        String content = request.getParameter("content");
        int id = Integer.parseInt(id_raw);
        BlogDAO b = new BlogDAO();
        if (image == null || image.equals("")) {
            image = b.getBlogByID(id_raw).getImgURL();
        }

        if (author.trim().equals("") || title.trim().equals("")
                || content.trim().equals("")) {
            if(author.trim().equals("")){
                request.setAttribute("authorMess", "Author can not empty!");
            }
            if(title.trim().equals("")){
                request.setAttribute("titleMess", "Title can not empty!");
            }
            if(content.trim().equals("")){
                request.setAttribute("contentMess", "Content can not empty!");
            }
            
            Blog blog = b.getBlogByID(id_raw);
            request.setAttribute("blog", blog);
            request.getRequestDispatcher("Marketing/blogdetail.jsp").forward(request, response);
            
        } else {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
            String date = dtf.format(LocalDate.now()).toString();
            b.Update(id, title, image, author, content, date);

            Blog blog = b.getBlogByID(id_raw);

            request.setAttribute("blog", blog);
            request.getRequestDispatcher("Marketing/blogdetail.jsp").forward(request, response);
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

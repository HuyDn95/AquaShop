package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.entity.Category;
import model.entity.Product;

@WebServlet(name = "CategoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cid = request.getParameter("cid");
        
        CategoryDAO cDao = new CategoryDAO();
        ProductDAO pDao = new ProductDAO();
        
        List<Category> listC = cDao.getAllCategory();
        List<Product> listP = pDao.getProductByCID(cid); // Lấy cá theo loại
        
        request.setAttribute("listCC", listC);
        request.setAttribute("listP", listP);
        request.setAttribute("tag", cid); // Để đánh dấu menu đang chọn
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
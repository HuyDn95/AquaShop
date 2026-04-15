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

@WebServlet(name = "ProductServlet", urlPatterns = {"/products"})
public class ProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pDao = new ProductDAO();
        CategoryDAO cDao = new CategoryDAO();
        
        List<Product> list = pDao.getAllProduct();
        List<Category> listC = cDao.getAllCategory();
        
        request.setAttribute("listP", list);
        request.setAttribute("listCC", listC);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
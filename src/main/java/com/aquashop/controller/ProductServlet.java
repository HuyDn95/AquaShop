package com.aquashop.controller;

import com.aquashop.dao.CategoryDAO;
import com.aquashop.service.ProductService;
import com.aquashop.model.entity.Category;
import com.aquashop.model.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/products", "/product-create", "/product-edit", "/product-delete"})
public class ProductServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/product-create":
                showCreateForm(request, response);
                break;
            case "/product-edit":
                showEditForm(request, response);
                break;
            case "/product-delete":
                deleteProduct(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/product-create":
                createProduct(request, response);
                break;
            case "/product-edit":
                updateProduct(request, response);
                break;
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> listProducts = productService.getAllProducts();
        request.setAttribute("listProducts", listProducts);
        request.getRequestDispatcher("/views/product/list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> listCategories = categoryDAO.getAllCategory();
        request.setAttribute("listCategories", listCategories);
        request.getRequestDispatcher("/views/product/create.jsp").forward(request, response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        int stock = Integer.parseInt(request.getParameter("stock"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Product newProduct = new Product(0, name, price, image, description, stock, categoryId);
        productService.addProduct(newProduct);
        request.getSession().setAttribute("message", "Thêm sản phẩm mới thành công!");
        request.getSession().setAttribute("messageType", "success");
        response.sendRedirect("products");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productService.getProductById(id);
        List<Category> listCategories = categoryDAO.getAllCategory();
        request.setAttribute("product", existingProduct);
        request.setAttribute("listCategories", listCategories);
        request.getRequestDispatcher("/views/product/edit.jsp").forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        int stock = Integer.parseInt(request.getParameter("stock"));
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Product product = new Product(id, name, price, image, description, stock, categoryId);
        productService.updateProduct(product);
        request.getSession().setAttribute("message", "Cập nhật sản phẩm thành công!");
        request.getSession().setAttribute("messageType", "success");
        response.sendRedirect("products");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteProduct(id);
        request.getSession().setAttribute("message", "Xóa sản phẩm thành công!");
        request.getSession().setAttribute("messageType", "success");
        response.sendRedirect("products");
    }
}

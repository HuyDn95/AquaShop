package com.aquashop.controller;

import com.aquashop.dao.CategoryDAO;
import com.aquashop.model.entity.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends HttpServlet {
    private final CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {           
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteCategory(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            default:
                listCategory(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if ("insert".equals(action)) {
            insertCategory(request, response);
        } else if ("update".equals(action)) {
            updateCategory(request, response);
        }
    }

    private void listCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> list = categoryDAO.getAllCategory();
        request.setAttribute("listC", list);
        request.getRequestDispatcher("views/category/list.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/category/create.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category existingCategory = categoryDAO.getCategoryById(id);
        request.setAttribute("category", existingCategory);
        request.getRequestDispatcher("views/category/edit.jsp").forward(request, response);
    }

    private void insertCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String name = request.getParameter("name");
        categoryDAO.insertCategory(name);
        request.getSession().setAttribute("message", "Thêm danh mục mới thành công!");
        request.getSession().setAttribute("messageType", "success");
        response.sendRedirect("category");
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        categoryDAO.updateCategory(id, name);
        request.getSession().setAttribute("message", "Cập nhật danh mục thành công!");
        request.getSession().setAttribute("messageType", "success");
        response.sendRedirect("category");
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        categoryDAO.deleteCategory(id);
        request.getSession().setAttribute("message", "Xóa danh mục thành công!");
        request.getSession().setAttribute("messageType", "success");
        response.sendRedirect("category");
    }
}

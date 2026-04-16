package com.aquashop.controller;
import com.aquashop.dao.CustomerDAO;
import com.aquashop.model.entity.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    private final CustomerDAO customerDAO = new CustomerDAO();

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
                deleteCustomer(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "profile":
                showProfile(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if ("insert".equals(action)) {
            insertCustomer(request, response);
        } else if ("update".equals(action)) {
            updateCustomer(request, response);
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Customer> list = customerDAO.getAllCustomer();
        request.setAttribute("listCust", list);
        request.getRequestDispatcher("/views/customer/list.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/customer/create.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer existingCustomer = customerDAO.getCustomerById(id);
        request.setAttribute("customer", existingCustomer);
        request.getRequestDispatcher("views/customer/edit.jsp").forward(request, response);
    }

    private void showProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");

        if (account == null) {
            response.sendRedirect("login.jsp");
        } else {
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String role = request.getParameter("role");

        if (customerDAO.isUsernameExists(username)) {
            request.setAttribute("error", "Tên tài khoản đã tồn tại!");
            request.setAttribute("cust", new Customer(0, username, password, fullName, email, phone, address, role));
            request.getRequestDispatcher("views/customer/create.jsp").forward(request, response);
            return;
        }

        Customer c = new Customer(0, username, password, fullName, email, phone, address, role);
        customerDAO.insertCustomer(c);
        request.getSession().setAttribute("message", "Thêm khách hàng mới thành công!");
        request.getSession().setAttribute("messageType", "success");
        response.sendRedirect("customer");
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String newPassword = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String role = request.getParameter("role");

        Customer existingCustomer = customerDAO.getCustomerById(id);
        String password = (newPassword != null && !newPassword.trim().isEmpty()) 
                         ? newPassword : existingCustomer.getPassword();

        if (customerDAO.isUsernameExistsForUpdate(username, id)) {
            request.setAttribute("error", "Tên tài khoản đã tồn tại!");
            Customer c = new Customer(id, username, password, fullName, email, phone, address, role);
            request.setAttribute("customer", c);
            request.getRequestDispatcher("views/customer/edit.jsp").forward(request, response);
            return;
        }

        Customer c = new Customer(id, username, password, fullName, email, phone, address, role);
        customerDAO.updateCustomer(c);
        request.getSession().setAttribute("message", "Cập nhật thông tin khách hàng thành công!");
        request.getSession().setAttribute("messageType", "success");
        response.sendRedirect("customer");
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerDAO.deleteCustomer(id);
        request.getSession().setAttribute("message", "Xóa khách hàng thành công!");
        request.getSession().setAttribute("messageType", "success");
        response.sendRedirect("customer");
    }
}

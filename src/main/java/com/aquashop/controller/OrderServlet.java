package com.aquashop.controller;

import com.aquashop.model.entity.Order;
import com.aquashop.model.entity.OrderItem;
import com.aquashop.service.OrderService;
import com.aquashop.dao.CustomerDAO;
import com.aquashop.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {
    private final OrderService orderService = new OrderService();
    private final CustomerDAO customerDAO = new CustomerDAO();
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "add":
                showAddForm(req, resp);
                break;
            case "view":
                viewOrder(req, resp);
                break;
            case "delete":
                deleteOrder(req, resp);
                break;
            case "list":
            default:
                listOrders(req, resp);
                break;
        }
    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("customers", customerDAO.getAllCustomer());
        req.setAttribute("products", productService.getAllProducts());
        req.getRequestDispatcher("/views/order/create.jsp").forward(req, resp);
    }

    private void listOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> orders = orderService.getAllOrders();
        req.setAttribute("orders", orders);
        req.getRequestDispatcher("/views/order/list.jsp").forward(req, resp);
    }

    private void viewOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Order order = orderService.getOrderById(id);
        req.setAttribute("order", order);
        req.getRequestDispatcher("/views/order/detail.jsp").forward(req, resp);
    }

    private void deleteOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        if (orderService.deleteOrder(id)) {
            HttpSession session = req.getSession();
            session.setAttribute("message", "Xóa đơn hàng thành công!");
            session.setAttribute("messageType", "success");
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("message", "Xóa đơn hàng thất bại!");
            session.setAttribute("messageType", "danger");
        }
        resp.sendRedirect(req.getContextPath() + "/orders");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("create".equals(action)) {
            createOrder(req, resp);
        }
    }

    private void createOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int customerId = Integer.parseInt(req.getParameter("customerId"));
        String[] productIds = req.getParameterValues("productIds[]");
        String[] quantities = req.getParameterValues("quantities[]");
        String[] prices = req.getParameterValues("prices[]");

        Order order = new Order();
        order.setCustomerId(customerId);
        
        double totalAmount = 0;
        List<OrderItem> items = new ArrayList<>();
        
        if (productIds != null) {
            for (int i = 0; i < productIds.length; i++) {
                OrderItem item = new OrderItem();
                item.setProductId(Integer.parseInt(productIds[i]));
                item.setQuantity(Integer.parseInt(quantities[i]));
                item.setPrice(Double.parseDouble(prices[i]));
                items.add(item);
                totalAmount += item.getQuantity() * item.getPrice();
            }
        }
        
        order.setTotalAmount(totalAmount);
        orderService.createOrder(order, items);
        
        HttpSession session = req.getSession();
        session.setAttribute("message", "Thêm đơn hàng thành công!");
        session.setAttribute("messageType", "success");
        
        resp.sendRedirect(req.getContextPath() + "/orders");
    }
}
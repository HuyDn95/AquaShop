package com.aquashop.controller;


import com.aquashop.model.entity.OrderItem;
import com.aquashop.model.entity.User;
import com.aquashop.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/orders/create")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int customerId = Integer.parseInt(req.getParameter("customerId"));
        User user = (User) req.getSession().getAttribute("user");

        List<OrderItem> items = new ArrayList<>();

        // TODO: parse từ form (tạm hardcode test)
        OrderItem item = new OrderItem();
        item.setProductId(1);
        item.setQuantity(2);
        item.setPrice(100);

        items.add(item);

        OrderService service = new OrderService();
        service.createOrder(customerId, user.getId(), items);

        resp.sendRedirect("/orders");
    }
}
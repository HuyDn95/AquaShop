package com.aquashop.service;

import com.aquashop.dao.OrderDAO;
import com.aquashop.dao.OrderItemDAO;
import com.aquashop.model.entity.Order;
import com.aquashop.model.entity.OrderItem;

import java.util.List;

public class OrderService {
    private final OrderDAO orderDAO = new OrderDAO();
    private final OrderItemDAO orderItemDAO = new OrderItemDAO();

    public List<Order> getAllOrders() {
        return orderDAO.getAllOrders();
    }

    public Order getOrderById(int id) {
        Order order = orderDAO.getOrderById(id);
        if (order != null) {
            order.setOrderItems(orderItemDAO.getByOrderId(id));
        }
        return order;
    }

    public void createOrder(Order order, List<OrderItem> items) {
        int orderId = orderDAO.createOrder(order);
        if (orderId != -1) {
            for (OrderItem item : items) {
                item.setOrderId(orderId);
                orderItemDAO.createOrderItem(item);
            }
        }
    }

    public boolean updateOrderStatus(int orderId, String status) {
        // This method is no longer supported by the current database schema
        return false;
    }

    public boolean deleteOrder(int id) {
        // In a real app, we might want to delete order items first (or use ON DELETE CASCADE)
        // For simplicity, assuming ON DELETE CASCADE or manual handling if needed.
        return orderDAO.deleteOrder(id);
    }
}
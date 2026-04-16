package com.aquashop.dao;

import com.aquashop.model.entity.Order;
import com.aquashop.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.* FROM orders o " +
                     "JOIN customers c ON o.customer_id = c.id ORDER BY o.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setCustomerId(rs.getInt("customer_id"));

                order.setCreatedAt(rs.getTimestamp("created_at"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public Order getOrderById(int id) {
        String sql = "SELECT o.* FROM orders o " +
                     "JOIN customers c ON o.customer_id = c.id WHERE o.id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setCustomerId(rs.getInt("customer_id"));

                order.setCreatedAt(rs.getTimestamp("created_at"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                return order;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int createOrder(Order order) {
        String sql = "INSERT INTO orders (customer_id, total_amount) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, order.getCustomerId());
            ps.setDouble(2, order.getTotalAmount());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }


    public boolean deleteOrder(int id) {
        String sql = "DELETE FROM orders WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

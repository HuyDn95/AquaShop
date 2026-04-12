package com.aquashop.service;

import com.aquashop.model.entity.OrderItem;
import com.aquashop.utils.DBConnection;

import java.sql.*;
import java.util.List;

public class OrderService {

    public void createOrder(int customerId, int userId, List<OrderItem> items) {

        try (Connection conn = DBConnection.getConnection()) {

            conn.setAutoCommit(false); // 🔥 transaction

            // 1. insert order
            String orderSql = "INSERT INTO orders(customer_id, created_by) VALUES (?, ?)";
            PreparedStatement psOrder = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS);

            psOrder.setInt(1, customerId);
            psOrder.setInt(2, userId);
            psOrder.executeUpdate();

            ResultSet rs = psOrder.getGeneratedKeys();
            rs.next();
            int orderId = rs.getInt(1);

            // 2. loop items
            for (OrderItem item : items) {

                // check stock
                int stock = getProductQuantity(conn, item.getProductId());

                if (stock < item.getQuantity()) {
                    throw new RuntimeException("Không đủ hàng");
                }

                // insert item
                String itemSql = "INSERT INTO order_items(order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
                PreparedStatement psItem = conn.prepareStatement(itemSql);

                psItem.setInt(1, orderId);
                psItem.setInt(2, item.getProductId());
                psItem.setInt(3, item.getQuantity());
                psItem.setDouble(4, item.getPrice());
                psItem.executeUpdate();

                // update stock
                String updateSql = "UPDATE products SET quantity = quantity - ? WHERE id=?";
                PreparedStatement psUpdate = conn.prepareStatement(updateSql);

                psUpdate.setInt(1, item.getQuantity());
                psUpdate.setInt(2, item.getProductId());
                psUpdate.executeUpdate();
            }

            conn.commit();

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi tạo đơn hàng");
        }
    }

    private int getProductQuantity(Connection conn, int productId) throws Exception {
        String sql = "SELECT quantity FROM products WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, productId);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("quantity");
        }
        return 0;
    }
}
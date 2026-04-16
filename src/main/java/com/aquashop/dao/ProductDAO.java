package com.aquashop.dao;

import com.aquashop.model.entity.Category;
import com.aquashop.model.entity.Product;
import com.aquashop.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // Hàm lấy tất cả sản phẩm
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.*, c.name AS category_name FROM products p " +
                       "LEFT JOIN categories c ON p.category_id = c.id";

        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image_url"),
                        rs.getString("description"),
                        rs.getInt("stock"),
                        rs.getInt("category_id")
                );
                Category cat = new Category(rs.getInt("category_id"), rs.getString("category_name"));
                p.setCategory(cat);
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Hàm lọc sản phẩm theo danh mục (ID loại)
    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT p.*, c.name AS category_name FROM products p " +
                       "LEFT JOIN categories c ON p.category_id = c.id " +
                       "WHERE p.category_id = ?";

        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, cid);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getString("image_url"),
                            rs.getString("description"),
                            rs.getInt("stock"),
                            rs.getInt("category_id")
                    );
                    Category cat = new Category(rs.getInt("category_id"), rs.getString("category_name"));
                    p.setCategory(cat);
                    list.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductById(int id) {
        String query = "SELECT p.*, c.name AS category_name FROM products p " +
                       "LEFT JOIN categories c ON p.category_id = c.id " +
                       "WHERE p.id = ?";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Product p = new Product(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getString("image_url"),
                            rs.getString("description"),
                            rs.getInt("stock"),
                            rs.getInt("category_id")
                    );
                    Category cat = new Category(rs.getInt("category_id"), rs.getString("category_name"));
                    p.setCategory(cat);
                    return p;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertProduct(Product p) {
        String query = "INSERT INTO products (name, price, image_url, description, stock, category_id) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setString(3, p.getImage());
            ps.setString(4, p.getDescription());
            ps.setInt(5, p.getStock());
            ps.setInt(6, p.getCategoryId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product p) {
        String query = "UPDATE products SET name = ?, price = ?, image_url = ?, description = ?, stock = ?, category_id = ? WHERE id = ?";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setString(3, p.getImage());
            ps.setString(4, p.getDescription());
            ps.setInt(5, p.getStock());
            ps.setInt(6, p.getCategoryId());
            ps.setInt(7, p.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int id) {
        String query = "DELETE FROM products WHERE id = ?";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

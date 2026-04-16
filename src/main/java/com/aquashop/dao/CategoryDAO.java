package com.aquashop.dao;

import com.aquashop.model.entity.Category;
import com.aquashop.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM categories"; 
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public Category getCategoryById(int cid) {
        String query = "SELECT * FROM categories WHERE id = ?";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, cid);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Category(rs.getInt(1), rs.getString(2));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public void insertCategory(String cname) {
        String query = "INSERT INTO categories (name) VALUES (?)";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, cname);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void updateCategory(int cid, String cname) {
        String query = "UPDATE categories SET name = ? WHERE id = ?";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, cname);
            ps.setInt(2, cid);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteCategory(int cid) {
        String query = "DELETE FROM categories WHERE id = ?";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, cid);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}

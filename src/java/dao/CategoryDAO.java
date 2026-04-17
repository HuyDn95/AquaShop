package dao;
import context.DBContext;
import java.sql.*;
import java.util.*;
import model.entity.Category;
public class CategoryDAO {
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM categories"; 
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}

package dao;
import context.DBContext;
import java.sql.*;
import model.entity.Customer;
public class CustomerDAO {
    // Hàm check login
    public Customer login(String user, String pass) {
        String query = "SELECT * FROM customers WHERE [user] = ? AND [pass] = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, user);
            ps.setString(2, pass);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
}
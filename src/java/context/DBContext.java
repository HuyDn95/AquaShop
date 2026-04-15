package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    public Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/aquashop_db";
        String user = "root";
        String pass = "10112006";
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, pass);
    }
    public static void main(String[] args) {
        try {
            DBContext db = new DBContext();
            if (db.getConnection() != null) {
                System.out.println("SUCCESSFUL");
            }
        } catch (Exception e) {
            System.out.println("nope: " + e.getMessage());
        }
    }
}
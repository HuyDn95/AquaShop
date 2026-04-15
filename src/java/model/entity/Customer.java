package model.entity;

public class Customer {
    private int id;
    private String user;
    private String pass;
    private int isAdmin; // 1: Admin, 0: Khách

    public Customer() {}
    public Customer(int id, String user, String pass, int isAdmin) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.isAdmin = isAdmin;
    }
    // Getter & Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getUser() { return user; }
    public void setUser(String user) { this.user = user; }
    public String getPass() { return pass; }
    public void setPass(String pass) { this.pass = pass; }
    public int getIsAdmin() { return isAdmin; }
    public void setIsAdmin(int isAdmin) { this.isAdmin = isAdmin; }
}
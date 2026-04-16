# AquaShop - Hệ Thống Quản Lý Cửa Hàng Thủy Sinh

AquaShop là một ứng dụng web quản lý cửa hàng kinh doanh đồ thủy sinh, được xây dựng trên nền tảng Java Servlet/JSP theo mô hình MVC.

## 🚀 Công Nghệ Sử Dụng

*   **Ngôn ngữ:** Java 8 (JDK 1.8)
*   **Web Framework:** Java Servlet 4.0.1, JSP 2.3.3
*   **Thư viện:** JSTL 1.2
*   **Cơ sở dữ liệu:** MySQL 8.0.33
*   **Quản lý dự án:** Maven
*   **Giao diện:** HTML/CSS (Bootstrap), JavaScript

## ✨ Chức Năng Chính

Dự án bao gồm các chức năng quản lý cơ bản:
- **Dashboard:** Thống kê tổng quan.
- **Quản lý Sản phẩm:** Xem danh sách, thêm, sửa, xóa sản phẩm.
- **Quản lý Danh mục:** Phân loại sản phẩm.
- **Quản lý Khách hàng:** Lưu trữ thông tin khách hàng.
- **Quản lý Đơn hàng:** Tạo và theo dõi chi tiết đơn hàng.
- **Xác thực:** Đăng nhập và đăng xuất hệ thống.

## 🛠️ Hướng Dẫn Cài Đặt

### 1. Yêu cầu hệ thống
*   Java Development Kit (JDK) 1.8
*   Apache Maven
*   MySQL Server
*   Web Server (Apache Tomcat 9.0 trở lên)

### 2. Cấu hình Cơ sở dữ liệu
*   Tạo database có tên là `aquashop_db` trong MySQL.
*   Import các file SQL từ thư mục `Dump20260414` vào database vừa tạo.
*   Cấu hình thông tin kết nối trong file: `src/main/java/com/aquashop/utils/DBConnection.java`
    *   `url`: `jdbc:mysql://localhost:3306/aquashop_db`
    *   `username`: `root` (mặc định)
    *   `password`: `123456` (thay đổi theo máy của bạn)

### 3. Chạy ứng dụng
*   Sử dụng lệnh Maven để build project:
    ```bash
    mvn clean install
    ```
*   Deploy file `.war` vào Tomcat server hoặc chạy trực tiếp từ IntelliJ IDEA thông qua cấu hình Tomcat.

## 📂 Cấu Trúc Thư Mục

```text
AquaShop/
├── src/main/java/com/aquashop/
│   ├── controller/   # Xử lý các yêu cầu HTTP (Servlets)
│   ├── dao/          # Tương tác với cơ sở dữ liệu (Data Access Object)
│   ├── filter/       # Các bộ lọc (Encoding, Authentication)
│   ├── model/        # Các đối tượng Entity và DTO
│   ├── service/      # Xử lý logic nghiệp vụ
│   └── utils/        # Các lớp tiện ích (DB connection, Constants)
├── src/main/webapp/
│   ├── views/        # Giao diện người dùng (JSP)
│   └── assets/       # Tài nguyên tĩnh (CSS, JS, Images)
├── Dump20260414/     # Các file backup cơ sở dữ liệu
└── pom.xml           # File cấu hình Maven
```

## 📝 Ghi Chú
Dự án được thiết kế để phục vụ mục đích học tập và quản lý cửa hàng quy mô nhỏ.

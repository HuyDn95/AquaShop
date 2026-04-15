package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.entity.Customer;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer-profile"})
public class CustomerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer account = (Customer) session.getAttribute("acc");
        
        if (account == null) {
            // Nếu chưa đăng nhập thì đá về trang login của thằng Huy
            response.sendRedirect("login.jsp");
        } else {
            // Nếu rồi thì cho sang trang cá nhân (Huy hoặc Minh sẽ vẽ trang này)
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }
}
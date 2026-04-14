package com.aquashop.controller;

import com.aquashop.dao.UserDAO;
import com.aquashop.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class AuthServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.login(username, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            resp.sendRedirect("dashboard");
        } else {
            req.setAttribute("error", "Sai tài khoản");
            req.getRequestDispatcher("views/auth/login.jsp").forward(req, resp);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session != null && session.getAttribute("user") != null){
            response.sendRedirect("dashboard");
            return;
        }

        request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);


    }
}
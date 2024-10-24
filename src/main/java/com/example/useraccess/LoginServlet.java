package com.example.useraccess;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UserAccessManagement", "postgres", "viki@123")) {
            String sql = "SELECT id, role FROM users WHERE username = ? AND password = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2, password);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        HttpSession session = request.getSession();
                        session.setAttribute("userId", resultSet.getInt("id"));
                        session.setAttribute("role", resultSet.getString("role"));
                        String role = resultSet.getString("role");
                        if ("Employee".equals(role)) {
                            response.sendRedirect("requestAccess.jsp");
                        } else if ("Manager".equals(role)) {
                            response.sendRedirect("pendingRequests.jsp");
                        } else if ("Admin".equals(role)) {
                            response.sendRedirect("createSoftware.jsp");
                        }
                    } else {
                        response.sendRedirect("login.jsp?error=Invalid credentials");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

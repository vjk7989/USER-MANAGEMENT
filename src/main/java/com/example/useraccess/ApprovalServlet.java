package com.example.useraccess;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestId = request.getParameter("request_id");
        String action = request.getParameter("action");
        String status = action.equals("Approve") ? "Approved" : "Rejected";

        try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UserAccessManagement", "postgres", "viki@123")) {
            String sql = "UPDATE requests SET status = ? WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, status);
                statement.setInt(2, Integer.parseInt(requestId));
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("pendingRequests.jsp");
    }
}

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Request Access</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Request Access</h2>
    <form action="RequestServlet" method="post">
        <label for="software_id">Software Name:</label>
        <select id="software_id" name="software_id" required>
            <%
                try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UserAccessManagement", "postgres", "viki@123")) {
                    String sql = "SELECT id, name FROM software";
                    try (Statement statement = connection.createStatement();
                         ResultSet resultSet = statement.executeQuery(sql)) {
                        while (resultSet.next()) {
                            int id = resultSet.getInt("id");
                            String name = resultSet.getString("name");
            %>
            <option value="<%= id %>"><%= name %></option>
            <%
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </select>
        <label for="access_type">Access Type:</label>
        <select id="access_type" name="access_type" required>
            <option value="Read">Read</option>
            <option value="Write">Write</option>
            <option value="Admin">Admin</option>
        </select>
        <label for="reason">Reason for Request:</label>
        <textarea id="reason" name="reason" required></textarea>
        <input type="submit" value="Request Access">
    </form>
</body>
</html>

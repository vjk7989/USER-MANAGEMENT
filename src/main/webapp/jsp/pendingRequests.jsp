<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Pending Requests</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Pending Requests</h2>
    <table>
        <tr>
            <th>Employee Name</th>
            <th>Software Name</th>
            <th>Access Type</th>
            <th>Reason for Request</th>
            <th>Action</th>
        </tr>
        <%
            try (Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/UserAccessManagement", "postgres", "viki@123")) {
                String sql = "SELECT r.id, u.username, s.name, r.access_type, r.reason FROM requests r JOIN users u ON r.user_id = u.id JOIN software s ON r.software_id = s.id WHERE r.status = 'Pending'";
                try (Statement statement = connection.createStatement();
                     ResultSet resultSet = statement.executeQuery(sql)) {
                    while (resultSet.next()) {
                        int requestId = resultSet.getInt("id");
                        String username = resultSet.getString("username");
                        String softwareName = resultSet.getString("name");
                        String accessType = resultSet.getString("access_type");
                        String reason = resultSet.getString("reason");
        %>
        <tr>
            <td><%= username %></td>
            <td><%= softwareName %></td>
            <td><%= accessType %></td>
            <td><%= reason %></td>
            <td>
                <form action="ApprovalServlet" method="post">
                    <input type="hidden" name="request_id" value="<%= requestId %>">
                    <input type="submit" name="action" value="Approve">
                    <input type="submit" name="action" value="Reject">
                </form>
            </td>
        </tr>
        <%
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Sign Up</h2>
    <form action="SignUpServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <input type="hidden" name="role" value="Employee">
        <input type="submit" value="Sign Up">
    </form>
</body>
</html>

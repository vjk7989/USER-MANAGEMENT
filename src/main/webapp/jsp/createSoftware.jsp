<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Software</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h2>Create Software</h2>
    <form action="SoftwareServlet" method="post">
        <label for="name">Software Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea>
        <label for="access_levels">Access Levels:</label>
        <input type="checkbox" name="access_levels" value="Read"> Read
        <input type="checkbox" name="access_levels" value="Write"> Write
        <input type="checkbox" name="access_levels" value="Admin"> Admin
        <input type="submit" value="Create">
    </form>
</body>
</html>

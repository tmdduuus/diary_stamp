<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
</head>
<body>
<h2>hello spring framework</h2>
    <th>userId</th>
    <td>${loggedInUser.userId}</td>
    <th>userPassword</th>
    <td>${loggedInUser.userPassword}</td>
    <th>userName</th>
    <td>${loggedInUser.userName}</td>
    <th>userEmail</th>
    <td>${loggedInUser.userEmail}</td>
</body>
</html>
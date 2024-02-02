<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>환영합니다</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            text-align: center;
            margin-top: 100px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>환영합니다, <%= session.getAttribute("username") %>님!</h1>
        <p><a href="logout.jsp">로그아웃</a></p>
    </div>
</body>
</html>
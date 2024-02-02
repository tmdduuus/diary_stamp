<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션에서 사용자 정보를 가져옴
    String username = (String) session.getAttribute("username");
    // 이미 로그인된 경우 웰컴 페이지로 리다이렉트
    if (username != null && !username.isEmpty()) {
        response.sendRedirect("welcome.jsp");
        return; // 이후 코드를 실행하지 않음
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
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
        <h1>로그인</h1>
        <form action="loginProcess.jsp" method="post">
            <label for="username">사용자 이름: </label>
            <input type="text" id="username" name="username">
            <input type="submit" value="로그인">
        </form>
    </div>
</body>
</html>
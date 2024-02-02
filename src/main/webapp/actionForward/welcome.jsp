<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>환영합니다</title>
</head>
<body>
    <%
        // 전달된 이름을 가져옵니다.
        String userName = (String) request.getAttribute("userName");
    %>
    <h1>환영합니다, <%= userName %> 님!</h1>
</body>
</html>
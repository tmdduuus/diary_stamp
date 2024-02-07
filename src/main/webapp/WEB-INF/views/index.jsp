<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
    <script>
        window.onload = function() {
            <% if (Boolean.TRUE.equals(request.getAttribute("loginError"))) { %>
            alert('로그인이 필요한 서비스입니다.');
            <% } %>
        };
    </script>
</head>
<body>
    <h2>hello spring framework</h2>
    <a href="/join">회원가입</a>
    <a href="/login">로그인</a>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <script>
        window.onload = function() {
            <% if (Boolean.TRUE.equals(request.getAttribute("loginError"))) { %>
            alert('아이디나 비밀번호가 올바르지 않습니다.');
            <% } %>
        };
    </script>
</head>
<body>
<h2>로그인</h2>
<form action="login" method="post">
    <div>
        <label for="userId">아이디:</label>
        <input type="text" id="userId" name="userId" required>
    </div>
    <div>
        <label for="userPassword">비밀번호:</label>
        <input type="password" id="userPassword" name="userPassword" required>
    </div>
    <div>
        <input type="submit" value="로그인">
    </div>
</form>
</body>
</html>

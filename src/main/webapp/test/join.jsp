<!-- login.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>회원가입</h2>
    <form method="post" action="/join">
        <label for="userId">ID:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <label for="nickname">nickname:</label>
        <input type="text" id="nickname" name="nickname" required><br>

        <label for="email">email:</label>
        <input type="text" id="email" name="email" required><br>

        <label for="contact">contact:</label>
        <input type="text" id="contact" name="contact" required><br>

        <label for="birth">birth:</label>
        <input type="text" id="birth" name="birth" required><br>

        <input type="submit" value="Login">
    </form>

    <c:if test="${not empty error}">
        <p style="color: red">${error}</p>
    </c:if>
</body>
</html>

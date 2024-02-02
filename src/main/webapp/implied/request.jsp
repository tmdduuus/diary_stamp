<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP 내장 객체 예시</title>
</head>
<body>
    <form action="" method="post">
        <label for="name">이름 입력: </label>
        <input type="text" id="name" name="name">
        <input type="submit" value="제출">
    </form>
    <%-- 입력된 이름을 출력하기 위해 request 객체 사용 --%>
    <% String name = request.getParameter("name"); %>
    <p><%= "안녕하세요, " + name + "님!" %></p>
</body>
</html>
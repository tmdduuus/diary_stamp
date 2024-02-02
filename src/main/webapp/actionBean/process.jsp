<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="user" class="com.ktds.jspservlet.actionBean.UserBean" scope="session" />
<jsp:setProperty name="user" property="name" />
<!DOCTYPE html>
<html>
<head>
    <title>이름 처리 결과</title>
</head>
<body>
    <p>입력된 이름: <jsp:getProperty name="user" property="name" />
</p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   String userName = “홍길동";
   int userAge = 30;
   pageContext.setAttribute("userName", userName);
   pageContext.setAttribute("userAge", userAge);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EL 예시</title>
</head>
<body>
    <h1>사용자 정보</h1>
    <p>사용자 이름: ${userName}</p>
    <p>사용자 나이: ${userAge}</p>
</body>
</html>
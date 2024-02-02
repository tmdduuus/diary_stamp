<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL 예제</title>
</head>
<body>
    <h1>JSTL 예제</h1>
    <%-- 배열 정의 --%>
    <c:set var="myArray" value="${['Apple', 'Banana', 'Cherry', 'Date']}" />
    <%-- 배열 요소 반복 및 출력 --%>
    <ul>
        <c:forEach items="${myArray}" var="fruit">
            <li>${fruit}</li>
        </c:forEach>
    </ul>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>list</title>
</head>
<body>
    <table>
        <tr>
            <th>title</th>
            <th>date</th>
            <th>photo</th>
        </tr>
        <c:forEach items="${diaryList}" var="diary">
            <tr>
                <td>${diary.diary_id}</td>
                <td>
                    <a href="/diary?id=${diary.diary_id}">${diary.title}</a>
                </td>
                <td>${diary.photo}</td>
                <td>${diary.write_date}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
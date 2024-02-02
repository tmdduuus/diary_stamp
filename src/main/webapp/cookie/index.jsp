<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>쿠키 예제</title>
</head>
<body>
    <h1>쿠키 예제</h1>
    <%-- 쿠키를 확인하고 사용자 이름을 출력합니다. --%>
    <%
        String userName = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userName")) {
                    userName = cookie.getValue();
                    break;
                }
            }
        }
    %>
<%-- 사용자 이름이 저장되어 있지 않은 경우에만 입력 폼을 보여줍니다. --%>
    <% if (userName.isEmpty()) { %>
        <form action="setCookie.jsp" method="post">
            <label for="name">이름을 입력하세요:</label>
            <input type="text" id="name" name="name">
            <input type="submit" value="제출">
        </form>
    <% } else { %>
        <p>안녕하세요, <%= userName %>님!</p>
    <% } %>
</body>
</html>
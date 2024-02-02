<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // 사용자가 입력한 이름을 가져옵니다.
    String userName = request.getParameter("userName");
    // 이름을 request 객체에 저장합니다.
    request.setAttribute("userName", userName);%>
<jsp:forward page="welcome.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String username = request.getParameter("username");
    // 사용자 이름을 세션에 저장
    session.setAttribute("username", username);
    response.sendRedirect("welcome.jsp"); // 로그인 후 환영 페이지로 리다이렉트
%>
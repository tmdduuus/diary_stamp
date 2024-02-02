<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String userName = request.getParameter("name");

    // 쿠키 생성 및 사용자 이름 저장
    Cookie cookie = new Cookie("userName", userName);
    cookie.setMaxAge(3600); // 쿠키 유효 기간 설정 (1시간)
    response.addCookie(cookie);

    // 사용자를 다시 메인 페이지로 리다이렉트
    response.sendRedirect("index.jsp");
%>
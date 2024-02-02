<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 세션에서 사용자 정보를 삭제
session.removeAttribute("username");
response.sendRedirect("login.jsp"); // 로그아웃 후 로그인 페이지로 리다이렉트
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%!
String str1 = "안녕 ";
String str2 = "JSP";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloJSP</title>
</head>
<body>
	<h2> Hello <%= str2 %> </h2>
    <p>
        <%
        out.println(str2 + " " + str1 + "!!");
        %>
    </p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="book.test.UsersDAO" scope="application"/>
<jsp:useBean id="dto" class="book.test.UsersDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAction.jsp</title>
</head>
<body>
<%
	dto = dao.select(dto);
	session.setAttribute("login", dto);
%>
<jsp:forward page="main.jsp"/>
</body>
</html>
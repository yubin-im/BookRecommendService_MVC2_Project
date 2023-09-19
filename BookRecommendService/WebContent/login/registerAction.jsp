<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="service" class="book.test.UsersService" scope="session"/>
<jsp:setProperty property="*" name="dto"/> 
<%
	String msg = service.checkID(dto);
	request.setAttribute("registerMsg", msg);
	session.setAttribute("login", dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerAction.jsp</title>
</head>
<body>
<jsp:forward page="viewRegister.jsp"/>
</body>
</html>
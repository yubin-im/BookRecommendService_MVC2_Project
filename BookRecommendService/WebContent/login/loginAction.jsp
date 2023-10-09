<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="loginError.jsp"%>
<jsp:useBean id="dao" class="book.test.UsersDAO" scope="application"/>
<jsp:useBean id="dto" class="book.test.UsersDTO" scope="session"/>
<jsp:setProperty property="userID" name="dto"/>
<jsp:setProperty property="name" name="dto"/>
<jsp:setProperty property="genre1" name="dto"/>
<jsp:setProperty property="genre2" name="dto"/>
<jsp:setProperty property="email" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAction.jsp</title>
</head>
<body>
<%
	String pwd = request.getParameter("password");
	int password = pwd.hashCode();
	dto.setPassword(password);
	
	System.out.println(dto);
	dto = dao.select(dto);
	session.setAttribute("login", dto);
%>
<jsp:forward page="viewLogin.jsp"/>
</body>
</html>
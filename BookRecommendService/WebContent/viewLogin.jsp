<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="loginError.jsp"%>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewLogin.jsp</title>
</head>
<body>
<jsp:forward page="main.jsp"/>
</body>
</html>
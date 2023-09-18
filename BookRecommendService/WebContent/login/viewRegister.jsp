<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="registerError.jsp"%>
<jsp:useBean id="registerMsg" type="java.lang.String" scope="request"/>
<jsp:useBean id="dto" class="book.test.UsersDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewRegister.jsp</title>
</head>
<body>
<%=registerMsg %><br>
<jsp:forward page="/main/main.jsp"/>
</body>
</html>
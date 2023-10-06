<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="book.test.UsersDAO" scope="application"/>
<%
	String pwd = request.getParameter("password");
	int password = pwd.hashCode();
	String msg = userDAO.updatePassword(request.getParameter("userID"), password);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= msg%>
<a href="<%=request.getContextPath() %>/login/loginForm.html">로그인 화면으로 돌아가기</a>
</body>
</html>
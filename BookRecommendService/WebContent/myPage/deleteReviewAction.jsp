<%@page import="book.test.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteReviewAction.jsp</title>
</head>
<body>
<%
String bookID = request.getParameter("bookID");
String userID = request.getParameter("userID");

%>
<%=bookID %>
<%=userID %>
</body>
</html>
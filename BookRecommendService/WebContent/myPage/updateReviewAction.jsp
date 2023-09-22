<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="book.test.ReviewDTO"%>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="reviewDAO" class="book.test.ReviewDAO" scope="application"/>
<jsp:useBean id="reviewDTO" class="book.test.ReviewDTO" scope="request"/>
<jsp:setProperty property="bookID" name="reviewDTO"/>
<jsp:setProperty property="userID" name="reviewDTO" value="<%=login.getUserID() %>" />
<%
reviewDAO.update(reviewDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateReviewAction.jsp</title>
</head>
<body>

</body>
</html>
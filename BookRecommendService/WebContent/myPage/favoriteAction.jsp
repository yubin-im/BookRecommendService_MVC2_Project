<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="myPageError.jsp"%>
<jsp:useBean id="book" type="book.test.BooksDTO" scope="session"/>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="favorite" class="book.test.FavoriteDTO" scope="request"/>
<jsp:useBean id="favoriteService" class="book.test.FavoriteService" scope="application"/>
<jsp:setProperty name="favorite" property="bookID" value="<%=book.getBookID() %>"/>
<jsp:setProperty name="favorite" property="userID" value="<%=login.getUserID() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>favoriteAction.jsp</title>
</head>
<body>
<%
String result = favoriteService.insert(favorite);
session.setAttribute("result", result);
%>
<jsp:forward page="viewFavorite.jsp"/>
</body>
</html>
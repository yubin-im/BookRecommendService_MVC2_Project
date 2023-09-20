<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@page import="book.test.*, java.util.*"%>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="favoriteDAO" class="book.test.FavoriteDAO" scope="application"/>
<jsp:useBean id="bookDAO" class="book.test.BooksDAO" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
ArrayList<FavoriteDTO> favorites = favoriteDAO.selectAll(login.getUserID());
System.out.println("찜 도서 개수 : " + favorites.size());
ArrayList<BooksDTO> favorbooks = bookDAO.selectFavoriteBook(favorites);
request.setAttribute("favorbooks", favorbooks);
%>
<title>favoriteListAction.jsp</title>
</head>
<body>
<jsp:forward page="/myPage/viewFavoriteList.jsp" />
</body>
</html>
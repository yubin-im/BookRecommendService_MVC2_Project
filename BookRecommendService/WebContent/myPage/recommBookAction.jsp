<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="myPageError.jsp"%>
<%@ page import="book.test.*,java.util.*" %>
<jsp:useBean id="login" type = "book.test.UsersDTO" scope="session"/>
<jsp:useBean id="bookDAO" class="book.test.BooksDAO" scope="application"/>
<%
	System.out.println(login.getGenre1());
	ArrayList<BooksDTO> recommBooks = bookDAO.selectRecommBook(login.getGenre1(), login.getGenre2());
	System.out.println("추천도서 개수: " + recommBooks.size());
	request.setAttribute("recommBooks", recommBooks);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recommBookAction.jsp</title>
</head>
<body>

<jsp:forward page="/myPage/viewRecommBooks.jsp"/>
</body>
</html>
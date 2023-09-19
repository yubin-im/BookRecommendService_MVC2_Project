<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="book.test.*,java.util.Date" %>
<jsp:useBean id="booksdao" class="book.test.BooksDAO" scope="application"/>
<jsp:useBean id="booksdto" class="book.test.BooksDTO" scope="session"/>
<jsp:setProperty property="*" name="booksdto"/>
<!-- 도서 상세 보기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewBookDetailAction</title>
<%
int result = 0;
BooksDTO book = booksdao.select(booksdto);
System.out.println("도서 상세: " + book);
session.setAttribute("book", book);
%>
<jsp:forward page="viewBookDetail.jsp"/>
</head>
<body>
</body>
</html>
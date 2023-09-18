<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.test.*,java.util.*" %>
<jsp:useBean id="usertdao" class="book.test.UsersDAO" scope="application"/>
<jsp:useBean id="booksdao" class="book.test.BooksDAO" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookList</title>
<%
int result = 0;
ArrayList<BooksDTO> books = booksdao.selectAll();
System.out.println("도서 개수: " + books.size());
request.setAttribute("books", books);  // 리스트 데이터 가져오기
%>
</head>
<body>
<jsp:forward page="viewBookList.jsp"/>
</body>
</html>
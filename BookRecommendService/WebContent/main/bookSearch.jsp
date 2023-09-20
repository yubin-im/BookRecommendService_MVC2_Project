<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.test.*,java.util.*" %>
<jsp:useBean id="booksdao" class="book.test.BooksDAO" scope="application"/>
<!-- 도서 검색 리스트 출력 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookSearch</title>
<%
String searchQuery = request.getParameter("query");
ArrayList<BooksDTO> books = booksdao.selectSearch(searchQuery);
System.out.println(searchQuery + "(으)로 검색된 도서 개수: " + books.size());
request.setAttribute("books", books);  // 리스트 데이터 가져오기
%>
</head>
<body>
<jsp:forward page="viewBookSearch.jsp"/>
</body>
</html>
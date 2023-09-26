<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.test.*,java.util.*" %>
<jsp:useBean id="booksdao" class="book.test.BooksDAO" scope="application"/>
<!-- 도서 전체 리스트 출력 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookList</title>
<%
ArrayList<BooksDTO> books = booksdao.selectAllPaging(request);
System.out.println("도서 개수: " + books.size());
request.setAttribute("books", books);  // 리스트 데이터 가져오기

// 평균 별점이 가장 높은 도서 제목 가져오기
String title = booksdao.bestRankBook();
System.out.println("평균 별점이 가장 높은 도서: " + title);
request.setAttribute("title", title);
%>
</head>
<body>
<jsp:forward page="/main/viewBookListPaging.jsp"/>
</body>
</html>
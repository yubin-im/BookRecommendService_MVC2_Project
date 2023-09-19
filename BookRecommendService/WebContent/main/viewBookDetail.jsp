<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="main.jsp"%>
<%@ page import="book.test.*,java.util.Date" %>
<jsp:useBean id="book" type="book.test.BooksDTO" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewBookDetail</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>도서 제목</th>
				<th>출판사</th>
				<th>저자</th>
				<th>장르</th>
				<th>출간년도</th>
				<th>가격</th>
			</tr>
		</thead>
		
		<tr>
			<td><%=book.getTitle() %></td>
			<td><%=book.getPublisher() %></td>
			<td><%=book.getAuthors() %></td>
			<td><%=book.getGenre() %></td>
			<td><%=book.getPublicationDate() %></td>
			<td><%=book.getPrice() %></td>
		</tr>
	</table>
</body>
</html>
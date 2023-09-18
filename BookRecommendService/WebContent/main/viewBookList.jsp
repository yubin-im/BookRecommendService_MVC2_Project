<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="book.test.*" errorPage="top.html"%>
<jsp:useBean id="books" type="java.util.ArrayList" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewBookList</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>도서 제목</th>
				<th>출판사</th>
				<th>저자</th>
				<th>장르</th>
				<th>출간년도</th>
				<th>가격</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<%
		for(Object o: books) {
			BooksDTO book = (BooksDTO)o;
		%>
			<tr>
				<td><%=book.getBookID() %></td>
				<td><%=book.getTitle() %></td>
				<td><%=book.getPublisher() %></td>
				<td><%=book.getAuthors() %></td>
				<td><%=book.getGenre() %></td>
				<td><%=book.getPublicationDate() %></td>
				<td><%=book.getPrice() %></td>
				<td><%=book.getViews() %></td>
			</tr>
		<%
		}
		%>
		
	</table>
</body>
</html>
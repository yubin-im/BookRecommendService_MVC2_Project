
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="myPageError.jsp"%>
<%@ page import="book.test.*"%>
<jsp:useBean id="recommBooks" type="java.util.ArrayList" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 도서 목록</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f3f3f3;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px auto;
        background-color: #ffffff;
        box-shadow: 0px 0px 10px #888888;
    }

    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
    <h1>추천 도서 목록</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>도서 제목</th>
                <th>출판사</th>
                <th>저자</th>
                <th>장르</th>
            </tr>
        </thead>
        
        <%
        for(Object o: recommBooks) {
            BooksDTO book = (BooksDTO)o;
        %>
            <tr>
                <td><%=book.getBookID() %></td>
                <td><a href="<%=request.getContextPath() %>/main/bookDetail.jsp?bookID=<%=book.getBookID()%>" target="right"><%=book.getTitle() %></a></td>
                <td><%=book.getPublisher() %></td>
                <td><%=book.getAuthors() %></td>
                <td><%=book.getGenre() %></td>
            </tr>
        <%
        }
        %>
        
    </table>
</body>
</html>

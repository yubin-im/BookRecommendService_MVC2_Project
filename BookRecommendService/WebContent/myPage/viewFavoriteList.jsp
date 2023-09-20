<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="book.test.*" errorPage="myPageError.jsp"%>
<jsp:useBean id="favorbooks" type="java.util.ArrayList" scope="request"/>
<!-- 찜 목록 출력 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 도서 목록</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f3f3f3;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        padding: 20px;
        background-color: #337ab7;
        color: white;
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
        padding: 10px;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    a {
        text-decoration: none;
        color: #337ab7;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <h1>찜 도서 목록</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>도서 제목</th>
                <th>출판사</th>
                <th>저자</th>
                <th>장르</th>
                <th>조회수</th>
            </tr>
        </thead>
        
        <%
        for(Object o: favorbooks) {
            BooksDTO book = (BooksDTO)o;
        %>
            <tr>
                <td><%=book.getBookID() %></td>
                <td><a href="<%=request.getContextPath() %>/main/bookDetail.jsp?bookID=<%=book.getBookID()%>" target="right"><%=book.getTitle() %></a></td>
                <td><%=book.getPublisher() %></td>
                <td><%=book.getAuthors() %></td>
                <td><%=book.getGenre() %></td>
                <td><%=book.getViews() %></td>
            </tr>
        <%
        }
        %>
        
    </table>
</body>
</html>

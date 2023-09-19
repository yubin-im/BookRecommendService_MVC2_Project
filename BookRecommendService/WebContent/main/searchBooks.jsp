<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="book.test.*, java.util.ArrayList" errorPage="top.html" %>
<jsp:useBean id="books" type="java.util.ArrayList" scope="request" />

<%
// Get the search query from the request parameter
String query = request.getParameter("query");

// Create a list to store matching books
ArrayList<BooksDTO> matchingBooks = new ArrayList<>();

// Search for books that match the query
for (Object o : books) {
    BooksDTO book = (BooksDTO) o;
    if (book.getTitle().contains(query) || book.getAuthors().contains(query)) {
        matchingBooks.add(book);
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
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
    <h4>검색 결과</h4>
    <p>검색어: <%= query %></p>

    <table border="1">
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
        for (BooksDTO book : matchingBooks) {
        %>
            <tr>
                <td><%= book.getBookID() %></td>
                <td><a href="bookDetail.jsp?bookID=<%= book.getBookID() %>" target="right"><%= book.getTitle() %></a></td>
                <td><%= book.getPublisher() %></td>
                <td><%= book.getAuthors() %></td>
                <td><%= book.getGenre() %></td>
                <td><%= book.getViews() %></td>
            </tr>
        <%
        }
        %>
    </table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="main.jsp"%>
<%@ page import="book.test.*,java.util.Date" %>
<jsp:useBean id="book" type="book.test.BooksDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
request.setAttribute("book", book);
%>
<title>도서 상세 정보</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    table {
        border-collapse: collapse;
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0px 0px 10px #888888;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #333;
        color: #fff;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .heart-button {
        background-color: transparent;
        border: none;
        cursor: pointer;
        font-size: 24px;
        padding: 0;
    }

    .heart-button:hover {
        color: red;
    }
</style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>도서 제목</th>
                <th>출판사</th>
                <th>저자</th>
                <th>장르</th>
                <th>출간년도</th>
                <th>가격</th>
                <th>찜</th>
            </tr>
        </thead>
        
        <tr>
            <td><%=book.getTitle() %></td>
            <td><%=book.getPublisher() %></td>
            <td><%=book.getAuthors() %></td>
            <td><%=book.getGenre() %></td>
            <td><%=book.getPublicationDate() %></td>
            <td><%=book.getPrice() %></td>
            <td><button class="heart-button" onclick="addToFavorites()">❤</button></td>
        </tr>
    </table>

    <script>
    function addToFavorites() {
   	 window.location.href = "<%=request.getContextPath() %>/myPage/favoriteAction.jsp";
       // 여기에서 찜 기능을 구현하거나 favoriteAction.jsp로 이동하는 로직을 추가할 수 있습니다.
       // 예를 들어, AJAX 요청을 사용하여 서버에 찜 추가 요청을 보낼 수 있습니다.
       // 또는 form을 사용하여 favoriteAction.jsp로 이동할 수 있습니다.
       alert("도서를 찜 목록에 추가했습니다!");
        }
    </script>
</body>
</html>

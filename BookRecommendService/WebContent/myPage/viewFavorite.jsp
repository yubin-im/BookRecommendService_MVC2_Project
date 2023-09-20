<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="myPageError.jsp"%>
<jsp:useBean id="book" type="book.test.BooksDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 결과</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        background-color: #f0f0f0;
    }
    .container {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        padding: 20px;
        margin: 50px auto;
        max-width: 400px;
    }
    h1 {
        color: #333333;
    }
    p {
        font-size: 18px;
        margin-top: 10px;
        color: #007bff;
    }
    a {
        display: block;
        margin-top: 20px;
        font-size: 16px;
        color: #007bff;
        text-decoration: none;
    }
</style>
</head>
<body>
<div class="container">
    <h1>찜 결과</h1>
    <p><%= book.getTitle() %>이</p>
    <p><%=session.getAttribute("result") %></p>
    <a href="<%=request.getContextPath() %>/myPage/favoriteListAction.jsp">찜 목록으로 이동</a>
</div>
</body>
</html>

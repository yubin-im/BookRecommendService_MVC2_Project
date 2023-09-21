<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="book.test.*, java.util.*"%>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="book" type="book.test.BooksDTO" scope="session"/>
<jsp:useBean id="reviewDTO" class="book.test.ReviewDTO" scope="request"/>
<jsp:useBean id="reviewDAO" type="book.test.ReviewDAO" scope="application"/>
<jsp:setProperty name="reviewDTO" property="bookID" value="<%=book.getBookID() %>"/>
<jsp:setProperty name="reviewDTO" property="userID" value="<%=login.getUserID() %>"/>
<jsp:setProperty property="*" name="reviewDTO"/>
<!DOCTYPE html>
<html>
<head>
<%
reviewDAO.insert(reviewDTO);
%>
<meta charset="UTF-8">
<title>Review Submitted</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
    }
    .container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
    }
    .success-message {
        font-size: 20px;
        color: green;
        margin-bottom: 20px;
    }
    .go-to-reviews-button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
    }
</style>
</head>
<body>
<div class="container">
    <div class="success-message">
        리뷰가 성공적으로 제출되었습니다.
    </div>
    <a href="<%=request.getContextPath() %>/myPage/viewReview.jsp" class="go-to-reviews-button">내 리뷰 목록으로 가기</a>
</div>
</body>
</html>

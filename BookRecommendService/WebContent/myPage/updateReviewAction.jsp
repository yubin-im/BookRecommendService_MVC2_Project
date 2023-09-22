<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="reviewDAO" class="book.test.ReviewDAO" scope="application"/>
<jsp:useBean id="reviewDTO" class="book.test.ReviewDTO" scope="request"/>
<jsp:setProperty property="*" name="reviewDTO"/>
<jsp:setProperty property="userID" name="reviewDTO" value="<%=login.getUserID() %>"/>
<%
reviewDAO.update(reviewDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정 완료</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        padding: 20px;
        text-align: center;
    }

    h1 {
        color: #007bff;
    }

    .link-button {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        text-decoration: none;
        margin-top: 20px;
    }

    .link-button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <h1>리뷰 수정이 완료되었습니다.</h1>
    <a href="viewReview.jsp" class="link-button">리뷰 목록으로 이동</a>
</body>
</html>
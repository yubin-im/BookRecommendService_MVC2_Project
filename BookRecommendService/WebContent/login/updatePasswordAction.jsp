<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="book.test.UsersDAO" scope="application"/>
<%
    String pwd = request.getParameter("password");
    int password = pwd.hashCode();
    String userid = request.getParameter("userID");
    String msg = userDAO.updatePassword(userid, password);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        h2 {
            color: #155724;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        a {
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>비밀번호 변경 결과</h2>
    <p><%= msg %></p>
    <a href="<%= request.getContextPath() %>/login/loginForm.html">로그인 화면으로 돌아가기</a>
</div>
</body>
</html>

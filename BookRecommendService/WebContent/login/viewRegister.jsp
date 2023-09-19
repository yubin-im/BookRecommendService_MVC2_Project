<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="registerError.jsp"%>
<jsp:useBean id="registerMsg" type="java.lang.String" scope="request"/>
<jsp:useBean id="dto" class="book.test.UsersDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        .message {
            font-size: 18px;
            margin-top: 20px;
            color: #4CAF50;
        }

        .main-link {
            display: block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .main-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registration Successful!</h1>
        <p class="message"><%= registerMsg %></p>
        <a href="<%= request.getContextPath() %>/main/main.jsp" class="main-link">메인 페이지로 이동</a>
    </div>
</body>
</html>

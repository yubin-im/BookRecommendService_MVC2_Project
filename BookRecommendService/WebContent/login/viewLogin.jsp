<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="loginError.jsp"%>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
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

        .welcome-message {
            font-size: 20px;
            margin-top: 10px;
            color: #007bff;
        }

        .main-link {
            display: inline-block;
            margin-top: 20px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 18px;
            color: #fff;
            text-decoration: none;
            cursor: pointer;
        }
        .main-link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= login.getName() %>!</h1>
        <p class="welcome-message">안녕하세요! 환영합니다.</p>
        <a href="<%=request.getContextPath() %>/main/main.jsp" class="main-link">메인으로 이동</a>
    </div>
</body>
</html>

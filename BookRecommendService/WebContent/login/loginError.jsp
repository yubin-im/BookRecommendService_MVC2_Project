<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Error</title>
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
            color: #ff0000;
        }

        .error-message {
            font-size: 18px;
            margin-top: 10px;
            color: #ff0000;
        }

        .login-link {
            display: block;
            margin-top: 20px;
            font-size: 18px;
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Login Error</h1>
        <p class="error-message">아이디와 비밀번호를 확인하신 후 다시 시도하세요.</p>
        <a href="loginForm.html" class="login-link">로그인 창으로 돌아가기</a>
    </div>
</body>
</html>

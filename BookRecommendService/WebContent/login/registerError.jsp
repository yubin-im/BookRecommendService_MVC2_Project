<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Error</title>
<style>
    body {
        background-color: #f8d7da;
        font-family: Arial, sans-serif;
        text-align: center;
    }

    .container {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
        text-align: center;
    }

    h1 {
        color: #721c24;
    }

    .error-message {
        font-size: 18px;
        margin-top: 20px;
        color: #721c24;
    }

    .back-link {
        display: block;
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #dc3545;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
    }

    .back-link:hover {
        background-color: #c82333;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Error</h1>
        <p class="error-message">잘못된 경로입니다.</p>
        <a href="loginForm.html" class="back-link">로그인 창으로 이동</a>
    </div>
</body>
</html>

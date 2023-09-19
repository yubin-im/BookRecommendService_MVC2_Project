<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error - 잘못된 경로입니다.</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            text-align: center;
        }

        .container {
            margin: 100px auto;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 5px;
            box-shadow: 0px 0px 10px #888888;
        }

        h1 {
            color: #cc0000;
        }

        a {
            text-decoration: none;
            color: #0073e6;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>잘못된 경로입니다.</h1>
        <p>원하는 페이지를 찾을 수 없습니다.</p>
        <p><a href="<%=request.getContextPath() %>/login/loginForm.html">로그인 창으로 돌아가기</a></p>
    </div>
</body>
</html>

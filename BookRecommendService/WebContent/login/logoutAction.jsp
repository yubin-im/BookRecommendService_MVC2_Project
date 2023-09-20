<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>logoutAction.jsp</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .message-box {
            background-color: #ffffff;
            border: 1px solid #dddddd;
            padding: 20px;
            box-shadow: 0px 0px 10px #888888;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="message-box">
        <%
        // 세션 파기 (로그아웃)
        session.invalidate();
        %>
        <script>
            alert('로그아웃 되었습니다.');
            window.location.href = 'loginForm.html'; // 로그인 페이지로 이동
        </script>
    </div>
</body>
</html>

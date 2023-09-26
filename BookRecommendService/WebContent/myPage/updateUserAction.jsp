<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="book.test.UsersDAO" scope="application"/>
<jsp:useBean id="userDTO" class="book.test.UsersDTO" scope="page"/>
<jsp:setProperty property="*" name="userDTO"/>
<%
userDAO.update(userDTO);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 변경 완료</title>
    <!-- Bootstrap CSS (옵션) -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* 배경색 변경 */
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }

        .message {
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            margin: 0 auto;
            max-width: 400px;
        }

        .logout-button {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="logout-button">
    <script>
        alert('로그아웃 되었습니다.');
        window.top.location.href = "<%= request.getContextPath() %>/login/loginForm.html"; // 로그인 페이지로 이동
    </script>
    <%
    session.invalidate(); // 세션 파기 (로그아웃)
    %>
</div>
</body>
</html>

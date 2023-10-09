<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.test.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="userDAO" class="book.test.UsersDAO" scope="application"/>
<%
    String userID = request.getParameter("userID");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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

        label {
            font-size: 16px;
            font-weight: bold;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>비밀번호 변경</h2>
    <form action="updatePasswordAction.jsp" method="post" onsubmit="return validatePassword()">
        <input type="hidden" name="userID" value="<%= userID %>">
        <label for="password">새 비밀번호를 입력하세요:</label>
        <input type="password" name="password" id="password" required>
        <label for="confirmPassword">새 비밀번호 확인:</label>
        <input type="password" name="confirmPassword" id="confirmPassword" required>
        <input type="submit" value="비밀번호 변경">
    </form>
</div>

<script>
    function validatePassword() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;

        if (password !== confirmPassword) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>

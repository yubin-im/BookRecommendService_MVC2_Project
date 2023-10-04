<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        text-align: center;
        padding: 20px;
    }

    h1 {
        color: #155724;
        margin-bottom: 20px;
    }

    form {
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        padding: 20px;
        max-width: 400px;
        margin: 0 auto;
    }

    table {
        width: 100%;
    }

    td {
        padding: 10px;
    }

    input[type="email"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<h1>회원님의 이메일 주소를 입력해주세요</h1>
<form action="findUserIDAction.jsp">
    <table>
        <tr>
            <td>이메일 : </td>
            <td><input type="email" name="email"></td>
        </tr>
    </table>
    <input type="submit" value="전송">
</form>
</body>
</html>

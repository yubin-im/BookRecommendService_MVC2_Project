<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        padding: 20px;
    }

    h3 {
        text-align: center;
    }

    table {
        border-collapse: collapse;
        width: 60%;
        margin: 20px auto;
        background-color: #fff;
        box-shadow: 0px 0px 10px #888888;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #333;
        color: #fff;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    select, textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .submit-button {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    .reset-button {
        background-color: #ccc;
        color: #333;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
</style>
</head>
<body>
	<form action="updateReviewAction.jsp">
	 <input type="hidden" name="bookID" value="<%= request.getParameter("bookID") %>">
    <table>
        <tr>
            <th colspan="2"><h3>리뷰 작성칸</h3></th>
        </tr>
        <tr>
            <td>별점</td>
            <td>
                <select name="rank">
                    <option value="1">★</option>
                    <option value="2">★★</option>
                    <option value="3">★★★</option>
                    <option value="4">★★★★</option>
                    <option value="5">★★★★★</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <textarea name="reviewContent" rows="5" maxlength="150" placeholder="<%=request.getParameter("reviewContent")%>"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" class="submit-button" value="리뷰 수정">
                <input type="reset" class="reset-button" value="취소">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
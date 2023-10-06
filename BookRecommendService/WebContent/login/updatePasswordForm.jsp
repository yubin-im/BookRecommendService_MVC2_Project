<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.test.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="userDAO" class = "book.test.UsersDAO" scope="application"/>
<%
	String userID = request.getParameter("userID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
    <form action="updatePasswordAction.jsp" method="post">
    <input type="hidden" name="userID" value="<%= userID %>">
        <table>
            <tr>
                <td>바꿀 비밀번호를 입력하세요:</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="비밀번호 변경">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
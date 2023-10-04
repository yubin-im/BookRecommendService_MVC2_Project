<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="myPageError.jsp"%>
<jsp:useBean id="userDAO" class="book.test.UsersDAO" scope="application"/>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<%
userDAO.delete(login.getUserID());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteUserAction.jsp</title>
</head>
<body>
<div class="message-box">
        <%
        // 세션 파기 (회원 탈퇴))
        session.invalidate();
        %>
        <script>
            alert('회원이 탈퇴되었습니다.');
            window.top.location.href = "<%=request.getContextPath() %>/login/loginForm.html"; // 로그인 페이지로 이동
        </script>
    </div>
</body>
</html>
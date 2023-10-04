<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.test.SHA256"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="userDTO" type="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="service" class="book.test.UsersService" scope="application"/>
<%
	String userEmail = userDTO.getEmail();
	String code = null;
	if(request.getParameter("code") != null){
		code= request.getParameter("code");
	}
	boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	if(isRight == true){
		String msg = service.checkID(userDTO);
		request.setAttribute("registerMsg", msg);
		session.setAttribute("login", userDTO);
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이메일 인증에 실패했습니다.')");
		script.println("location.href='registerForm.jsp'");
		script.println("<script>");
		script.close();
		return;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerAction.jsp</title>
</head>
<body>
<jsp:forward page="viewRegister.jsp"/>
</body>
</html>
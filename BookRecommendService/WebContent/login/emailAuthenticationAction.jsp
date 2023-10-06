<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="java.util.Properties"%>
<%@ page import="book.test.SHA256"%>
<%@ page import="book.test.Gmail"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="userDTO" class="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="userDAO" class="book.test.UsersDAO" scope="application"/>
<jsp:setProperty property="userID" name="userDTO"/>
<jsp:setProperty property="name" name="userDTO"/>
<jsp:setProperty property="genre1" name="userDTO"/>
<jsp:setProperty property="genre2" name="userDTO"/>
<jsp:setProperty property="email" name="userDTO"/>
<%
	int pwd = request.getParameter("password").hashCode();
	userDTO.setPassword(pwd);
	
	String userID = request.getParameter("userID");
	String email = request.getParameter("email");
	boolean bool = userDAO.checkID(userID);
	boolean bool2 = userDAO.checkEmail(email);
	if(bool2){
%>		
		<script>
			alert("사용중인 이메일입니다.");
			history.back();
		</script>
<%
	}
	else{
	if(bool){
%>
		<script>
			alert("사용중인 아이디입니다.");
			history.back(); // 이전 페이지로 돌아가기
		</script>
<%	
	}
	else{
		String host = "http://localhost:8090/BookRecommendService/login/";
		String from = "rakyunkim@gmail.com";
		String to = userDTO.getEmail();
		String subject = "회원가입을 위한 이메일 인증 메일입니다.";
		
		String content = "<html><body style='font-family: Arial, sans-serif;'>";
		content += "<div style='background-color: #f4f4f4; padding: 20px;'>";
		content += "<h1 style='color: #155724;'>회원가입을 환영합니다!</h1>";
		content += "<p>안녕하세요, " + userDTO.getName() + "님!</p>";
		content += "<p>다음 링크를 클릭하여 이메일 인증 및 로그인을 완료하세요:</p>";
		content += "<p style='background-color: #d4edda; padding: 10px;'><a href='" + host + "registerAction.jsp?code=" + new SHA256().getSHA256(to) + "' style='color: #155724; text-decoration: none;'>이메일 인증하기</a></p>";
		content += "<p>이 링크는 24시간 동안 유효합니다.</p>";
		content += "</div>";
		content += "</body></html>";

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF8");
		Transport.send(msg);
		
		session.setAttribute("userDTO", userDTO);
	}	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="container mt-3" style="background-color: #f8f9fa;">
    <div class="alert alert-success mt-4" role="alert" style="background-color: #d4edda; border-color: #c3e6cb; color: #155724;">
        <h4 class="alert-heading">이메일 인증 메일이 전송되었습니다!</h4>
        <p class="mb-0">회원가입을 위해 입력한 이메일을 확인하셔서 인증을 진행해주세요.</p><br>
        <h4 class="mb-0">만약 이메일을 받지 못하셨다면 이메일 확인 후 다시 시도해주세요.</h4>
        <p><a href="javascript:window.history.back();">회원가입 화면으로 돌아가기</a></p>
    </div>
</section>
</body>
</html>
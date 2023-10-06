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
<%@page import="javafx.scene.control.Alert"%>
<jsp:useBean id="userDAO" class="book.test.UsersDAO" scope="application"/>
<%
	String massage = null;
	String userID = request.getParameter("userID");
	String email = userDAO.getEmail(userID);
	boolean idChekc = userDAO.checkID(userID);
	boolean emailCheck = userDAO.checkEmail(email);
	if(idChekc){
		if(emailCheck){
			massage = "해당 이메일로 패스워드가 전송되었습니다.";
			String host = "http://localhost:8090/BookRecommendService/login/";
			String from = "rakyunkim@gmail.com";
			String to = email;
			String subject = "회원정보를 찾기 위한 이메일입니다.";
			
			String content = "<html><body style='font-family: Arial, sans-serif;'>";
			content += "<div style='background-color: #f4f4f4; padding: 40px; text-align: center;'>";
			content += "<h1 style='color: #155724; font-size: 24px;'>이메일 인증에 성공하였습니다.</h1>";
			content += "<p style='font-size: 16px;'>비밀번호를 변경하려면 아래 링크를 누르세요</p>";
			content += "<br>"; // 줄 바꿈 추가
			content += "<p><a href='http://localhost:8090/BookRecommendService/login/updatePasswordForm.jsp?userID=" + userID + "' style='background-color: #007bff; color: #fff; text-decoration: none; padding: 10px 20px; border-radius: 5px; font-size: 16px;'>비밀번호 변경하기</a></p>";
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
		}
		else{
			massage = "존재하지 않는 이메일입니다. 확인 후 다시 시도해주세요";
		}
	}
	else{
		massage = "없는 아이디 입니다. 확인 후 다시 시도해주세요";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        text-align: center;
    }

    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        margin: 50px auto;
        max-width: 400px;
    }

    h1 {
        color: #155724;
    }

    p {
        font-size: 18px;
        margin: 10px 0;
    }

    a {
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        padding: 10px 20px;
        border-radius: 5px;
    }
</style>
</head>
<body>
<%=massage %>
</body>
</html>
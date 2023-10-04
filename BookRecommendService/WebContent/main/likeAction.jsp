<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="mainError.jsp"%>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="likeDAO" class="book.test.ReviewLikesDAO" scope="application"/>
<jsp:useBean id="likeDTO" class="book.test.ReviewLikesDTO" scope="page"/>
<jsp:useBean id="reviewDAO" class="book.test.ReviewDAO" scope="application"/>
<jsp:setProperty property="bookID" name="likeDTO"/>
<jsp:setProperty property="userID" name="likeDTO"/>
<jsp:setProperty property="likeUserID" name="likeDTO" value="<%=login.getUserID() %>"/>
<script>
<%
if(likeDAO.check(likeDTO)){
likeDAO.insert(likeDTO);
// String msg = "좋아요 완료";
reviewDAO.insertLike(likeDTO.getBookID(), likeDTO.getUserID());
%>
<%--     alert("<%= msg %>"); --%>
<%
}
else{
	likeDAO.delete(likeDTO);
// 	String msg = "좋아요 취소";
	reviewDAO.deleteLike(likeDTO.getBookID(), likeDTO.getUserID());
%>
<%--     alert("<%= msg %>"); --%>
<%
}
%>
//페이지 이동 후 자동으로 새로고침
window.location.href = "bookDetail.jsp";

</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a href = "<%=request.getContextPath() %>/main/bookList.jsp" target="right">메인</a></li>
		<li><a href = "<%=request.getContextPath() %>/myPage/recommBookAction.jsp" target="right">추천도서</a></li>
		<li><a href = "<%=request.getContextPath() %>/myPage/recommBook.jsp" target="right">마이페이지</a></li>
	</ul>
</body>
</html>
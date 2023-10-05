<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="book.test.*,java.util.Date" %>
<jsp:useBean id="booksdao" class="book.test.BooksDAO" scope="application"/>
<jsp:useBean id="booksdto" class="book.test.BooksDTO" scope="session"/>
<jsp:useBean id="reviewlikesdao" class="book.test.ReviewLikesDAO" scope="application"/>
<jsp:setProperty property="*" name="booksdto"/>
<!-- 도서 상세 보기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewBookDetailAction</title>
<%
//도서 상세 내용 가져오기
BooksDTO book = booksdao.select(booksdto);
System.out.println("도서 상세: " + book);
session.setAttribute("book", book);

//해당 책의 평균 별점 계산
double avgRank = booksdao.avgRank(booksdto.getBookID());
System.out.println(book.getTitle() + "의 평균 별점: " + avgRank);
request.setAttribute("avgRank", avgRank);

//해당 책을 찜한 사람 수 계산
int favoriteCount = booksdao.favoriteCount(booksdto.getBookID());
System.out.println(book.getTitle() + "을 찜한 사람의 수: " + favoriteCount);
request.setAttribute("favoriteCount", favoriteCount);

//베스트 리뷰 콘텐츠 가져옴
String bestReview = reviewlikesdao.bestReview(book.getBookID());
request.setAttribute("bestReview", bestReview);

%>
<jsp:forward page="viewBookDetail.jsp"/>
</head>
<body>
</body>
</html>
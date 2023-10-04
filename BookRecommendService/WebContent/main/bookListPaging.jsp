<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.test.*,java.util.*" %>
<jsp:useBean id="booksdao" class="book.test.BooksDAO" scope="application"/>
<jsp:useBean id="reviewlikesdao" class="book.test.ReviewLikesDAO" scope="application"/>
<!-- 도서 전체 리스트 출력 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookList</title>
<%
ArrayList<BooksDTO> books = booksdao.selectAllPaging(request);
System.out.println("도서 개수: " + books.size());
request.setAttribute("books", books);  // 리스트 데이터 가져오기

// 평균 별점이 가장 높은 도서 제목, bookid 가져오기
String title = booksdao.bestRankBook();
String bookid = booksdao.bestRankBookID();
request.setAttribute("title", title);
request.setAttribute("bookid", bookid);
System.out.println("평균 별점이 가장 높은 도서: " + title);

// 리뷰 좋아요 수가 가장 많은 리뷰 가져오기
String bestReview = reviewlikesdao.bestReview();
request.setAttribute("bestReview", bestReview);

// 리뷰 좋아요 수가 가장 많은 리뷰의 도서 제목, bookid 가져오기
String bestReviewTitle = reviewlikesdao.bestReviewTitle();
String bestReviewBookID = reviewlikesdao.bestReviewBookID();
request.setAttribute("bestReviewTitle", bestReviewTitle);
request.setAttribute("bestReviewBookID", bestReviewBookID);
System.out.println("베스트 리뷰: " + bestReview + "(도서: " + bestReviewTitle + ")");
%>
</head>
<body>
<jsp:forward page="/main/viewBookListPaging.jsp"/>
</body>
</html>
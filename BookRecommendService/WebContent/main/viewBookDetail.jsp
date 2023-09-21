<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- <%@ errorPage="mainError.jsp"%> --%>
<%@ page import="book.test.*, java.util.*" %>
<jsp:useBean id="book" type="book.test.BooksDTO" scope="session"/>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="favoriteDAO" class="book.test.FavoriteDAO" scope="page"/>
<jsp:useBean id="favoriteDTO" class="book.test.FavoriteDTO" scope="page"/>
<jsp:useBean id="reviewDTO" class="book.test.ReviewDTO" scope="page"/>
<jsp:useBean id="reviewDAO" class="book.test.ReviewDAO" scope="application"/>
<jsp:setProperty name="favoriteDTO" property="bookID" value="<%=book.getBookID() %>"/>
<jsp:setProperty name="favoriteDTO" property="userID" value="<%=login.getUserID() %>"/>
<jsp:setProperty name="reviewDTO" property="bookID" value="<%=book.getBookID() %>"/>
<jsp:setProperty name="reviewDTO" property="userID" value="<%=login.getUserID() %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
ArrayList<ReviewDTO> reviews = reviewDAO.selectAllBook(book.getBookID());
request.setAttribute("book", book);
boolean isBookInFavorites = favoriteDAO.check(favoriteDTO);
boolean isReviewCheck = reviewDAO.check(reviewDTO);
%>
<title>도서 상세 정보</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    table {
        border-collapse: collapse;
        width: 80%;
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

    .heart-button {
        background-color: transparent;
        border: none;
        cursor: pointer;
        font-size: 24px;
        padding: 0;
        color: <%=(isBookInFavorites) ? "red" : "black"%>;
    }

    .heart-button:hover {
        color: red;
    }
</style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>도서 제목</th>
                <th>출판사</th>
                <th>저자</th>
                <th>장르</th>
                <th>출간년도</th>
                <th>가격</th>
                <th>찜</th>
            </tr>
        </thead>
        
        <tr>
            <td><%=book.getTitle() %></td>
            <td><%=book.getPublisher() %></td>
            <td><%=book.getAuthors() %></td>
            <td><%=book.getGenre() %></td>
            <td><%=book.getPublicationDate() %></td>
            <td><%=book.getPrice() %></td>
            <td><button class="heart-button" onclick="addToFavorites()">❤</button></td>
        </tr>
    </table>
    <table border="1">
      <thead>
         <tr>
            <th>이름</th>
            <th>평점</th>
            <th>리뷰내용</th>
            <th>좋아요</th>
         </tr>
      </thead>
      
      <%
      for(Object o: reviews) {
         ReviewDTO review = (ReviewDTO)o;
      %>
         <tr>
            <td><%=review.getUserName() %></td>
            <td><%=review.getRank() %></td>
            <td><%=review.getReviewContent() %></td>
            <td><%=review.getLikes() %></td>
         </tr>
      <%
      }
      %>  
   </table>

    
    <!-- 리뷰쓰기 버튼 추가 -->
	<!-- 리뷰쓰기 버튼 추가 -->
	<button id="writeReviewButton" onclick="writeReview()" style="background-color: #007bff; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
   	 리뷰쓰기
	</button>
    <script>
    function addToFavorites() {
      	 window.location.href = "<%=request.getContextPath() %>/myPage/favoriteAction.jsp";
      	 
    }
 	// 리뷰쓰기 버튼 클릭 시 reviewForm.html로 이동하는 함수
    function writeReview() {
    // 리뷰를 이미 작성했는지 확인
    if (<%= isReviewCheck %>) {
        // 아직 리뷰를 작성하지 않은 경우
        window.location.href = "<%=request.getContextPath() %>/myPage/reviewForm.html";
       
    } else {
    	 // 이미 리뷰를 작성한 경우
        alert("리뷰는 하나만 작성 가능합니다.");
    }
}
    </script>
</body>
</html>

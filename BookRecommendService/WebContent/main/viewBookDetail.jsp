<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<!--     errorPage="mainError.jsp" -->
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
<jsp:useBean id="likeDAO" class="book.test.ReviewLikesDAO" scope="application"/>
<jsp:useBean id="likeDTO" class="book.test.ReviewLikesDTO" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
        text-align: center; /* 테이블 내용을 가운데 정렬 */
    }

    /* 다음 두 라인은 테이블의 thead에 있는 모든 th 엘리먼트에 적용됩니다. */
    table thead th {
        text-align: center;
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
    
    .delete-button {
    background-color: #f44336;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    }
    
    .update-button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 8px 15px;
        border-radius: 5px;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
    }
    
    .star-rating {
    font-size: 18px;
    display: inline-block;
        
    .star-filled {
    color: gold;
    }
    
    .star-empty {
    color: gray;
    }
    }

    #writeReviewButton, #buyBookButton {
        margin-top: 20px;
        margin-bottom: 20px;
    }

</style>
</head>
<body>
<h4 style="color: green; text-align: center;">평균 별점: <%=request.getAttribute("avgRank") %> 즐겨찾는 사람의 수: <%=request.getAttribute("favoriteCount") %></h4>

    <table border="1" style="width: 90%; margin: 0 auto;">
        <thead>
            <tr>
                <th>도서 제목</th>
                <th>출판사</th>
                <th>저자</th>
                <th>장르</th>
                <th>출간일</th>
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
        <!-- 리뷰쓰기 버튼 추가 -->
<div style="text-align: center;">
    <button id="writeReviewButton" onclick="writeReview()" style="background-color: #007bff; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
        리뷰쓰기
    </button>
    <!-- 책 사기 버튼 추가 -->
    <button id="buyBookButton" style="background-color: #007bff; color: #fff; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
        책 사기
    </button>
</div>
	
<table border="1" style="width: 90%; margin: 0 auto;">
    <thead>
        <tr>
            <th>이름</th>
            <th>평점</th>
            <th>리뷰내용</th>
            <th>좋아요</th>
            <th>삭제</th>
        </tr>
    </thead>
    
    <% if (reviews == null || reviews.isEmpty()) { %>
        <tr>
            <td colspan="5">작성된 리뷰가 없습니다. 리뷰를 작성해주세요.</td>
        </tr>
    <% } else { %>
        <% for (Object o : reviews) {
            ReviewDTO review = (ReviewDTO) o;
            String loggedInUserID = login.getUserID();
            String reviewUserID = review.getUserID();
            String reviewBookID = review.getBookID();
            likeDTO = new ReviewLikesDTO(reviewUserID, reviewBookID, login.getUserID());
            boolean canDeleteReview = loggedInUserID.equals(reviewUserID);
            boolean thumdsUp = likeDAO.check(likeDTO);
			String userName = reviewDAO.userName(review.getUserID());
        %>
            <tr>
                <td><%=userName %></td>
                <td>
    			<div class="star-rating">
        			<% int rank = review.getRank(); %>
        			<% for (int i = 1; i <= 5; i++) { %>
            				<% if (i <= rank) { %>
                			<i class="fas fa-star star-filled"></i> <!-- 별 아이콘 (채워진 별) -->
            			<% } else { %>
                			<i class="far fa-star star-empty"></i> <!-- 빈 별 아이콘 -->
            			<% } %>
        			<% } %>
    			</div>
				</td>
                <td style="max-width:600px; word-wrap: break-word;"><%= review.getReviewContent() %></td>
                <td>
                    <a href="likeAction.jsp?bookID=<%= review.getBookID() %>&userID=<%= review.getUserID() %>" class="like-button">
                    <% if (thumdsUp) { %>
                        <i class="far fa-thumbs-up"></i>
                    <% } else { %>
                        <i class="far fa-thumbs-down"></i>
                    <% } %>
                    <%= review.getLikes() %>
                    </a>
                </td>
                <td>
                    <% if (canDeleteReview) { %>
                        <div style="display: flex; justify-content: space-around;">
                            <form id="deleteForm<%= review.getBookID() %>" action="<%= request.getContextPath() %>/myPage/deleteReviewAction.jsp" method="post">
                                <input type="hidden" name="bookID" value="<%= review.getBookID() %>">
                                <button type="button" class="delete-button" onclick="confirmDelete('<%= review.getBookID() %>')">리뷰 삭제</button>
                            </form>
                            <form id="updateForm<%= review.getBookID() %>" action="<%= request.getContextPath() %>/myPage/updateReviewForm.jsp" method="post">
                                <input type="hidden" name="bookID" value="<%= review.getBookID() %>">
                                <input type="hidden" name="reviewContent" value="<%= review.getReviewContent() %>">
                                <button type="button" class="update-button" onclick="goToUpdateReview('<%= review.getBookID() %>')">리뷰 수정</button>
                            </form>
                        </div>
                    <% } %>
                </td>
            </tr>
        <% } %>
    <% } %>
</table>

    

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
    function confirmDelete(bookID) {
        if (confirm("정말로 이 리뷰를 삭제하시겠습니까?")) {
            // 확인을 눌렀을 때만 해당 폼을 서브밋합니다.
            document.getElementById("deleteForm" + bookID).submit();
        }
    }
    function goToUpdateReview(bookID) {
    	document.getElementById("updateForm" + bookID).submit();
    }
    // 책 사기 버튼 클릭 시 Kyobo Bookstore 검색 페이지로 이동하는 함수
    document.getElementById("buyBookButton").addEventListener("click", function() {
        // 책 제목을 가져와서 URL에 추가합니다.
        var bookTitle = "<%=book.getTitle()%>";
        var kyoboSearchURL = "https://search.kyobobook.co.kr/search?keyword=" + encodeURIComponent(bookTitle);
        
        // 새 창에서 Kyobo Bookstore 검색 결과 페이지 열기
        window.open(kyoboSearchURL, "_blank");
    });
    
    </script>
</body>
</html>

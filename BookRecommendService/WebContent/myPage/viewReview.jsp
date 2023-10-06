<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="book.test.*, java.util.*" errorPage="myPageError.jsp"%>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="reviewDAO" class="book.test.ReviewDAO" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta charset="UTF-8">
    <title>viewReviews.jsp</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            text-align: center;
        }
        .no-reviews {
            font-style: italic;
            color: #777;
        }
        .delete-button {
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 6px 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
        }
         .update-button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 6px 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
        }
        .star-rating {
    	font-size: 18px; /* 별 아이콘 크기 조절 */
    	display: inline-block; /* 가로 정렬을 위해 인라인 블록으로 설정 */
    	
		.star-filled {
    		color: gold; /* 채워진 별 아이콘의 색상 */
		}

		.star-empty {
    		color: gray; /* 빈 별 아이콘의 색상 */
		}
}
    </style>
</head>
<body>
    <h1>내가 작성한 리뷰</h1>
    <% ArrayList<ReviewDTO> reviews = reviewDAO.selectAll(login.getUserID()); %>
    <% if (reviews != null && !reviews.isEmpty()) { %>
        <table>
            <thead>
                <tr>
                    <th>책 제목</th>
                    <th >좋아요</th>
                    <th>평점</th>
                    <th>리뷰내용</th>
                    <th>리뷰 삭제</th> <!-- 리뷰 삭제 버튼 추가 -->
                    <th>리뷰 수정</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (ReviewDTO review : reviews) {
                	String bookTitle = reviewDAO.bookTitle(review.getBookID());
                %>
                    <tr>
                        <td style="max-width:600px; word-wrap: break-word;"><a href="<%=request.getContextPath() %>/main/bookDetail.jsp?bookID=<%=review.getBookID()%>" target="right"><%=bookTitle %></a></td>
                        <td style="text-align: center;"><%= review.getLikes() %></td>
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
                            <form action="deleteReviewAction.jsp" method="post" onsubmit="return confirm('정말로 이 리뷰를 삭제하시겠습니까?');">
                                <input type="hidden" name="bookID" value="<%= review.getBookID() %>">
                                <button type="submit" class="delete-button" style="display: block; margin: 0 auto;">삭제</button>
                            </form>
                        </td>
                          <td>
                            <form action="updateReviewForm.jsp" method="post">
                            <input type="hidden" name="bookID" value="<%= review.getBookID() %>">
                            <input type="hidden" name="reviewContent" value="<%= review.getReviewContent() %>">
                                <button type="submit" class="update-button" style="display: block; margin: 0 auto;">수정</button>
                            </form>
                        </td>
                    </tr>
                <%
                }
                %>
            </tbody>
        </table>
    <% } else { %>
        <p class="no-reviews">작성한 리뷰가 없습니다.</p>
    <% } %>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="book.test.*, java.util.*" %>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<jsp:useBean id="reviewDAO" class="book.test.ReviewDAO" scope="application"/>
<!DOCTYPE html>
<html>
<head>
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
        }
        .no-reviews {
            font-style: italic;
            color: #777;
        }
        .delete-button {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 6px 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
        }
         .update-button {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 6px 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
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
                    <th>좋아요</th>
                    <th>평점</th>
                    <th>리뷰내용</th>
                    <th>리뷰 삭제</th> <!-- 리뷰 삭제 버튼 추가 -->
                </tr>
            </thead>
            <tbody>
                <%
                for (ReviewDTO review : reviews) {
                %>
                    <tr>
                        <td><%= review.getBookTitle() %></td>
                        <td><%= review.getLikes() %></td>
                        <td><%= review.getRank() %></td>
                        <td><%= review.getReviewContent() %></td>
                        <td>
                            <form action="deleteReviewAction.jsp" method="post" onsubmit="return confirm('정말로 이 리뷰를 삭제하시겠습니까?');">
                                <input type="hidden" name="bookID" value="<%= review.getBookID() %>">
                                <button type="submit" class="delete-button">리뷰 삭제</button>
                            </form>
                        </td>
                          <td>
                            <form action="updateReviewForm.jsp" method="post">
                            	<%request.setAttribute("updateReview", review); %>
                                <input type="hidden" name="bookID" value="<%= review.getBookID() %>">
                                <button type="submit" class="update-button">리뷰 수정</button>
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

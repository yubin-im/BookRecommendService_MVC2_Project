<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.test.*,java.util.*" %>
<jsp:useBean id="reviewdao" class="book.test.ReviewDAO" scope="application"/>
<!-- 리뷰 워드 클라우드 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewWordcloud</title>
<%
ArrayList<ReviewDTO> reviews = reviewdao.reviewWordcloud();
System.out.println("리뷰 개수: " + reviews.size());
request.setAttribute("reviews", reviews);  // 리스트 데이터 가져오기

ArrayList<String> wordcloudData = new ArrayList<String>(); // 문자열 리스트로 변경

for (ReviewDTO review : reviews) {
    String reviewContent = review.getReviewContent();  
    // 리뷰 데이터를 가공하여 wordcloudData에 추가합니다.

    // 리뷰 내용을 공백을 기준으로 단어로 분할합니다.
    String[] wordsInReview = reviewContent.split("\\s+"); // 공백으로 분할, 정규표현식을 사용하여 공백을 여러 개 처리합니다.

    // 단어를 모든 단어 리스트에 추가합니다.
    for (String word : wordsInReview) {
        // 단어가 이미 wordcloudData에 있는지 확인합니다.
        if (!wordcloudData.contains(word)) {
            wordcloudData.add(word);
        }
    }
}

request.setAttribute("wordcloudData", wordcloudData); // 워드클라우드 데이터를 request 객체에 설정
%>
</head>
<body>
<jsp:forward page="/dataAnalysis/viewReviewWordcloud.jsp"/>
</body>
</html>

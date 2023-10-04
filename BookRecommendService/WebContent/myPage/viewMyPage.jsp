<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <!-- Bootstrap CSS 추가 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 페이지 전체 스타일링 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* 컨텐츠 컨테이너 스타일링 */
        .container {
            max-width: 600px; /* 컨테이너 최대 너비 설정 */
            margin: 20px auto;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px #888888;
            padding: 20px;
            text-align: left; /* 왼쪽 정렬로 변경 */
        }

        /* 버튼 스타일링 */
        .btn {
            display: block; /* 버튼을 블록 요소로 변경하여 단독으로 표시 */
            margin-top: 10px; /* 버튼 간의 간격 추가 */
        }

        /* 링크 스타일링 */
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><%=login.getName() %>님의 마이페이지</h2>
        <hr> <!-- 구분선 추가 -->

        <a href="<%= request.getContextPath() %>/myPage/favoriteListAction.jsp" class="btn btn-primary">내 찜 목록</a>
        <a href="<%= request.getContextPath() %>/myPage/viewReview.jsp" class="btn btn-primary">내가 작성한 리뷰 보기</a>
        <a href="<%= request.getContextPath() %>/myPage/updateUser.jsp" class="btn btn-primary">회원정보 변경</a>    
    </div>

    <!-- Bootstrap JavaScript 및 jQuery 추가 (선택 사항) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

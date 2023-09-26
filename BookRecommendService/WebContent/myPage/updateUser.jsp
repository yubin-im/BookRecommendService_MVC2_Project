<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 업데이트</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h3 class="text-center">회원 정보 업데이트</h3>
    <form name="updateForm" action="updateUserForm.jsp">
        <!-- 여기에 회원 정보 업데이트에 필요한 입력 필드 추가 -->
        <!-- 예: 이름, 책 장르 등 -->

        <div class="text-center">
            <button type="submit" class="btn btn-primary">정보 업데이트</button>
            <!-- 회원 탈퇴 버튼 -->
            <a href="deleteUserAction.jsp" class="btn btn-danger">회원 탈퇴</a>
        </div>
    </form>
</div>

<!-- Bootstrap JS 및 Popper.js (선택사항) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

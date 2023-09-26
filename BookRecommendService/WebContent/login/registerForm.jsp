<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 등록</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h3 class="text-center">회원 정보 등록</h3>
    <form name="form1" action="registerAction.jsp" onsubmit="return checkInput(form1);">
        <div class="form-group">
            <label for="userID">* 아이디</label>
            <input type="text" class="form-control" name="userID" required>
        </div>
        <div class="form-group">
            <label for="password">* 비밀번호</label>
            <input type="password" class="form-control" name="password" required>
        </div>
        <div class="form-group">
            <label for="name">* 이름</label>
            <input type="text" class="form-control" name="name" pattern="[가-힣]*" title="한글만 입력 가능합니다." required>
        </div>
        <div class="form-group">
            <label>* 선호하는 책 장르 선택</label><br>
            <label>* 문학</label>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre1" value="판타지" required>
                <label class="form-check-label">판타지</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre1" value="스릴러" required>
                <label class="form-check-label">스릴러</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre1" value="추리" required>
                <label class="form-check-label">추리</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre1" value="로맨스" required>
                <label class="form-check-label">로맨스</label>
            </div>
        </div>
        <div class="form-group">
            <label>* 비문학</label>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre2" value="과학" required>
                <label class="form-check-label">과학</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre2" value="컴퓨터" required>
                <label class="form-check-label">컴퓨터</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre2" value="철학" required>
                <label class="form-check-label">철학</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre2" value="성인물" required>
                <label class="form-check-label">성인물</label>
            </div>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">전송</button>
            <button type="reset" class="btn btn-secondary">취소</button>
        </div>
    </form>
</div>

<!-- Bootstrap JS 및 Popper.js (선택사항) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

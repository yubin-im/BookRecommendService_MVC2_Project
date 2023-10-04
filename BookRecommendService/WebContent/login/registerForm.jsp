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
    <form name="form1" action="emailAuthenticationAction.jsp" onsubmit="return checkInput(form1);">
        <div class="form-group">
		   	<label for="userID">아이디</label>
		    <input type="text" class="form-control" name="userID" pattern="[a-zA-Z0-9@.]*" title="알파벳, 숫자, '@', '.'만 입력 가능합니다." required>
		</div>
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" name="password" required>
        </div>
       <div class="form-group">
		    <label for="passwordConfirm">비밀번호 확인</label>
		    <input type="password" class="form-control" name="passwordConfirm" id="passwordConfirm" required>
		    <small class="text-danger" id="passwordError" style="display: none;">비밀번호가 일치하지 않습니다.</small>
		</div>
        <div class="form-group">
    		<label for="name">이름</label>
    		<input type="text" class="form-control" name="name" pattern="[가-힣]{1,6}" title="한글로 1자 이상 6자 이하로 입력하세요." required>
    		<small class="text-danger" id="nameError" style="display: none;">이름은 1자에서 6자 사이어야 합니다.</small>
		</div>
		<div class="form-group">
    		<label for="name">이메일</label>
    		<input type="email" class="form-control" name="email" required>
		</div>
        <div class="form-group">
            <label>선호하는 책 장르 선택</label><br>
            <label>문학</label>
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
            <label>비문학</label>
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
            <button type="button" class="btn btn-secondary" id="cancelButton">취소</button>
				<script>
					// 취소 버튼 클릭 시 이벤트 핸들러
					document.getElementById("cancelButton").addEventListener(
							"click", function() {
								// loginForm.html로 이동
								window.location.href = "loginForm.html";
							});
				</script>
        </div>
    </form>
</div>

<!-- Bootstrap JS 및 Popper.js (선택사항) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.forms['form1'].addEventListener('submit', function (event) {
        var nameInput = this.querySelector('input[name="name"]');
        var nameError = document.getElementById('nameError');

        if (nameInput.value.length > 6) {
            nameError.style.display = 'block';
            event.preventDefault(); // 폼 제출을 중단합니다.
        } else {
            nameError.style.display = 'none';
        }
    });
    document.forms['form1'].addEventListener('submit', function (event) {
        var passwordInput = this.querySelector('input[name="password"]');
        var passwordConfirmInput = this.querySelector('input[name="passwordConfirm"]');
        var passwordError = document.getElementById('passwordError');

        if (passwordInput.value !== passwordConfirmInput.value) {
            passwordError.style.display = 'block';
            event.preventDefault(); // 폼 제출을 중단합니다.
        } else {
            passwordError.style.display = 'none';
        }
    });
</script>
</body>
</html>

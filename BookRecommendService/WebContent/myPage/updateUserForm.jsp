<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="myPageError.jsp"%>
<!DOCTYPE html>
<jsp:useBean id="login" type="book.test.UsersDTO" scope="session"/>
<%
String userName = login.getName();
String password = login.getPassword();
String genre1 = login.getGenre1();
String genre2 = login.getGenre2();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 등록</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h3 class="text-center">회원 정보 변경</h3>
    <form name="form1" action="updateUserAction.jsp" onsubmit="return checkInput(form1);">
        <div class="form-group">
            <label for="userID">아이디</label>
            <input type="text" class="form-control" name="userID" value = "<%=login.getUserID()%>" readonly>
        </div>
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control" name="password" value = "<%=login.getPassword()%>" readonly>
        </div>
        <div class="form-group">
    		<label for="name">이름</label>
    		<input type="text" class="form-control" name="name" value="<%=login.getName()%>" pattern="[가-힣]{1,6}" title="한글로 1자 이상 6자 이하로 입력하세요." required>
    		<small class="text-danger" id="nameError" style="display: none;">이름은 1자에서 6자 사이어야 합니다.</small>
		</div>
        <div class="form-group">
    <label>선호하는 책 장르 선택</label><br>
    <label>문학</label>
    <div class="form-check">
        <input type="radio" class="form-check-input" name="genre1" value="판타지" <% if ("판타지".equals(genre1)) { %>checked<% } %> required>
        <label class="form-check-label">판타지</label>
    </div>
    	<div class="form-check">
        	<input type="radio" class="form-check-input" name="genre1" value="스릴러" <% if ("스릴러".equals(genre1)) { %>checked<% } %> required>
        	<label class="form-check-label">스릴러</label>
    	</div>
        <div class="form-check">
            <input type="radio" class="form-check-input" name="genre1" value="추리" <% if ("추리".equals(genre1)) { %>checked<% } %> required>
            <label class="form-check-label">추리</label>
        </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre1" value="로맨스" <% if ("로맨스".equals(genre1)) { %>checked<% } %> required>
                <label class="form-check-label">로맨스</label>
            </div>
        </div>
        <div class="form-group">
            <label>비문학</label>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre2" value="과학" <% if ("과학".equals(genre2)) { %>checked<% } %> required>
                <label class="form-check-label">과학</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre2" value="컴퓨터" <% if ("컴퓨터".equals(genre2)) { %>checked<% } %> required>
                <label class="form-check-label">컴퓨터</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre2" value="철학" <% if ("철학".equals(genre2)) { %>checked<% } %> required>
                <label class="form-check-label">철학</label>
            </div>
            <div class="form-check">
                <input type="radio" class="form-check-input" name="genre2" value="성인물" <% if ("성인물".equals(genre2)) { %>checked<% } %> required>
                <label class="form-check-label">성인물</label>
            </div>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary" >수정</button>
            <button type="button" class="btn btn-secondary" onclick="goBack()">취소</button>
        </div>
    </form>
</div>

<!-- Bootstrap JS 및 Popper.js (선택사항) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	function goBack() {
	    window.history.back(); // 브라우저의 이전 페이지로 이동
	}
	
    document.forms['form1'].addEventListener('submit', function (event) {
    	event.preventDefault(); 
    	
    	var confirmation = confirm("정말 수정하시겠습니까? 수정이 진행되면 자동으로 로그아웃 됩니다.");
   
    	   	
         if (!confirmation) return;
    	
    	
        var nameInput = this.querySelector('input[name="name"]');
        var nameError = document.getElementById('nameError');

        if (nameInput.value.length > 6) {
            nameError.style.display = 'block';
            event.preventDefault(); // 폼 제출을 중단합니다.
        } else {
            nameError.style.display = 'none';
        }
        
        document.forms['form1'].submit();   
    });
</script>
</body>
</html>

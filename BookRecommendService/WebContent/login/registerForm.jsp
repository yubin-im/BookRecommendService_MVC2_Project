<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerForm.jsp</title>
<script type  = "text/javascript"> 
function checkInput(form){
	userID = form.userID.value;
	password = form.password.value;
	name = form.name.value;
	genre1 = form.genre1.value;
	genre2 = form.genre2.value;
	var check = /^[가-힣]*$/;

	if(!userID || !password || !name ){
		var result = false;
		var msg = "모든 정보를 입력해주세요";
	}
	else if(!check.test(form.name.value)){
		//phone의 value는 숫자여야 함(a~z, A~Z, ㄱ~ㅎ 안됨) : regular experssion
		// RegExp 클래스가 있음
		//숫자 : check = /^[0-9]+$/
		var result = false;
		var msg = "이름을 정확하게 입력해주세요";
	}
	else{
		msg="회원가입이 진행중";
	}
	alert(msg);
	return result; // form - onsubmit = return false면 submit이 동작하지 않는다.
}
</script>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 등록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFD700;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .container h3 {
            text-align: center;
        }

        table {
            width: 100%;
        }

        table td {
            padding: 10px;
        }

        table .genre-label {
            padding-left: 20px;
        }

        input[type="text"], input[type="password"], input[type="radio"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"], input[type="reset"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<form name="form1" action = "registerAction.jsp" onsubmit="return checkInput(form1);"> 
<table>
<tr>
<th colspan = "2"><center><h3>회원 정보 등록</h3></center></th>
</tr>
	<tr>
	<td>*&lt;아이디&gt;</td><td><input name = "userID"></td>
	</tr>
	
	<tr>
	<td>*&lt;비밀번호&gt;</td><td><input type = "password" name = "password"></td>
	</tr>
	
	<tr>
	<td>*&lt;이름&gt;</td><td><input name = "name" value = "한글만 입력 가능합니다."></td>
	</tr>
	<tr>
	<td colspan="2" align="center">*&lt;선호하는 책 장르 선택&gt;</td>
	</tr>
	<tr>
	<td>*&lt;문&nbsp;학&gt;</td>
	 <td>
	<input type = "radio" name = "genre1" value = "판타지">판타지
	<input type = "radio" name = "genre1" value = "스릴러">스릴러
	<input type = "radio" name = "genre1" value = "추리">추리
	<input type = "radio" name = "genre1" value = "로맨스">로맨스
	</td>
	</tr>
	
	<tr>
	<td>*&lt;비&nbsp;문&nbsp;학&gt;</td>
	 <td>
	<input type = "radio" name = "genre2" value = "과학">과학
	<input type = "radio" name = "genre2" value = "컴퓨터">컴퓨터
	<input type = "radio" name = "genre2" value = "철학">철학
	<input type = "radio" name = "genre2" value = "성인물">성인물
	</td>
	</tr>
	
	<tr>
	<td>
	<input type = "submit" value = "전송">	
	<input type = "reset" value = "취소">
	</td>
	</tr>
	
</table>
</form>
</body>
</html>
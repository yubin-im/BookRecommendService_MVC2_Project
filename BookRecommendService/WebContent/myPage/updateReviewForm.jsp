<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<!-- Bootstrap CSS 추가 -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f4f4f4;
        padding: 20px;
    }

    .container {
        background-color: #fff;
        box-shadow: 0px 0px 10px #888888;
        padding: 20px;
        border-radius: 5px;
    }

    h3 {
        text-align: center;
    }

    select, textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-bottom: 10px;
    }

    .submit-button {
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    .reset-button {
        background-color: #ccc;
        color: #333;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
</style>
<script>
function validateForm() {
    var rank = document.forms["reviewForm"]["rank"].value;
    var reviewContent = document.forms["reviewForm"]["reviewContent"].value;

    if (rank === "0") {
        alert("별점을 선택해주세요.");
        return false;
    }

    if (reviewContent.trim() === "") {
        alert("리뷰 내용을 작성해주세요.");
        return false;
    }

    return true;
}
</script>
</head>
<body>
    <div class="container">
        <form name="reviewForm" action="updateReviewAction.jsp" onsubmit="return validateForm()">
            <input type="hidden" name="bookID" value="<%= request.getParameter("bookID") %>">
            <h3>리뷰 수정</h3>
            <div class="form-group">
                <label for="rank">별점</label>
                <select class="form-control" name="rank">
                    <option value="0">선택해주세요</option>
                    <option value="1">★</option>
                    <option value="2">★★</option>
                    <option value="3">★★★</option>
                    <option value="4">★★★★</option>
                    <option value="5">★★★★★</option>
                </select>
            </div>
            <div class="form-group">
                <label for="reviewContent">리뷰 내용</label>
                <textarea class="form-control" name="reviewContent" rows="5" maxlength="150" placeholder="<%=request.getParameter("reviewContent")%>"></textarea>
            </div>
            <div class="text-center">
                <input type="submit" class="btn btn-primary submit-button" value="리뷰 수정">
                <input type="reset" class="btn btn-secondary reset-button" value="취소">
            </div>
        </form>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            background-color: #333;
            overflow: hidden;
        }
        li {
            float: left;
        }
        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        li a:hover {
            background-color: #555;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #ffffff;
            box-shadow: 0px 0px 10px #888888;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* 검색 폼 스타일 */
        .search-form {
            text-align: right;
            margin: 10px;
        }

        .search-form label {
            font-weight: bold;
        }

        .search-form input[type="text"] {
            padding: 5px;
        }

        .search-form button {
            padding: 5px 10px;
            background-color: #333;
            color: white;
            border: none;
        }
    </style>
</head>
<body>
    <ul>
        <li><a href="<%=request.getContextPath() %>/main/bookList.jsp" target="right">메인</a></li>
        <li><a href="<%=request.getContextPath() %>/myPage/recommBookAction.jsp" target="right">추천도서</a></li>
        <li><a href="<%=request.getContextPath() %>/myPage/recommBook.jsp" target="right">마이페이지</a></li>
        <!-- 로그아웃 링크 추가 -->
        <li><a href="<%=request.getContextPath() %>/login/logoutAction.jsp" target="_top">로그아웃</a></li>
    </ul>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="book.test.*, java.util.*" errorPage="mainError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="books" type="java.util.ArrayList" scope="request"/>
<!-- 도서 전체 리스트 출력 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewBookList</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f3f3f3;
    }

    .main-table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px auto;
        background-color: #ffffff;
        box-shadow: 0px 0px 10px #888888;
    }

    .main-table th, .main-table td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    .main-table th {
        background-color: #f2f2f2;
    }

    .main-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .paging-table {
        width: 600px;
        margin: 0 auto;
    }
    
    /* 추가된 CSS 스타일 */
    .paging-table td {
        text-align: center;
    }
</style>
</head>
<body>
   <h4>평균 별점이 높은 작품</h4>
   
   <!-- 통합 검색 -->
   <div style="text-align: right;">
        <form action="bookSearch.jsp" method="GET">
            <label for="searchQuery">검색:</label>
            <input type="text" id="searchQuery" name="query" placeholder="통합 검색">
            <button type="submit">검색</button>
        </form>
    </div>


   <!-- 도서 목록 테이블 -->
   <table class="main-table" border="1">
      <thead>
         <tr>
            <th>번호</th>
            <th>도서 제목</th>
            <th>출판사</th>
            <th>저자</th>
            <th>장르</th>
         </tr>
      </thead>
      
      <%
      
      for(Object o: books) {
         BooksDTO book = (BooksDTO)o;
      %>
         <tr>
            <td><%=book.getBookID() %></td>
            <td><a href="bookDetail.jsp?bookID=<%=book.getBookID()%>" target="right"><%=book.getTitle()%></a></td>
            <td><%=book.getPublisher() %></td>
            <td><%=book.getAuthors() %></td>
            <td><%=book.getGenre() %></td>
         </tr>
      <%
      }
      %>  
   </table>
   
   <!-- 페이징 처리 -->
   <table class="paging-table">
		<tr>
			<td align="center">
				<!-- 처음 이전 링크 -->
				<c:if test="${pg>block}">
					[<a href="bookListPaging.jsp?pg=1">◀◀</a>]
					[<a href="bookListPaging.jsp?pg=${fromPage-1}">◀</a>]		
				</c:if>
				<c:if test="${pg<=block}">
					[<span style="color:gray">◀◀</span>]	
					[<span style="color:gray">◀</span>]
				</c:if>
		
				<!-- 블록 범위 찍기 -->
				<c:forEach begin="${fromPage}" end="${toPage}" var="i">
					<c:if test="${i==pg}">[${i}]</c:if>
					<c:if test="${i!=pg}">
						[<a href="bookListPaging.jsp?pg=${i}">${i}</a>]
					</c:if>
				</c:forEach>
		
				<!-- 다음, 이후 -->
				<c:if test="${toPage<allPage}">
						[<a href="bookListPaging.jsp?pg=${toPage+1}">▶</a>]
						[<a href="bookListPaging.jsp?pg=${allPage}">▶▶</a>]
				</c:if>
				<c:if test="${toPage>=allPage}">
						[<span style="color:gray">▶</span>]
						[<span style="color:gray">▶▶</span>]
		
				</c:if>		
			</td>
		</tr>
	</table>
</body>
</html>
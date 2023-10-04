<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<frameset rows="20%, *">
  		<frame src="<%=request.getContextPath() %>/main/top.html" name="top">
<frameset cols="150, *">
        <frame src="<%=request.getContextPath() %>/main/left.jsp" name="left">
        <frame src="<%=request.getContextPath() %>/main/bookListPaging.jsp" name="right">
</frameset>
</frameset>
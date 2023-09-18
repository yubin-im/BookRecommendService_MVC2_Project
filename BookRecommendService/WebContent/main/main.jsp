<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<frameset rows="20%, *">
  <frame src="<%=request.getContextPath() %>/main/top.html" name="top">
  <frameset cols="150, *">
      <frame src="<%=request.getContextPath() %>/main/left.html" name="left">
      <frame src="<%=request.getContextPath() %>/main/bookList.jsp" name="right">
  </frameset>
</frameset>
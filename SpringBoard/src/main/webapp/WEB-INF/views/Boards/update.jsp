<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="Pkg.Boards.VO.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
<%
	BoardVO vo=(BoardVO)request.getAttribute("boardVO");


%>
	<div>
		<form name="boardUpdateForm" method="post" action="updateBoard">
			<div>작성자:<input type="text" name="userID" value="<%=vo.getUserID()%>"/></div>
			<div>글제목:<input type="text" name="title" value="<%=vo.getTitle()%>"/></div>
			<div>글번호:<input type="text" name="idx" value="<%=vo.getIdx()%>"/></div>
			<div><input type="submit" value="확인"/></div>
		</form>	
	</div>
	
</body>
</html>
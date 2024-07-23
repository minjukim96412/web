<%@page import="jspbasic.board.Board"%>
<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	BoardInterface bi = new BoardDao();
	Board board = bi.getBoard(Integer.parseInt(request.getParameter("bid")));
	pageContext.setAttribute("board", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<link rel="stylesheet" href="../css/boardUpdate.css" />
</head>
<body>
	<div id="wrapper">
	<h2>게시물 수정</h2>
	<form method="post" action="boardUpdateProc.jsp" enctype="multipart/form-data">
		<input type="hidden" name="bid" value="${board.bid}"/>
		분류 : <select name="bsort">
				<option value="자유" <c:if test="${board.bsort=='자유'}">selected</c:if>>자유</option>
				<option value="공지" <c:if test="${board.bsort=='공지'}">selected</c:if>>공지</option>
				<option value="사진" <c:if test="${board.bsort=='사진'}">selected</c:if>>사진</option>
			</select><br />
		제목 : <input type="text" name="btitle" value="${board.btitle}" /><br />
		내용 : <textarea name="bcontent" rows="25" >${board.bcontent}</textarea><br />
		첨부파일 : ${board.cfn}
				<input type="file" name="cfn" value="${board.cfn}" /><br />
		<input type="submit" value="확인" />
	</form>
</div>
</body>
</html>
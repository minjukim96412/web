<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@page import="jspbasic.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BoardInterface bi = new BoardDao();
	Board board =  bi.getBoard(bid);
	
	bi.addCount(bid);
	pageContext.setAttribute("board", board);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<link rel="stylesheet" href="../css/boardView.css" />
</head>
<body>
<div id="wrapper">
	<h2>게시물 보기</h2>
		<p>no. ${board.bid} </p>
		<h3>제목 : ${board.btitle}</h3>
		<p>분류 :  ${board.bsort}</p>
		<p></p>
		<p></p>
		<%
			pageContext.setAttribute("lineChar", "\n");
		%>
		내용<br />
		${fn:replace(board.bcontent, lineChar, '<br />')}<br />
		작성자 : ${board.bwriter}<br />
		조회수 : ${board.bcount}<br />
		등록일시 : <fmt:formatDate value="${board.bregdate}" pattern="yy/MM/dd HH:mm:ss" /> <br /> 
		<p><input type="button" value="목록" onclick="location.href='boardListProc.jsp'" /></p>
</div>
</body>
</html>
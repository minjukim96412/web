<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="jspbasic.board.Board" />
<jsp:setProperty name="board" property="*" />
<%
	BoardInterface bi = new BoardDao();
	int result = bi.updateBoard(board);
	if (result > 0) {
		System.out.println("수정 성공!");
	} else {
		System.out.println("수정 실패!");
	}
	response.sendRedirect("boardListProc.jsp");
%>
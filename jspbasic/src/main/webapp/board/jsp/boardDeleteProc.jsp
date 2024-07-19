<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardInterface bi = new BoardDao();
	int bid = Integer.parseInt(request.getParameter("bid"));
	int result = bi.deleteBoard(bid);
	if (result > 0) {
		System.out.print("정상적으로 삭제 완료!");
	} else {
		System.out.print("삭제 실패!");
	}
	response.sendRedirect("boardListProc.jsp");	
%>
<%@page import="java.io.File"%>
<%@page import="jspbasic.board.Board"%>
<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String realpath = "D:/upload";

	BoardInterface bi = new BoardDao();
	int bid = Integer.parseInt(request.getParameter("bid"));
	Board board = bi.getBoard(bid);
	
	File file = new File(realpath + "/" + board.getCfn());
	if(file.exists())file.delete();
	
	int result = bi.deleteBoard(bid);
	if (result > 0) {
		System.out.print("정상적으로 삭제 완료!");
	} else {
		System.out.print("삭제 실패!");
	}
	response.sendRedirect("boardListProc.jsp");	
%>
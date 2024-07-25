<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="jspbasic.board.Board"%>
<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String realpath = "D:/upload";
	
	File dir = new File(realpath);
	if (!dir.exists()) dir.mkdirs();

	MultipartRequest mr = new MultipartRequest(request, realpath,
            5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	
%>

<jsp:useBean id="board" class="jspbasic.board.Board" />
<jsp:setProperty name="board" property="bwriter" value='<%=mr.getParameter("bwriter") %>' />
<jsp:setProperty name="board" property="bsort" value='<%=mr.getParameter("bsort") %>' />
<jsp:setProperty name="board" property="btitle" value='<%=mr.getParameter("btitle") %>' />
<jsp:setProperty name="board" property="bcontent" value='<%=mr.getParameter("bcontent") %>' />
<jsp:setProperty name="board" property="cfn" value='<%=mr.getOriginalFileName("cfn") %>' />

<%
	BoardInterface bi = new BoardDao();
	int result = bi.registBoard(board);
	if (result > 0) {
		System.out.println("등록 성공!");
	} else {
		System.out.println("등록 실패!");
	}
	response.sendRedirect("boardListProc.jsp");
%>







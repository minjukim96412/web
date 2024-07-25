<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String realpath = "D:/upload";
	
	//새로 업로드
	MultipartRequest mr = new MultipartRequest(request, realpath,
            5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	//기존 파일 삭제
	File file = new File(realpath + "/" + mr.getParameter("cfn"));
	if(file.exists())file.delete();
%>

<jsp:useBean id="board" class="jspbasic.board.Board" />
<jsp:setProperty name="board" property="bid" value='<%=Integer.parseInt(mr.getParameter("bid")) %>' />
<jsp:setProperty name="board" property="bsort" value='<%=mr.getParameter("bsort") %>' />
<jsp:setProperty name="board" property="btitle" value='<%=mr.getParameter("btitle") %>' />
<jsp:setProperty name="board" property="bcontent" value='<%=mr.getParameter("bcontent") %>' />
<jsp:setProperty name="board" property="cfn" value='<%=mr.getOriginalFileName("cfn") %>' />

<%
	System.out.println(board);
	BoardInterface bi = new BoardDao();
	int result = bi.updateBoard(board);
	if (result > 0) {
		System.out.println("수정 성공!");
	} else {
		System.out.println("수정 실패!");
	}
	response.sendRedirect("boardListProc.jsp");
%>
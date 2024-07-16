<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	String upass = request.getParameter("upass");
	
	//DB에서 uid에 해당하는 회원정보를 가져옴
	//uid에 해당하는 최원정보를 가져옴
	//session에 필요한 회원정보를 속성변수에 저장
	session.setAttribute("uid", uid);
	session.setAttribute("uname", "홍길동");
	session.setAttribute("ucount", "55");
	
	response.sendRedirect("main.jsp");
	
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%  
	String name = request.getParameter("name");
	out.print("responseProc.jsp => 이름 : " + name);
	
	request.setAttribute("name", "홍길동");
	
	//Rediection : 새로운 request 생성
	//response.sendRedirect("responseProc2.jsp");
	
	//Forwarding : request 유지
	RequestDispatcher rd = request.getRequestDispatcher("responseProc2.jsp");
	rd.forward(request, response);
%>
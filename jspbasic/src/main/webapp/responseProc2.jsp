<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%  
	String name = request.getParameter("name");
	out.print("responseProc2.jsp => 이름 : " + name);
	out.print("<br />");
	
	out.print("name속성변수의 값 : " + request.getAttribute("name"));
	
	RequestDispatcher rd = request.getRequestDispatcher("reponseProc3.jsp");
	rd.forward(request, response);
%>
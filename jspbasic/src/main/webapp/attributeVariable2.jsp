<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	out.print(pageContext.getAttribute("pv")+"<br />");//null
	out.print(request.getAttribute("rv")+"<br />");//null
	out.print(session.getAttribute("sv")+"<br />");//톰캣서버사용시 기본적으로 30분동안 session스코프 사용가능
	out.print(session.getId()+"<br />");
	out.print(application.getAttribute("av")+"<br />");
%>


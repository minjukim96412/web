<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	Enumeration en = request.getHeaderNames();
	while (en.hasMoreElements()){
		String headerName = (String)en.nextElement();
		String headerValue = request.getHeader(headerName);
		out.print(headerName + " = " + headerValue + "<br />");
	}
	
%>
<br />

<% 
out.print(request.getRemoteAddr()+ "<br />");
out.print(request.getContentLength()+ "<br />");
out.print(request.getQueryString() + "<br />");
out.print(request.getContextPath() + "<br />");
out.print(request.getRequestURI() + "<br />");

/*
String getRemoteAddr() : 클라이언트의 IP주소를 반환
long getContentLength() : 요청파라미터의 길이(byte수)를 반환
String getQueryString() : 요청URL에서 ? 뒤에 나오는 문자열
String getContextPath() : 컨텍스트경로를 문자열로 반환
String getRequestURI() : 요청한 URI경로를 문자열로 반환
*/

%>

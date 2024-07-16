<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int count = 0;
	if(((String)application.getAttribute("quiz1")).equals("당기소")) count++;
	if(((String)application.getAttribute("quiz2")).equals("주춤주춤")) count++;
	if(((String)application.getAttribute("quiz3")).equals("다이빙")) count++;
	if(((String)application.getAttribute("quiz4")).equals("인삼차")) count++;
	if(((String)request.getParameter("quiz5")).equals("부재중")) count++;
	out.print("<h2>" + count + "/5문제 정답~" + "</h2>");
	out.print("<button onclick=\"location.href='quiz1.jsp'\">다시하기</button>");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
application.setAttribute("quiz5", request.getParameter("quiz5"));
response.sendRedirect("quizResult.jsp");
%>
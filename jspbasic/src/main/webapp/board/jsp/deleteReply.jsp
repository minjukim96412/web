<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jspbasic.reply.ReplyDao" %>
<%@ page import="jspbasic.reply.ReplyInterface" %>

<%
    int rid = Integer.parseInt(request.getParameter("rid"));
    
    ReplyInterface ri = new ReplyDao();
    boolean isSuccess = ri.deleteReply(rid);  // deleteReply 메소드 구현 필요
    
    if (isSuccess) {
        response.sendRedirect("boardView.jsp?bid=" + request.getParameter("bid"));
    } else {
        out.println("댓글 삭제에 실패했습니다.");
    }
%>

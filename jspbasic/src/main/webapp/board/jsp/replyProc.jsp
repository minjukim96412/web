<%@page import="jspbasic.reply.Reply"%>
<%@page import="jspbasic.reply.ReplyDao"%>
<%@page import="jspbasic.reply.ReplyInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="reply" class="jspbasic.reply.Reply" />
<jsp:setProperty name="reply" property="*" />

<%
    int bid = Integer.parseInt(request.getParameter("bid"));
    String rcontent = request.getParameter("rcontent");

    // 현재 로그인된 사용자 ID를 가져와서 설정 (예: 세션에서 가져오기)
    String mid = (String) session.getAttribute("mid");
    reply.setMid(mid);
    reply.setRcontent(rcontent);

    ReplyInterface ri = new ReplyDao();
    int result = ri.registReply(reply);

    if (result > 0) {
        System.out.println("댓글 등록 성공!");
    } else {
        System.out.println("댓글 등록 실패!");
    }
    response.sendRedirect("boardView.jsp?bid=" + bid);
%>
>
<%@page import="java.sql.SQLException"%>
<%@page import="jspbasic.member.MemberDao"%>
<%@page import="jspbasic.member.MemberInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="jspbasic.member.Member"></jsp:useBean>
<jsp:setProperty name="member" property="*" />
<%
    System.out.println("아이디: " + member.getMid());
    System.out.println("비밀번호: " + member.getMpass());

    MemberInterface mi = new MemberDao();
    boolean result = false;
    try {
        result = mi.getMember(member);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    System.out.println("로그인 결과: " + result);

    if (result) {
    	session.setAttribute("mid", member.getMid());
        response.sendRedirect("boardListProc.jsp");
    } else {
        out.print("<script>alert('등록하신 회원정보를 확인하세요!');location.href='login.jsp';</script>");
    }
%>




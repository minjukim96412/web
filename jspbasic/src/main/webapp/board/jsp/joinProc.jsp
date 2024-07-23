<%@page import="jspbasic.member.MemberDao"%>
<%@page import="jspbasic.member.MemberInterface"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="member" class="jspbasic.member.Member" />
<jsp:setProperty name="member" property="*" />

<%
    MemberInterface mi = new MemberDao();
    int result = mi.registMember(member);

    if (result > 0) {
        System.out.println("등록 성공!");
        response.sendRedirect("login.jsp");
    } else if (result == -1) {
        System.out.println("중복된 아이디!");
        out.println("<script type='text/javascript'>");
        out.println("alert('중복된 아이디입니다.');");
        out.println("history.back();");
        out.println("</script>");
    } else {
        System.out.println("등록 실패!");
        out.println("<script type='text/javascript'>");
        out.println("alert('회원가입에 실패했습니다. 다시 시도해주세요.');");
        out.println("history.back();");
        out.println("</script>");
    }
%>

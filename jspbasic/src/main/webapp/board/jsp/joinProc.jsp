<%@page import="org.apache.ibatis.session.SqlSessionFactoryBuilder"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.io.Resources"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.io.Reader"%>
<%@page import="jspbasic.member.MemberDao"%>
<%@page import="jspbasic.member.MemberInterface"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="member" class="jspbasic.member.Member" />
<jsp:setProperty name="member" property="*" />

<%
String resource = "conf/configuration.xml";
Reader reader = null;
SqlSession sqlSession = null;

try {
    reader = Resources.getResourceAsReader(resource);
    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
    sqlSession = ssf.openSession();
    
	int result = sqlSession.selectOne("Member.existMember",member.getMid());
	sqlSession.commit();
	 if (result > 0) {
			System.out.println("중복된 아이디!");
	        out.println("<script type='text/javascript'>");
	        out.println("alert('중복된 아이디입니다.');");
	        out.println("history.back();");
	        out.println("</script>");
	    } else if (result == 0) {
	    	 System.out.println("등록 성공!");
		     response.sendRedirect("login.jsp");
	    } else {
	        System.out.println("등록 실패!");
	        out.println("<script type='text/javascript'>");
	        out.println("alert('회원가입에 실패했습니다. 다시 시도해주세요.');");
	        out.println("history.back();");
	        out.println("</script>");
	    }
	
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // 리소스 해제
    if (sqlSession != null) {
        sqlSession.close();
    }
    if (reader != null) {
        reader.close();
    }
}	

   
%>

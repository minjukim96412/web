<%@page import="java.lang.reflect.Member"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactoryBuilder"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.io.Resources"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.io.Reader"%>
<%@page import="jspbasic.member.MemberDao"%>
<%@page import="jspbasic.member.MemberInterface"%>
<%@ page contentType="text/html; charset=UTF-8"%>

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
        
		Member member2 = sqlSession.selectOne("Member.getMember",member.getMid());
		sqlSession.commit();
		if (member2 != null) {
			session.setAttribute("mid", member.getMid());
			System.out.println(session.getAttribute("mid") + "님 로그인!");
			Object userCount = application.getAttribute("userCount");
			application.setAttribute("userCount", userCount==null ? 1 : (Integer)userCount + 1);
			response.sendRedirect("boardListProc.jsp");
		} else {
			out.print("<script>alert('등록하신 회원정보를 확인하세요!'); location.href='login.jsp';</script>");
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


















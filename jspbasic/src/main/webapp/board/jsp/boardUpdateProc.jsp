<%@page import="org.apache.ibatis.session.SqlSessionFactoryBuilder"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.io.Resources"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.io.Reader"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String realpath = "D:/upload";
	
	//새로 업로드
	MultipartRequest mr = new MultipartRequest(request, realpath,
            5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	//기존 파일 삭제
	File file = new File(realpath + "/" + mr.getParameter("cfn"));
	if(file.exists())file.delete();
%>
<%
    String resource = "conf/configuration.xml";
    Reader reader = null;
    SqlSession sqlSession = null;
%>
<jsp:useBean id="board" class="jspbasic.board.Board" />
<jsp:setProperty name="board" property="bid" value='<%=Integer.parseInt(mr.getParameter("bid")) %>' />
<jsp:setProperty name="board" property="bsort" value='<%=mr.getParameter("bsort") %>' />
<jsp:setProperty name="board" property="btitle" value='<%=mr.getParameter("btitle") %>' />
<jsp:setProperty name="board" property="bcontent" value='<%=mr.getParameter("bcontent") %>' />
<jsp:setProperty name="board" property="cfn" value='<%=mr.getOriginalFileName("cfn") %>' />

<%
	try {
	    reader = Resources.getResourceAsReader(resource);
	    SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
	    sqlSession = ssf.openSession();
	
	    int result = sqlSession.update("Board.updateBoard", board);
	    sqlSession.commit(); // 트랜잭션 커밋
	
	    if (result > 0) {
	    	response.sendRedirect("boardListProc.jsp");
	    } else {
	        out.println("등록 실패!");
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    if (sqlSession != null) {
	        sqlSession.close();
	    }
	    if (reader != null) {
	        reader.close();
	    }
	}
	
%>
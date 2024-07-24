<%@page import="org.apache.ibatis.session.SqlSessionFactoryBuilder"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.io.Resources"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.io.Reader"%>
<%@page import="java.io.File"%>
<%@page import="jspbasic.board.Board"%>
<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String realpath = "D:/upload";

String resource = "conf/configuration.xml";
Reader reader = null;
SqlSession sqlSession = null;
try {
	reader = Resources.getResourceAsReader(resource);
	SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
	sqlSession = ssf.openSession();

	int bid = Integer.parseInt(request.getParameter("bid"));
	Board board = sqlSession.selectOne("Board.getBoard", bid);

	File file = new File(realpath + "/" + board.getCfn());
	if (file.exists())
		file.delete();

	int result = sqlSession.delete("Board.deleteBoard", bid);
	sqlSession.commit();
	if (result > 0) {
		response.sendRedirect("boardListProc.jsp");
	} else {
		System.out.print("삭제 실패!");
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
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page import="org.apache.ibatis.io.Resources"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder"%>
<%@ page import="java.io.Reader"%>
<%@ page import="jspbasic.board.Board"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
String realpath = "D:/upload";

File dir = new File(realpath);
if (!dir.exists())
	dir.mkdirs();

MultipartRequest mr = new MultipartRequest(request, realpath, 5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
%>

<%
String resource = "conf/configuration.xml";
Reader reader = null;
SqlSession sqlSession = null;
%>
<jsp:useBean id="board" class="jspbasic.board.Board" />
<jsp:setProperty name="board" property="bwriter"
	value='<%=mr.getParameter("bwriter")%>' />
<jsp:setProperty name="board" property="bsort"
	value='<%=mr.getParameter("bsort")%>' />
<jsp:setProperty name="board" property="btitle"
	value='<%=mr.getParameter("btitle")%>' />
<jsp:setProperty name="board" property="bcontent"
	value='<%=mr.getParameter("bcontent")%>' />
<jsp:setProperty name="board" property="cfn"
	value='<%=mr.getOriginalFileName("cfn")%>' />

<%
try {
	reader = Resources.getResourceAsReader(resource);
	SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
	sqlSession = ssf.openSession();

	int result = sqlSession.insert("Board.insertBoard", board);
	sqlSession.commit(); // 트랜잭션 커밋

	if (result > 0) {
		response.sendRedirect("boardListProc.jsp"); // 성공 시 리디렉션
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


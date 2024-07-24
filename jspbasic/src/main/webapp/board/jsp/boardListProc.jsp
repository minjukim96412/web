<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="java.io.Reader" %>
<%@ page import="jspbasic.board.Board" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // 로그인 여부 확인
    if (session.getAttribute("mid") == null) {
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
        return;
    }
%>

<%
    String resource = "conf/configuration.xml";
    Reader reader = null;
    SqlSession sqlSession = null;

    try {
        reader = Resources.getResourceAsReader(resource);
        SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
        sqlSession = ssf.openSession();

        // 게시물 목록 가져오기
        List<Board> boardList = sqlSession.selectList("Board.selectAllBoard");

        // RequestDispatcher를 사용하여 request에 속성으로 boardList 저장
        request.setAttribute("boardList", boardList);
        request.setAttribute("bsort", request.getParameter("bsort"));
        request.setAttribute("searchKeyword", request.getParameter("searchKeyword"));
        request.setAttribute("searchValue", request.getParameter("searchValue"));

        // boardList.jsp로 포워딩
        RequestDispatcher rd = request.getRequestDispatcher("boardList.jsp");
        rd.forward(request, response);
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













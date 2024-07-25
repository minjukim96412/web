<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@page import="jspbasic.board.Board"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    if (session.getAttribute("mid") == null) {
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }

    // 인터페이스 타입으로 객체 생성
    BoardInterface bi = new BoardDao();

    // 게시물 목록
    List<Board> boardList = bi.listBoard(
        request.getParameter("bsort"),
        request.getParameter("searchKeyword"),
        request.getParameter("searchValue")
    );

    // request에 속성으로 boardList 저장
    request.setAttribute("boardList", boardList);
    request.setAttribute("bsort", request.getParameter("bsort"));
    request.setAttribute("searchKeyword", request.getParameter("searchKeyword"));
    request.setAttribute("searchValue", request.getParameter("searchValue"));

    // boardList.jsp로 포워딩
    RequestDispatcher rd = request.getRequestDispatcher("boardList.jsp");
    rd.forward(request, response);
%>















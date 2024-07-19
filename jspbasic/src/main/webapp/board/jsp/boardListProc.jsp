<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="jspbasic.board.Board"%>
<%@page import="java.util.List"%>
<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%
    if (session.getAttribute("mid") == null) {
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
        return;
    }

    // 인터페이스 타입으로 객체 생성
    BoardInterface bi = new BoardDao();

    // 게시물 목록
    List<Board> boardList = bi.listBoard(
        request.getParameter("bsort"),
        request.getParameter("searchKeyword"),
        request.getParameter("searchValue")
    );

    // request를 다른 페이지에 전달할 때 RequestDispatcher
    request.setAttribute("boardList", boardList);
    request.setAttribute("bsort", request.getParameter("bsort"));
    request.setAttribute("searchKeyword", request.getParameter("searchKeyword"));
    request.setAttribute("searchValue", request.getParameter("searchValue"));

    // boardList.jsp로 포워딩
    RequestDispatcher rd = request.getRequestDispatcher("boardList.jsp");
    rd.forward(request, response);
    
  //voardList.jsp로 리다이렉션
  	//리다이렉션은 서버가 클라이언트에게 새로운 요청을 하라고 지시하는 것으로
  	//기존의 requet와 새로운 request는 별개의 request
  	//response.sendRedirect("boardList.jsp");
%>

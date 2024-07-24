<%@page import="java.util.List"%>
<%@page import="jspbasic.reply.Reply"%>
<%@page import="jspbasic.reply.ReplyDao"%>
<%@page import="jspbasic.reply.ReplyInterface"%>
<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@page import="jspbasic.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    int bid = Integer.parseInt(request.getParameter("bid"));
    BoardInterface bi = new BoardDao();
    Board board = bi.getBoard(bid);
    
    bi.addCount(bid);    // 조회수 증가
    
    pageContext.setAttribute("board", board);
    
    ReplyInterface ri = new ReplyDao();
    List<Reply> replyList = ri.listReplies(bid); // 댓글 목록을 불러옴
    pageContext.setAttribute("replyList", replyList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<link rel="stylesheet" href="../css/boardView.css" />
</head>
<body>
<div id="wrapper">
    <h2>게시물 보기</h2>
    <section>
        <p>no. ${board.bid} 
        분류 : ${board.bsort}</p>
        <h3>제목</h3>
        <p>${board.btitle}</p>
    </section>
    <section>
        <h3>내용</h3>
        <%
            pageContext.setAttribute("lineChar", "\n");
        %>
        <div id="content">
            ${fn:replace(board.bcontent, lineChar, '<br />')}
        </div>
    </section>
    <section>
        <p>작성자 : ${board.bwriter}</p>
        <p>조회수 : ${board.bcount}</p>
        <p>등록일시 : <fmt:formatDate value="${board.bregdate}" pattern="yy/MM/dd HH:mm:ss" /></p>
        <p>첨부파일 : 
            <c:if test="${!empty board.cfn}">
                <a href="/jspbasic/filedownload?filename=${board.cfn}">${board.cfn}</a>
            </c:if>
        <p>
    </section>
    <section id="comments">
        <h3>댓글</h3>
        <c:forEach var="reply" items="${replyList}" varStatus="status">
            <div class="comment" id="replyNum${reply.rid}">
                <p>
                    ${status.index + 1} - ${reply.mid}: ${reply.rcontent}
                </p>
                <div class="commentInner">
                    <c:if test="${reply.mid == sessionScope.mid or sessionScope.mid == 'master'}">
                        <form method="post" action="updateReply.jsp" class="inline-form">
                            <input type="hidden" name="rid" value="${reply.rid}" />
                            <input type="hidden" name="bid" value="${board.bid}" />
                            <input type="text" name="rcontent" value="${reply.rcontent}" required/>
                            <input type="submit" value="수정" />
                        </form>
                    </c:if>
                    <c:if test="${reply.mid == sessionScope.mid or sessionScope.mid == 'master'}">
                        <form method="post" action="deleteReply.jsp" class="inline-form">
                            <input type="hidden" name="rid" value="${reply.rid}" />
                            <input type="hidden" name="bid" value="${board.bid}" />
                            <input type="submit" value="삭제" />
                        </form>
                    </c:if>
                </div>
            </div>
        </c:forEach>
        <form id="new-comment-form" method="post" action="replyProc.jsp">
            <input type="hidden" name="bid" value="${board.bid}" />
            <input type="text" name="rcontent" placeholder="댓글을 입력하세요" required/>
            <input type="submit" value="등록" />
        </form>
    </section>
    <p><input type="button" value="목록" onclick="location.href='boardListProc.jsp'" /></p>
</div>
</body>
</html>







<%@page import="jspbasic.listener.MyHttpSessionListener"%>
<%@page import="javax.websocket.Session"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="jspbasic.board.BoardDao"%>
<%@page import="jspbasic.board.BoardInterface"%>
<%@page import="jspbasic.board.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="../css/boardList.css" />
</head>
<body>
    <div id="wrapper">
        <div>
            <h2>게시판</h2>
            <p>현재 접속자 수 :  ${applicationScope.userCount} 명</p>
            <p>
                ${sessionScope.mid} 님 환영합니다! &nbsp;
                <input type="button" value="로그아웃" onclick="location.href='logoutProc.jsp'" />
            </p>
            <p>
                <form method="get" action="boardListProc.jsp">
                    <select name="bsort">
                        <option value="">--전체--</option>
                      	<option value="자유" <c:if test="${board.bsort=='자유'}">selected</c:if>>자유</option>
						<option value="공지" <c:if test="${board.bsort=='공지'}">selected</c:if>>공지</option>
						<option value="사진" <c:if test="${board.bsort=='사진'}">selected</c:if>>사진</option>
                    </select>
                    <select name="searchKeyword">
                        <option value=""<c:if test="${searchKeyword== ''}">selected</c:if>>--전체--</option>
                        <option value="btitle" <c:if test="${searchKeyword=='btitle'}">selected</c:if>>제목</option>
                        <option value="bcontent" <c:if test="${searchKeyword=='bcontent'}">selected</c:if>>내용</option>
                    </select>
                    <input type="text" name="searchValue"/>
                    <input type="submit" value="검색" /> &nbsp;
                </form>
                <button id="insertBtn" onclick="location.href='boardRegistForm.jsp';">등록</button>
            </p>
        </div>
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>분류</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="board" items="${boardList}">
                    <tr id="boardNum${board.bid}">
                        <td>${board.bid}</td>
                        <td>${board.bsort}</td>
                        <td><a href="boardView.jsp?bid=${board.bid}">${board.btitle}</a></td>
                        <td>${board.bwriter}</td>
                        <td>${board.bcount}</td>
                        <td><fmt:formatDate value="${board.bregdate}" pattern="yy/MM/dd HH:mm:ss" /> </td>
                        <td>
                       	 	<c:if test="${!empty board.cfn}">
                        	<a href="/jspbasic/filedownload?filename=${board.cfn}"><img src="/board/file.png" style="width : 25px;" /></a>
                        	</c:if>
                        </td>
                        <td>
                        	<c:if test="${board.bwriter == sessionScope.mid or sessionScope.mid == 'master'}">
                            <a href="boardUpdateForm.jsp?bid=${board.bid}">[수정]</a>
                            </c:if>
                        </td>
                        <td>
                        	<c:if test="${board.bwriter == sessionScope.mid or sessionScope.mid == 'master'}">
                            <a href="boardDeleteProc.jsp?bid=${board.bid}">[삭제]</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>


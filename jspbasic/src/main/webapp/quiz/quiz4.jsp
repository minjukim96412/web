<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            
<h2> 문제 : '세 명의 사람이 탄 차'를 세 글자로 하면? </h2>
<form action="quiz4Proc.jsp">
	<input type="hidden" name="quiz1" value='<%= request.getAttribute("quiz1") %>' />
	<input type="hidden" name="quiz2" value='<%= request.getAttribute("quiz2") %>' />
	<input type="hidden" name="quiz3" value='<%= request.getAttribute("quiz3") %>' />
	정답 : <input type="text" name="quiz4" />&nbsp;
	<input type="submit" value="다음 문제" />
</form>    
    

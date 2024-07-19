<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>board</title>
<link rel="stylesheet" href="../css/boardRegist.css" />
</head>
<body>
<div id="wrapper">
		<form method="post" action="boardRegistProc.jsp">
			<input type="hidden" name="bwriter" value="${sessionScope.mid}" />
			분류 : <select name="bsort">
				<option value="자유" >자유</option>
				<option value="공지" >공지</option>
				<option value="사진" >사진</option>
			</select>
			제목 : <input type="text" name="btitle" /><br />
			내용 : <textarea name="bcontent" rows="25" cols="100" ></textarea><br />
			<input type="submit" value="확인" />
		</form>
</div>
</body>
</html>
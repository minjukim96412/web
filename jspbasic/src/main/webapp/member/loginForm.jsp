<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<form method="post" action="loginProc.jsp">
	<div>
		아이디: <input type="text" name="uid" /><br />
		비밀번호: <input type="password" name="upass" /><br />
		<input type="submit" value="로그인" />
	</div>
	</form>
</body>
</html>
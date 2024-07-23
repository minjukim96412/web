<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/login.css" />
</head>
<body>
    <div id="wrapper">
        <form action="joinProc.jsp" method="post" accept-charset="UTF-8">
            아이디 : <input type="text" name="mid" required/><br />
            비밀번호 : <input type="password" name="mpass" required/><br />
            <input type="submit" value="회원가입" />
        </form>
    </div>
</body>
</html>
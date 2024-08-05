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
        <div>
            <form action="loginProc.jsp" method="post" accept-charset="UTF-8">
                아이디 : <input type="text" name="mid" required/><br />
                비밀번호 : <input type="password" name="mpass" required/><br />
                <input type="submit" value="로그인" />
            </form>
        </div>
        <p>
        <button id="joinBtn" onclick="location.href='join.jsp';">회원가입</button>
        </p>
    </div>
</body>
</html>


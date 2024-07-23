<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드 폼</title>
</head>
<body>
	<h2>파일업로드</h2>
	<form action="/jspbasic/fileupload" method="post" enctype="multipart/form-data">
    제목 : <input type="text" name="title" /><br />
    파일 : <input type="file" name="f" />
    <input type="submit" value="전송" />
	</form>

</body>
</html>
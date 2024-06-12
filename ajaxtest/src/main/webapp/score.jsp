<%@ page contentType="application/json; charset=UTF-8" %>
<%
    // 클라이언트에서 전송된 파라미터를 받아옴
    String s1name = request.getParameter("s1name");
    String s1korStr = request.getParameter("s1kor");
    String s1engStr = request.getParameter("s1eng");
    String s1mathStr = request.getParameter("s1math");

    String s2name = request.getParameter("s2name");
    String s2korStr = request.getParameter("s2kor");
    String s2engStr = request.getParameter("s2eng");
    String s2mathStr = request.getParameter("s2math");

    String s3name = request.getParameter("s3name");
    String s3korStr = request.getParameter("s3kor");
    String s3engStr = request.getParameter("s3eng");
    String s3mathStr = request.getParameter("s3math");

    // 받아온 문자열 형식의 점수를 정수로 변환
    int s1kor = (s1korStr != null && !s1korStr.isEmpty()) ? Integer.parseInt(s1korStr) : 0;
    int s1eng = (s1engStr != null && !s1engStr.isEmpty()) ? Integer.parseInt(s1engStr) : 0;
    int s1math = (s1mathStr != null && !s1mathStr.isEmpty()) ? Integer.parseInt(s1mathStr) : 0;

    int s2kor = (s2korStr != null && !s2korStr.isEmpty()) ? Integer.parseInt(s2korStr) : 0;
    int s2eng = (s2engStr != null && !s2engStr.isEmpty()) ? Integer.parseInt(s2engStr) : 0;
    int s2math = (s2mathStr != null && !s2mathStr.isEmpty()) ? Integer.parseInt(s2mathStr) : 0;

    int s3kor = (s3korStr != null && !s3korStr.isEmpty()) ? Integer.parseInt(s3korStr) : 0;
    int s3eng = (s3engStr != null && !s3engStr.isEmpty()) ? Integer.parseInt(s3engStr) : 0;
    int s3math = (s3mathStr != null && !s3mathStr.isEmpty()) ? Integer.parseInt(s3mathStr) : 0;

    // JSON 형식의 문자열 생성
    String jsonResponse = "[" +
        "{\"name\":\"" + s1name + "\",\"kor\":" + s1kor + ",\"eng\":" + s1eng + ",\"math\":" + s1math + "}," +
        "{\"name\":\"" + s2name + "\",\"kor\":" + s2kor + ",\"eng\":" + s2eng + ",\"math\":" + s2math + "}," +
        "{\"name\":\"" + s3name + "\",\"kor\":" + s3kor + ",\"eng\":" + s3eng + ",\"math\":" + s3math + "}" +
    "]";

    // JSON 형식의 문자열을 출력
    out.print(jsonResponse);
%>

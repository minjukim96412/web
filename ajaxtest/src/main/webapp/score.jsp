<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");

    String s1name = request.getParameter("s1name");
    String s1kor = request.getParameter("s1kor");
    String s1eng = request.getParameter("s1eng");
    String s1math = request.getParameter("s1math");
    
    String s2name = request.getParameter("s2name");
    String s2kor = request.getParameter("s2kor");
    String s2eng = request.getParameter("s2eng");
    String s2math = request.getParameter("s2math");
    
    String s3name = request.getParameter("s3name");
    String s3kor = request.getParameter("s3kor");
    String s3eng = request.getParameter("s3eng");
    String s3math = request.getParameter("s3math");

    // JSON 데이터 생성
    String jsonStr = "{";
    jsonStr += "\"students\":[";
    jsonStr += "{\"name\":\"" + s1name + "\", \"kor\":\"" + s1kor + "\", \"eng\":\"" + s1eng + "\", \"math\":\"" + s1math + "\"},";
    jsonStr += "{\"name\":\"" + s2name + "\", \"kor\":\"" + s2kor + "\", \"eng\":\"" + s2eng + "\", \"math\":\"" + s2math + "\"},";
    jsonStr += "{\"name\":\"" + s3name + "\", \"kor\":\"" + s3kor + "\", \"eng\":\"" + s3eng + "\", \"math\":\"" + s3math + "\"}";
    jsonStr += "]";
    jsonStr += "}";

    out.print(jsonStr);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행 성향 분석 결과</title>
    <link rel="stylesheet" href="testResult.css">
    <script src="testResult.js" defer></script>
</head>
<body>
    <div class="result-container">
        <h1>당신은 <span id="resultType"></span> 입니다.</h1>
        <img id="resultImage" src="" alt="Result Image" class="result-image">
        <p id="resultDescription" class="result-description">
            <!-- 결과 설명이 여기 표시됩니다. -->
        </p>
        <button class="recommendation-button" onclick="getRecommendation()">내 성향에 맞는 여행지 추천 받기 <span class="go-button">GO!</span></button>
    </div>
</body>
</html>

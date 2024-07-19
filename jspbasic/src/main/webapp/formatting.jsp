<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="num1" value="3.141592"></c:set>

<!-- 문자열을 숫자로 변환 -->
<fmt:parseNumber var="pn" value="${num1}"/>
${pn*2}<br />

<!-- 포맷 변환 -->
<fmt:formatNumber var="fn" value = "${num1}" pattern="#.##" />
${fn}<br />

<c:set var="num2" value="987654321" />
<fmt:formatNumber var="fn2" value = "${num2}" groupingUsed="true" />
${fn2}<br />
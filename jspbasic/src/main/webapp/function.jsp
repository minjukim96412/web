<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${fn:contains(str, world)}"></c:if>
world로 끝 남<br />

<c:set var="v1" value="<p>문장입니다</p>"/>
${v1}<br />
${fn:escapeXml(v1)}<br />

<!-- 문자열을 배열로 -->
<c:set var="tel" value="010-1234-5678" />
${fn:split(tel, '-')[0]}<br />
${fn:split(tel, '-')[1]}<br />
${fn:split(tel, '-')[2]}<br />

<!-- 부분문자열 추출 -->

<!--  -->
<!--  -->
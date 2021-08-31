<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <fmt:requestEncoding value="UTF-8"/>
    <html>
        <head><title>구구단</title></head>
    <body>
        <h3 align=center>구구단</h3>
        <c:set var="t" value="${param.t}"/>
        <c:if test="${empty t}">
            <c:set var="t" value="5"/>
        </c:if>
        <c:forEach var="a" begin="1" end="9" step="1">
            <c:out value="${t}"/> X <c:out value="${a}"/> =
            <c:out value="${a * t}"/> <br>
        </c:forEach>
    </body>
    </html>

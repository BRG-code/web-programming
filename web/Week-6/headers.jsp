<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <fmt:requestEncoding value="UTF-8"/>
    <html>
        <head><title>헤더 정보들</title></head>
    <body>
        <h2>헤더 정보들</h2>
        <c:forEach var="h" items="${header}">
            <li> <c:out value="${h.key}"/> :
            <c:out value="${h.value}" />
        </c:forEach>
    </body>
    </html>
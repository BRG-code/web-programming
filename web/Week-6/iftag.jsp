<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <html>
    <head><title>JSTL : if </title></head>
    <body>
        <h3 align=center>if 태그 테스트</h3>
        <c:if test="${!empty param.name}">
            이름: ${param.name}"/>
        </c:if>
    </body>
    </html>

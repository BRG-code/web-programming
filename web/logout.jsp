<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>로그아웃 중입니다.</title>
</head>

<body>
    <!-- Clear Session Value -->
    <c:remove var="loginedid" scope="session"/>
    <c:remove var="loginedname" scope="session"/>
    <c:redirect url="index.jsp"/>
</body>
</html>

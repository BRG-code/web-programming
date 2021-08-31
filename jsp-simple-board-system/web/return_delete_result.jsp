<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head><title>계정 삭제 진행 중</title></head>
<body>
    <sql:update dataSource="jdbc/orcl" var="table">
        DELETE FROM member WHERE id = ?
        <sql:param value="${ sessionScope.loginedid }" />
    </sql:update>

    <!-- Clear Session Value -->
    <c:remove var="loginedid" scope="session"/>
    <c:remove var="loginedname" scope="session"/>
    <c:redirect url="index.jsp"/>

    <script>
        alert("계정 삭제가 완료되었습니다.")
        location.href="index.jsp"
    </script>
</body>
</html>
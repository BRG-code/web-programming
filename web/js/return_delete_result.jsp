<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
    <title>삭제 중</title>
</head>

<c:if test="${empty sessionScope.loginedid || empty sessionScope.loginedname}" >
    <script>
        alert("로그인이 되어있지 않은 상태입니다. 로그인을 먼저 진행하세요.")
        location.href="javascript:history.back(-1)"
    </script>
</c:if>

<c:if test="${param.num !=null}">
    <sql:query var="rs" dataSource="jdbc/mydb">
        SELECT id FROM achieve WHERE no = ?
        <sql:param value="${param.num}" />
    </sql:query>
</c:if>

<c:forEach var="row" items="${rs.rows}">
    <c:if test="${row.id != sessionScope.loginedid}">
        <script>
            alert("작성자만 삭제 할 수 있습니다.")
            location.href="javascript:history.back(-1)"
        </script>
    </c:if>

    <c:if test="${row.id == sessionScope.loginedid}">
        <sql:update var="rs" dataSource="jdbc/mydb">
            DELETE FROM achieve WHERE no = ?
            <sql:param value="${param.num}" />
        </sql:update>

        <script>
            alert("삭제가 완료되었습니다.")
            location.href="achieve.jsp"
        </script>
    </c:if>
</c:forEach>

<body>

</body>
</html>

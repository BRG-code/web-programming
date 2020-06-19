<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <title>로그인 중입니다.</title>
</head>
<body>
<!-- 입력한 아이디와 비밀번호가 일치하는지 확인 -->
<sql:query var="rs" dataSource="jdbc/orcl">
    SELECT id, name FROM member WHERE id = ? AND pw = ?
    <sql:param value="${param.id}"/>
    <sql:param value="${param.pw}"/>
</sql:query>

<!-- 받아온 Row 개수가 0개이면 일치하는 데이터가 없다는 것. -->
<c:if test="${fn:length(rs.rows) eq 0}">
    <script>
        alert("로그인에 실패하였습니다. 아이디, 비밀번호를 확인해주세요.")
        location.href="login.jsp"
    </script>
</c:if>

<!-- 받아온 Row 개수가 1개이면 로그인이 잘 되었다는 것 -->
<c:if test="${fn:length(rs.rows) eq 1}">
    <!-- 세션에 데이터 할당 -->
    <c:set value="${param.id}" var="loginedid" scope="session" />
    <c:forEach var="imf" end="0" items="${rs.rows}">
        <c:set value="${imf.name}" var="loginedname" scope="session" />
    </c:forEach>
    <c:redirect url="index.jsp" />
</c:if>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <title>정보 변경 중입니다.</title>
</head>

<body>
    <c:if test="${fn:length(param.pw) != 0}">
        <c:if test="${param.pw == param.re_pw}">
            <!-- 비밀번호도 변경하는 경우 -->
            <sql:update dataSource="jdbc/orcl" var="table">
                UPDATE member SET pw = ?, name = ?, email = ?, address = ?, zipcode = ? WHERE id = ?
                <sql:param value="${ param.pw }" />
                <sql:param value="${ param.name }" />
                <sql:param value="${ param.email }" />
                <sql:param value="${ param.Address }"/>
                <sql:param value="${ param.zipcode }" />
                <sql:param value="${ sessionScope.loginedid }" />
            </sql:update>

            <c:remove var="loginedname" scope="session"/>

            <!-- 이름을 변경한 경우에 대비해 세션 값 변경 -->
            <sql:query var="rs" dataSource="jdbc/orcl">
                SELECT name FROM member WHERE id = ?
                <sql:param value="${ sessionScope.loginedid }"/>
            </sql:query>

            <!-- 세션에 데이터 할당 -->
            <c:forEach var="imf" items="${ rs.rows }">
                <c:set value="${ imf.name }" var="loginedname" scope="session" />
            </c:forEach>

            <script>
                alert("변경 처리가 완료되었습니다.")
                location.href="index.jsp"
            </script>
        </c:if>

        <c:if test="${param.pw != param.re_pw}">
            <script>
                alert("입력한 비밀번호와 비밀번호 화인이 일치하지 않습니다.")
                location.href="javascript:history.back(-1)"
            </script>
        </c:if>
    </c:if>

    <c:if test="${fn:length(param.pw) eq 0}">
        <!-- 비밀번호는 변경하지 않는 경우 -->
        <sql:update dataSource="jdbc/orcl" var="table">
            UPDATE member SET name = ?, email = ?, address = ?, zipcode = ? WHERE id = ?
            <sql:param value="${ param.name }" />
            <sql:param value="${ param.email }" />
            <sql:param value="${ param.Address }"/>
            <sql:param value="${ param.zipcode }" />
            <sql:param value="${ sessionScope.loginedid }" />
        </sql:update>

        <c:remove var="loginedname" scope="session"/>

        <!-- 이름을 변경한 경우에 대비해 세션 값 변경 -->
        <sql:query var="rs" dataSource="jdbc/orcl">
            SELECT name FROM member WHERE id = ?
            <sql:param value="${ sessionScope.loginedid }"/>
        </sql:query>

        <!-- 세션에 데이터 할당 -->
        <c:forEach var="imf" items="${ rs.rows }">
            <c:set value="${ imf.name }" var="loginedname" scope="session" />
        </c:forEach>

        <script>
            alert("변경 처리가 완료되었습니다.")
            location.href="index.jsp"
        </script>

    </c:if>
</body>
</html>

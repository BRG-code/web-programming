<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head><title>회원가입 진행 중</title></head>
<body>

<c:if test="${param.pw == param.re_pw}">
    <c:catch var="e">
        <sql:update dataSource="jdbc/orcl" var="table">
            INSERT INTO member (id, pw, name, email, address, zipcode) VALUES (?, ?, ?, ?, ?, ?)
            <sql:param value="${ param.id }" />
            <sql:param value="${ param.pw }" />
            <sql:param value="${ param.name }" />
            <sql:param value="${ param.email }" />
            <sql:param value="${ param.Address }"/>
            <sql:param value="${ param.zipcode }" />
        </sql:update>
        <script>
            alert("회원가입이 완료되었습니다.")
            location.href="index.jsp"
        </script>

        <!-- 에러가 발생한 경우 -->
        <c:if test="${e != null}">
            <!-- ID 중복 체크 -->
            <sql:query dataSource="jdbc/orcl" var="id">
                SELECT id FROM member WHERE id = ?
                <sql:param value="${ param.id }"/>
            </sql:query>

            <!-- 중복 ID가 있다면 -->
            <c:if test="${fn:length(id.rows) != 0}">
                <script>
                    alert("중복된 아이디가 있습니다. 다른 아이디로 회원 가입을 진행하세요.")
                    location.href="javascript:history.back(-1)"
                </script>
            </c:if>

            <!-- 중복 ID가 없다면 서버 문제임. -->
            <c:if test="${fn:length(id.rows) != 0}">
                <script>
                    alert("서버 문제로 회원가입이 진행되지 않았습니다.")
                    location.href="javascript:history.back(-1)"
                </script>
            </c:if>

            <c:out value="${e}" />
        </c:if>
    </c:catch>

</c:if>

<c:if test="${param.pw != param.re_pw}">
    <script>
        alert("입력한 비밀번호와 비밀번호 화인이 일치하지 않습니다.")
        location.href="javascript:history.back(-1)"
    </script>
</c:if>

<c:if test="${empty param.roadAddress}">
    <script>
        alert("주소를 입력하지 않으셨습니다.")
        location.href="javascript:history.back(-1)"
    </script>
</c:if>
</body>
</html>
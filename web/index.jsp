<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>MainPage</title>
</head>

<body>
  <h2>메인 화면</h2>
  <c:if test="${empty sessionScope.loginedid || empty sessionScope.loginedname}">
    <a href="login.jsp">로그인</a><br>
    <a href="register.jsp">회원가입</a><br>
  </c:if>

  <c:if test="${!empty sessionScope.loginedid && !empty sessionScope.loginedname}">
    <p><c:out value="${sessionScope.loginedname}"/>님으로 로그인되어 있습니다. </p>
    <a href="logout.jsp">로그아웃</a><br>
    <a href="modify.jsp">회원 정보 조회 / 수정</a><br>
  </c:if>

</body>
</html>

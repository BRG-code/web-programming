<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <meta charset="utf-8">
    <title>로그인</title>
</head>

<body>
<!-- 웹 페이지 윗 부분의 사업단 로고 부분 -->

<!-- 로그인 부분 -->
<h2>로그인</h2>

<!-- 강제로 주소를 친 경우 대비 -->
<c:if test="${!empty sessionScope.loginedid && !empty sessionScope.loginedname}" >
    <script>
        alert("이미 로그인이 되어 있는 상태입니다.")
        location.href="javascript:history.back(-1)"
    </script>
</c:if>

<!-- 로그인 폼 영역 -->
<div class="write-area">
    <!-- 스타일 정의 -->
    <style>
        p {
            width: 30%;
            display: inline;
        }

        input {
            width: auto;
        }
    </style>

    <form style="width: 50%" method="post" action="return_login_result.jsp">
        아이디 : <input type="text" name="id"> <br>
        비밀번호 : <input type="password" name="pw"> <br>
        <div style="width: 10px; height: 10px;"></div>
        <input type="submit" value="로그인">
    </form>
</div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <meta charset="utf-8">
    <title>로그인</title>
    <!-- css 선언 -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
<!-- 웹 페이지 윗 부분의 사업단 로고 부분 -->
<div style="background-color: white; height: 70px; width: 100%;">
    <a href="../index.jsp"><img style="margin-left: 15px; align-content: center;" src="../image/logo.png"></a>
</div>

<!-- 로그인 부분 -->
<div style="margin-bottom: 15px" class="sub-title">
    <h2>로그인</h2>
</div>

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
<form style="padding-left: 20%; width: 50%" class="write-area" method="post" action="return_login_result.jsp">
    아이디 : <input type="text" name="id"> <br>
    비밀번호 : <input type="password" name="pw"> <br>
    <div style="width: 10px; height: 10px;"></div>
    <input type="submit" value="로그인">
</form>
</div>
</body>
</html>

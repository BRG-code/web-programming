<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>회원 가입</title>
    <!-- css 선언 -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
<!-- 웹 페이지 윗 부분의 사업단 로고 부분 -->
<div style="background-color: white; height: 70px; width: 100%;">
    <a href="../index.jsp"><img style="margin-left: 15px; align-content: center;" src="../image/logo.png"></a>
    <a href="register.jsp" style="display: inline; float: right; margin-top: 20px; margin-right: 10px;"><p>회원 가입</p></a>
    <p style="margin-top: 20px; margin-right: 10px; float: right; display: inline"> / </p>
    <a href="" style="display: inline; float: right; margin-top: 20px; margin-right: 10px;"><p>로그인</p></a>
</div>

<!-- 회원 가입 부분 -->
<div class="sub-title">
    <h2>회원 가입</h2>
</div>

<form method="post" action="./psignuptest.jsp">
    아이디 <span class="necessary">*</span> : <input type="text" name="uid" placeholder="5자이상"
                                                  pattern="[A-Za-z0-9]{5,}" required> <br>
    비밀번호 <span class="necessary">*</span> : <input type="password" name="upasswd" placeholder="8자이상"
                                                   pattern="{8,}" required> <br>
    비밀번호확인 <span class="necessary">*</span> : <input type="password" name="uupasswd"
                                                     required> <br>
    이름 <span class="necessary">*</span> : <input type="text" name="uname"
                                                 required><br>
    이메일 <span class="necessary">*</span> : <input type="email" name="uemail" placeholder="example@*****.com"
                                                  required><br><br>
    <input type="submit" value="회원가입">
    <a href="./index.jsp"><button type="button" id="cancel" class="cancel">취소하기</button></a>


</form>

</body>
</html>
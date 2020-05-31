<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>회원가입 화면</title>
</head>
<body>
<h2>회원가입</h2>
<form method="post" action="psignuptest.jsp">
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
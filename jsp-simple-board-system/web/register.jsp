<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>회원 가입</title>
</head>

<body>

<h2>회원 가입</h2>

<!-- 회원 가입 폼 영역 -->
<div>
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

    <form style="width: 50%" method="post" action="return_register_result.jsp">
        <!-- 이름 입력 영역 -->
        <p>이름 <span class="necessary">*</span> :</p>
        <input type="text" name="name" required><br>

        <!-- 아이디 입력 영역 -->
        <p>아이디 <span class="necessary">*</span> :</p>
        <input type="text" name="id" placeholder="5자 이상" pattern="[A-Za-z0-9]{5,}" required> <br>

        <!-- 비밀번호 입력 영역 -->
        <p>비밀번호 <span class="necessary">*</span> :</p>
        <input type="password" name="pw" placeholder="8자 이상" pattern="{8,}" required> <br>

        <!-- 비밀번호 확인 입력 영역 -->
        <p>비밀번호 확인 <span class="necessary">*</span> :</p>
        <input style="width: auto" type="password" name="re_pw" required> <br>

        <!-- 이메일 입력 영역 -->
        <p>이메일 <span class="necessary">*</span> :</p>
        <input style="width: auto" type="email" name="email" placeholder="example@*****.com" required><br>

        <!-- 우편번호 입력 영역 -->
        <p>우편번호 <span class="necessary">*</span> : </p>
        <input style="width: 20%;" type="text" id="zipcode" name="zipcode" placeholder="우편번호" required><br>

        <!-- 주소 입력 영역 -->
        <p>주소 <span class="necessary">*</span></p><br>
        <input type="text" id="Address" name="Address" placeholder="주소" required>
        <br><br>
        <input style="height: 30px; width: 15%" type="submit" value="회원가입">
        <a href="javascript:history.back(-1)"><button style="height: 30px; width: 15%" type="button" id="cancel" class="cancel">취소</button></a>
    </form>
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/orcl">
    SELECT id, name, email, address, zipcode FROM member WHERE id = ?
    <sql:param value="${sessionScope.loginedid}"/>
</sql:query>

<html>
<head>
    <meta charset="utf-8">
    <title>회원 정보 조회 / 수정</title>
</head>

<body>

<h2>회원 정보 조회 / 수정</h2>

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

    <c:forEach var="row" items="${rs.rows}">
    <form style="width: 50%" method="post" action="return_modify_result.jsp">
        <!-- 이름 입력 영역 -->
        <p>이름 <span class="necessary">*</span> :</p>
        <input type="text" name="name" value="${row.name}" required><br>

        <!-- 아이디 입력 영역 -->
        <p>아이디 <span class="necessary">*</span> :</p>
        <input type="text" name="id" placeholder="5자 이상" value="${row.id}" disabled> <br>

        <!-- 비밀번호 입력 영역 -->
        비밀번호를 변경하기 원하시는 경우 변경을 원하는 비밀번호를 입력해주세요.<br>
        <p>비밀번호 <span class="necessary"></span> :</p>
        <input type="password" name="pw" placeholder="8자 이상" pattern="{8,}"> <br>

        <!-- 비밀번호 확인 입력 영역 -->
        <p>비밀번호 확인 <span class="necessary"></span> :</p>
        <input style="width: auto" type="password" name="re_pw"> <br>

        <!-- 이메일 입력 영역 -->
        <p>이메일 <span class="necessary">*</span> :</p>
        <input style="width: auto" type="email" name="email" placeholder="example@*****.com" value="${row.email}" required><br>

        <!-- 우편번호 입력 영역 -->
        <p>우편번호 <span class="necessary">*</span> : </p>
        <input style="width: 20%;" type="text" id="zipcode" name="zipcode" placeholder="우편번호" value="${row.zipcode}" required><br>

        <!-- 주소 입력 영역 -->
        <p>주소 <span class="necessary">*</span></p><br>
        <input type="text" id="Address" name="Address" placeholder="주소" value="${row.address}" required>
        <br><br>
        <input style="height: 30px; width: 15%" type="submit" value="수정">
        <a href="javascript:history.back(-1)"><button style="height: 30px; width: 15%" type="button" id="cancel" class="cancel">취소</button></a>
    </form>
    </c:forEach>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head><title>로그인</title></head>
<body>
    <h2>사용자 로그인</h2>
    <form method="post" action="ologin.jsp">
    사용자ID: <input type="text" name="id" placeholder="4자 이상" pattern="[A-Za-z0-9]{4,}" required><br><br>
    암호: <input type="password" name="pass" required><br><br>

    <input type="reset" value="초기화">
    <input type="submit" value="로그인">
    </form>
</body>
</html>
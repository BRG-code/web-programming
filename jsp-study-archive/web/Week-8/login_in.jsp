<%@ page contentType="text/html; charset=UTF-8" %>
    <html>
        <head><title>로그인</title></head>
    <body>
        <h2>사용자 로그인</h2>
        <form method="post" action="login3.jsp">
            사용자 ID: <input type="text" name="id"><br><br>
            암호: <input type="password" name="pass"><br><br>

            <input type="reset" value="초기화">
            <input type="submit" value="로그인">
        </form>
    </body>
    </html>
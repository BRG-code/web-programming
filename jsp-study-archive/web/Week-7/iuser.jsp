<%@ page contentType="text/html; charset=UTF-8" %>
    <html>
        <head><title>사용자 등록</title></head>
    <body>
        <h2>사용자 등록</h2>
        <form method='post' action='auser.jsp'>
            사용자 ID <input type='text' name='uid'> <br>
            사용자 이름 <input type='text' name='uname'> <br>
            암호 <input type='password' name='upasswd'> <br>
            <input type='submit' value='등록'>
        </form>
    </body>
    </html>
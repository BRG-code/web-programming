<%@ page contentType="text/html;charset=UTF-8" %>
    <html>
        <head><title>사용자 정보</title></head>
    <body>
        <h2>사용자 정보</h2>
        이메일: ${ param['mail'] }<br><br>
        전화: ${ param['phone'] } <br><br>
        생일: ${ param['birthday'] } <br><br>
        홈페이지: ${ param['home'] } <br><br>
    </body>
    </html>
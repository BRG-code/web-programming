<%@ page contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
    <header><title>데이터 넣기</title></header>
<body>
    <h2>사용자 정보</h2>
    메일: ${ param['email'] }<br><br>
    전화: ${ param['tel'] }<br><br>
    생일: ${ param['bday'] }<br><br>
    홈페이지: ${ param['home'] }<br><br>
</body>
</html>
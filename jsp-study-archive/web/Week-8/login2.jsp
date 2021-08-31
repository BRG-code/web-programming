<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String id = request.getParameter("id");
    Cookie cookieId = new Cookie("id", id);
    response.addCookie(cookieId);
    String pass = request.getParameter("pass");
    Cookie cookiePass = new Cookie("pass", pass);
    response.addCookie(cookiePass);
%>

<html>
    <head><title>로그인</title></head>
<body>
    <h2>로그인 정보</h2>
    사용자 ID: ${ param['id'] }<br><br>
    암호: ${ param['pass'] }<br><br>
</body>
</html>
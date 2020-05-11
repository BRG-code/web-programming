<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    String id  = request.getParameter("id");
    String pass = request.getParameter("pass");
%>
<html>
<head><title>로그인</title></head>
<body>
    <h2>사용자 로그인 정보</h2>
    사용자ID: <% out.println(id); %> <br><br>
    암호: <% out.println(pass); %> <br><br>
</body>
</html>
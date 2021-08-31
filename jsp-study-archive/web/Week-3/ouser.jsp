<%@ page contentType="text/html;charset=UTF-8" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<%
    String email = request.getParameter("mail");
    String phone = request.getParameter("phone"); 
    String birthday = request.getParameter("birthday"); 
    String home = request.getParameter("home");
%>

<html>
<head><title>사용자 정보</title></head> 
<body>
    <h2>사용자 정보</h2>
    이메일: <% out.println(email); %> <br><br>
    전화: <% out.println(phone); %> <br><br> 
    생일: <% out.println(birthday); %> <br><br> 
    홈페이지: <% out.println(home); %> <br><br>
</body> 
</html>
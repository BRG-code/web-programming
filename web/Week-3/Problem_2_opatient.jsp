<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head><title>예약 정보</title></head>
<body>
    <h2>예약 정보</h2>
    전달받은 예약 정보는 다음과 같습니다. <br>

    <%
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String date = request.getParameter("serve");
    String drug = request.getParameter("drug");
    %>

    <li> 이름 : <% out.println(name); %>
    <li> 연락처 : <% out.println(phone); %>
    <li> 예약 날짜 : <% out.println(date); %>
    <li> 약 : <% out.println(drug); %>
</body>
</html>
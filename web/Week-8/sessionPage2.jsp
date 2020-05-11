<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String id = (String)session.getAttribute("uid");
    if(id == null) {
        response.sendRedirect("login_in.jsp");
    }
%>

<html>
    <head><title>내부 데이터</title></head>
<body>
    <h2><%= id %>님 환영</h2>
    <li><a href="sessionPage1.jsp">첫번쨰 페이지</a></li>
    <li>두번째 페이지</li>
    <li><a href="logout.jsp">로그아웃</a></li>


</body>
</html>
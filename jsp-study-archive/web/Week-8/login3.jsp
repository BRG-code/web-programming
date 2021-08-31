<%@ page contentType="text/html; charset=UTF-8" %>
    <%
        String id = request.getParameter("id");
        session.setAttribute("uid", id);
    %>

    <html>
        <head><title>로그인</title></head>
    <body>
        <h2>로그인 정보</h2>
        사용자 ID: ${ param['id'] } <br><br>
        암호: ${ param['pass'] } <br><br>

        <a href="sessionPage1.jsp">세션 페이지로 이동</a>
    </body>
    </html>
<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    String title = request.getParameter("title");
    String project = request.getParameter("project");
%>

<html>
    <head><title>프로젝트 정보</title></head>
    <body>
        <h2>프로젝트 정보</h2>
        <h3> <% out.println(title); %> </h3>
        <i>
        <% out.println(project); %>
        </i>
    </body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    String os = request.getParameter("os");
    String langs[] = request.getParameterValues("lang");
%>

<html>
    <head><title>개발환경 정보</title></head>
    <body>
        <h2>개발환경 정보</h2>
        운영체제: <% out.println(os); %> <br><br>
        사용언어:
        <%
            if(langs != null) {
                for(int k = 0; k < langs.length; k++) {
                    out.println(langs[k]);
                }
            }
        %>
    </body>
</html>
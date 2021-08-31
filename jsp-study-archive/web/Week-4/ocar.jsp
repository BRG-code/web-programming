<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    String carcolor = request.getParameter("carcolor");
    String use = request.getParameter("use");
    String options[] = request.getParameterValues("option");
%>

<html>
    <head><title>자동차 정보</title></head>
    <body>
        <h2>자동차 정보</h2>
        자동차 색: <% out.println(carcolor); %> <br><br>
        사용 형태: <% out.println(use); %> <br><br>
        옵션:
        <% if(options != null) {
            for (int k = 0; k < options.length; k++) {
                out.println(options[k]);
            }
        }
        %>
    </body>
</html>
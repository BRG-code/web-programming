<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <html>
        <head><title>큰값</title></head>
    <body>
        더 큰 값은
        <%
		int a = 5, b = 7;
		int max;

		if(a>b) {
		max = a;
		} else {
		max = b;
		}

		out.println(max);
		%>
    </body>
    </html>

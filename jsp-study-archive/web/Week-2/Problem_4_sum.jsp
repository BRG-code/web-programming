<%@ page contentType="text/html;charset=utf-8" %>
    <html>
        <head><title>sum</title></head>
    <body>
        <%
		int a = 1, sum = 0;
		while (a < 100) {
		    sum += a;
		    a++;
		}
		out.println(sum);
		%>
    </body>
    </html>

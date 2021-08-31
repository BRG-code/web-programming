<%@ page contentType="text/html;charset=utf-8" %>
    <html>
        <head><title>1~10</title></head>
    <body>
        <%
		int a = 1;
		while( a < 11 ) {
		    out.println(a);
		    out.println("<br>");
		    a++;
		}
		%>
    </body>
    </html>

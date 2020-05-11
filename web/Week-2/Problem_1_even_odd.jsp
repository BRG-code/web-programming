<%@ page contentType="text/html;charset=utf-8" %>
    <html>
        <head><title>홀짝 판별</title></head>
    <body>
            <%
	        int a = 10;
	        if ((a % 2) == 0) { out.println("짝수"); }
	        else { out.println("홀수"); }
	        %>
    </body>
    </html>

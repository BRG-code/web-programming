<%@ page contentType="text/html;charset=utf-8" %>
    <html>
        <head><title>구구단: 5단</title></head>
    <body>
        <h3>구구단: 5단</h3>
        <%
        int dan = 5;
        for(int k = 1; k < 10; k++) {
            int value = dan * k;
            out.print(dan + " x " + k + " = " + value); out.println("<br>");
        }
        %>
    </body>
    </html>

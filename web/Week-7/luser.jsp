<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <sql:query var="rs" dataSource="jdbc/mydb">
        select uid, uname, upasswd from user
    </sql:query>

    <html>
        <head><title>사용자 목록</title></head>
    <body>
        <h2>사용자 목록</h2>
        <table border=1>
            <tr>
                <th>ID</th>
                <th>이름</th><th>암호</th>
            </tr>

            <c:forEach var="row" items="${rs.rows}">
                <tr>
                    <td>${row.uid}</td> <td>${row.uname}</td>
                    <td>${row.upasswd}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
    </html>
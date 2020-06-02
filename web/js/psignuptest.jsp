<%@ page contentType="text/html;charset=KSC5601"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("KSC5601"); %>

<sql:setDataSource var ="conn"
driver = "oracle.jdbc.driver.OracleDriver"
url= "jdbc:oracle:thin:@35.225.0.199:3306/wppone"
user= "wp2p1"
password= "wp2PTwo!"
/>

<html>
<head><title>사용자 등록</title></head>
<body>
<h2>사용자 등록</h2>
<c:catch var="exception">
    <sql:update dataSource="jdbc/mydb" var="User Table">
        INSERT INTO user (uid, uname, upasswd) VALUES (?, ?, ?)
        <sql:param value="${ param.uid }" />
        <sql:param value="${ param.uname }" />
        <sql:param value="${ param.upasswd }" />
    </sql:update>
    <c:if test="${updatedTable >= 1}">
        ${ param.uname } 사용자가 성공적으로 등록되었습니다.
    </c:if>
</c:catch>
<c:if test="${exception!=null}">
    ID ${ param.uid }의 사용자 등록이 실패하였습니다.
</c:if>
</body>
</html>
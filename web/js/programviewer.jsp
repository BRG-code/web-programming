<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<sql:query var="rs" dataSource="jdbc/mydb">
    SELECT title, location, category, people, process_date, join_people_num, start_date, end_date, content, file FROM program WHERE no = ?
    <sql:param><c:out value="${param.articleno}"/></sql:param>
</sql:query>

<html>
<head>
    <meta charset="utf-8">
    <title>진행프로그램</title>
    <!-- css 선언 -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
<!-- 웹 페이지 윗 부분의 사업단 로고 부분 -->
<div style="background-color: white; height: 70px; width: 100%;">
    <a href="../index.jsp"><img style="margin-left: 15px; align-content: center;" src="../image/logo.png"></a>
    <c:if test="${empty sessionScope.loginedid}">
        <a href="register.jsp" style="display: inline; float: right; margin-top: 20px; margin-right: 10px;"><p>회원 가입</p></a>
        <p style="margin-top: 20px; margin-right: 10px; float: right; display: inline"> / </p>
        <a href="login.jsp" style="display: inline; float: right; margin-top: 20px; margin-right: 10px;"><p>로그인</p></a>
    </c:if>
    <c:if test="${!empty sessionScope.loginedid}">
        <a href="logout.jsp" style="display: inline; float: right; margin-top: 20px; margin-right: 10px;"><p>로그아웃</p></a>
        <p style="margin-top: 20px; margin-right: 10px; float: right; display: inline">${sessionScope.loginedname}님 환영합니다.  |   </p>
    </c:if>
</div>

<!-- 온라인신청 부분 -->
<div class="sub-title">
    <h2>온라인신청</h2>
</div>

<div style="border-bottom: 1px solid #E3E3E3; margin-left: 100px; margin-right: 100px;" id="content" class="content">
    <div>
        <h3 style="margin-left: 30px; font-weight: bold; font-size: 24pt">진행프로그램</h3>
    </div>
</div>

<style>
    .article_imf {
        font-size: 13pt;
        text-align: center;
    }

    .article_area {
        margin: 50px 125px;
    }
</style>

<c:forEach var="row" items="${rs.rows}">
    <fmt:parseDate value="${row.start_date}" var="start_date" pattern="yyyy-MM-dd HH:mm:ss.S"/>
    <fmt:parseDate value="${row.end_date}" var="end_date" pattern="yyyy-MM-dd HH:mm:ss.S"/>

    <!-- 게시글 정보 부분 -->
    <div class="article_area" style="margin-bottom: 20px; border-top: 2px solid #000000; border-bottom: 1px solid #cccccc">
        <style>
            th {
                padding-top: 10px;
                padding-bottom: 10px;
                padding-left: 10px;
                border-bottom: 1px solid #9E9E9E;
                font-weight: normal;
                text-align: left;
            }
        </style>
        <table style="width: 100%">
            <tr>
                <th style="padding-left: 0px; background-color: #fafafa; border-bottom: 1px solid #9E9E9E; text-align: center;" colspan="2"><h3 style="text-align: center; font-weight: bold">${row.title}</h3></th>
            </tr>
            <tr>
                <th style="background-color: #fafafa; border-right: 1px solid #9E9E9E; width: 10%;">접수기간</th>
                <th style="width: 90%;"><fmt:formatDate value="${start_date}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${end_date}" pattern="yyyy.MM.dd"/></th>
            </tr>
            <tr>
                <th style="background-color: #fafafa; border-right: 1px solid #9E9E9E; width: 10%;">사업년도/분류</th>
                <th style="width: 90%;"><fmt:formatDate value="${start_date}" pattern="yyyy"/> 년도 / ${row.category}</th>
            </tr>
            <tr>
                <th style="background-color: #fafafa; border-right: 1px solid #9E9E9E; width: 10%;">진행일</th>
                <fmt:parseDate value="${row.process_date}" var="processdate" pattern="yyyy-MM-dd HH:mm:ss.S"/>
                <th style="width: 90%;"><fmt:formatDate value="${processdate}" pattern="yy.MM.dd"/></th>
            </tr>
            <tr>
                <th style="background-color: #fafafa; border-right: 1px solid #9E9E9E; width: 10%;">진행장소</th>
                <th style="width: 90%;">${row.location}</th>
            </tr>
            <tr>
                <th style="background-color: #fafafa; border-right: 1px solid #9E9E9E; width: 10%;">정원</th>
                <th style="width: 90%;">${row.join_people_num} / ${row.people}</th>
            </tr>
            <tr>
                <th style="background-color: #fafafa; border-right: 1px solid #9E9E9E; width: 10%;">첨부파일</th>

                <!-- 첨부 파일이 있는 경우 -->
                <c:if test="${row.file eq 1}">
                    <div class="article_area" style="margin-bottom: 1px; border-top: 1px dashed #cccccc; border-bottom: 1px dashed #cccccc">
                        <div style="height: 10px"></div>
                        <!-- 첨부 파일 갖고오기 -->
                        <sql:query var="file" dataSource="jdbc/mydb">
                            SELECT filename, size, link FROM file WHERE board = 29 AND article = ?
                            <sql:param value="${param.articleno}"/>
                        </sql:query>

                        <th style="width: 90%;">
                        <c:forEach var="row" items="${file.rows}">
                            <a href="../upload/${row.link}"><p>${row.filename}</p></a><br>
                        </c:forEach>
                        </th>
                    </div>
                </c:if>

                <!-- 첨부 파일이 없는 경우 -->
                <c:if test="${row.file eq 0}">
                    <th style="width: 90%;">   </th>
                </c:if>
            </tr>
        </table>

        <% pageContext.setAttribute("newLineChar", "\n"); %>
        <!-- 내용 표시 -->
        <div style="margin-top: 20px">
            <p style="font-size: 13pt">${fn:replace(row.content, newLineChar, "<br/>")}</p>
        </div>

        <!-- 여백 주기용 -->
        <div style="height: 10px"></div>
    </div>
</c:forEach>

</body>
</html>
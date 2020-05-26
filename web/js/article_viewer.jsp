<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- DB에서 지정된 글을 받아옴. -->
<c:set var="sql" value="SELECT title, uploadtime, view, file, comment, u.name as name FROM table as n JOIN user as u ON u.id = n.id WHERE no = ?" />

<c:choose>
    <c:when test="${param.boardno eq 23}">
        <c:set var="sql" value="${fn:replace(sql, 'table', 'notice')}" />
    </c:when>
</c:choose>

<sql:query var="rs" dataSource="jdbc/mydb">
    <c:out value="${sql}" />
    <sql:param value="${param.articleno}" />
</sql:query>


<html>
<head>
    <meta charset="utf-8">
    <title>캡스톤디자인</title>
    <!-- css 선언 -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
<!-- 웹 페이지 윗 부분의 사업단 로고 부분 -->
<div style="background-color: white; height: 70px; width: 100%;">
    <img style="margin-left: 15px; align-content: center;" src="../image/logo.png">
</div>

<!-- 교육 프로그램 부분 -->
<div class="sub-title">
    <h2>교육프로그램</h2>
</div>

<div style="margin-left: 100px; margin-right: 100px;" id="content" class="content">
    <div>
        <h3 style="margin-left: 30px; font-weight: bold; font-size: 24pt">캡스톤디자인</h3>
        <div style="text-align: center;" class="sub7_tab_menu">
            <a href="../index.jsp" style="display: inline-block;" class="sub7_tab">소개</a>
            <a href="../js/notice.jsp" style="display: inline-block;" class="sub7_tab check">공지사항</a>
            <a href="" style="display: inline-block;" class="sub7_tab">서식</a>
            <a href="" style="display: inline-block;" class="sub7_tab">성과</a>
        </div>
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
    <fmt:parseDate value="${row.uploadtime}" var="noticePostDate" pattern="yyyy-MM-dd HH:mm:ss.S"/>

    <!-- 게시글 정보 부분 -->
    <div class="article_area" style="margin-bottom: 20px; border-top: 3px solid #000000; border-bottom: 1px solid #cccccc">
        <h3 class="article_imf" style="font-weight: bold">${row.title}</h3>
        <h3 class="article_imf">작성자: ${row.name} | 작성일: <fmt:formatDate value="${noticePostDate}" pattern="yyyy.MM.dd HH:mm:ss"/> | 조회수: ${row.view}</h3>
        <!-- 여백 주기용 -->
        <div style="height: 10px"></div>
    </div>

    <!-- 내용 표시 -->
    <div class="article_area">
        <p style="font-size: 13pt">${row.comment}</p>
    </div>

    <!-- 첨부 파일이 있는 경우 -->
    <c:if test="${row.file eq 1}">
    <div class="article_area" style="border-top: 1px dashed #cccccc; border-bottom: 1px dashed #cccccc">
        <div style="height: 10px"></div>
        <p style="font-size: 10pt">- 첨부파일</p>
    </div>
    </c:if>
</c:forEach>

<c:if test="${fn:length(rs.rows) eq 0}">
    <h3>게시글이 없습니다.</h3>
</c:if>

</body>
</html>
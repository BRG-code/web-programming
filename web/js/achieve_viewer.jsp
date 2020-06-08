<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- DB에서 지정된 글을 받아옴. -->
<c:set var="sql" value="SELECT no, title, uploadtime, view, file, comment, u.name as name, department, team, professor, image FROM achieve as n JOIN user as u ON u.id = n.id WHERE no = ?" />
<c:set var="viewupdate" value="UPDATE achieve SET view = view + 1 WHERE no = ?" />

<sql:query var="rs" dataSource="jdbc/mydb">
    <c:out value="${sql}" />
    <sql:param value="${param.articleno}" />
</sql:query>

<sql:update var="view" dataSource="jdbc/mydb">
    <c:out value="${viewupdate}" />
    <sql:param value="${param.articleno}" />
</sql:update>

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
    <a href="../index.jsp"><img style="margin-left: 15px; align-content: center;" src="../image/logo.png"></a>
    <c:if test="${empty sessionScope.loginedid}">
        <a href="register.jsp" style="display: inline; float: right; margin-top: 20px; margin-right: 10px;"><p>회원 가입</p></a>
        <p style="margin-top: 20px; margin-right: 10px; float: right; display: inline"> / </p>
        <a href="login.jsp" style="display: inline; float: right; margin-top: 20px; margin-right: 10px;"><p>로그인</p></a>
    </c:if>
    <c:if test="${!empty sessionScope.loginedid}">
        <a href="return_logout_result.jsp" style="display: inline; float: right; margin-top: 20px; margin-right: 10px;"><p>로그아웃</p></a>
        <p style="margin-top: 20px; margin-right: 10px; float: right; display: inline">${sessionScope.loginedname}님 환영합니다.  |   </p>
    </c:if>
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
                <a href="../js/notice.jsp" style="display: inline-block;" class="sub7_tab">공지사항</a>
                <a href="./form.jsp" style="display: inline-block;" class="sub7_tab">서식</a>
                <a href="" style="display: inline-block;" class="sub7_tab check">성과</a>
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

<c:catch var="e">
<c:forEach var="row" items="${rs.rows}">
    <fmt:parseDate value="${row.uploadtime}" var="noticePostDate" pattern="yyyy-MM-dd HH:mm:ss.S"/>

    <!-- 게시글 정보 부분 -->
    <div class="article_area" style="margin-bottom: 20px; border-top: 3px solid #000000; border-bottom: 1px solid #cccccc">
        <h3 class="article_imf" style="font-weight: bold">${row.title}</h3>
        <h3 class="article_imf">학과: ${row.department} | 팀명: ${row.team} | 지도교수: ${row.professor} | 작성일: <fmt:formatDate value="${noticePostDate}" pattern="yyyy.MM.dd HH:mm:ss"/> | 조회수: ${row.view}</h3>
        <!-- 여백 주기용 -->
        <div style="height: 10px"></div>
    </div>

    <!-- 내용 표시 -->
    <div class="article_area">
            ${row.comment}
        <br>
        <img style="width: 100%" src="${row.image}" onerror='this.src="../image/logo.png"'>
    </div>

    <!-- 첨부 파일이 있는 경우 -->
    <c:if test="${row.file eq 1}">
        <div class="article_area" style="margin-bottom: 1px; border-top: 1px dashed #cccccc; border-bottom: 1px dashed #cccccc">
            <div style="height: 10px"></div>
            <p style="font-size: 13pt">- 첨부파일</p>
            <!-- 첨부 파일 갖고오기 -->
            <c:set var="sql" value="SELECT filename, size, link FROM file WHERE board = 25 AND article = ?" />

            <sql:query var="file" dataSource="jdbc/mydb">
                <c:out value="${sql}" escapeXml="false"/>
                <sql:param value="${param.articleno}"/>
            </sql:query>

            <c:forEach var="filerow" items="${file.rows}">
                <a href="../upload/${filerow.link}"><p>${filerow.filename} (크기: ${filerow.size} bytes)</p></a>
            </c:forEach>
        </div>
    </c:if>

    <c:set var="num" value="${row.no}"/>

</c:forEach>

<!-- 이전 글 / 다음 글 -->
<div class="article_area" style="margin-top: 25px; padding-top: 10px; padding-bottom: 10px; height: 45px; border-top: 1px dashed #cccccc; border-bottom: 1px dashed #cccccc">
    <!-- 이전 글 갖고오기 -->
    <c:set var="sql" value="SELECT title, no FROM achieve WHERE no < ? ORDER BY no DESC LIMIT 1" />

    <sql:query var="previous" dataSource="jdbc/mydb">
        <c:out value="${sql}" escapeXml="false"/>
        <sql:param value="${param.articleno}" />
    </sql:query>

    <c:if test="${fn:length(previous.rows) != 0}">
        <c:forEach var="row" items="${previous.rows}">
            <a style="float: left; display: inline" href="achieve_viewer.jsp?articleno=${row.no}"><p style="font-size: 12pt">이전글 | ${row.title}</p></a>
        </c:forEach>
    </c:if>

    <c:if test="${fn:length(previous.rows) == 0}">
        <p style="float: left; display: inline; font-size: 12pt">이전글이 없습니다.</p>
    </c:if>

    <!-- 다음 글 갖고오기 -->
    <c:set var="sql" value="SELECT title, no FROM achieve WHERE no > ? ORDER BY no ASC LIMIT 1" />

    <sql:query var="next" dataSource="jdbc/mydb">
        <c:out value="${sql}" escapeXml="false"/>
        <sql:param value="${param.articleno}" />
    </sql:query>

    <c:forEach var="row" items="${next.rows}">
        <a style="float: right; display: inline" href="achieve_viewer.jsp?articleno=${row.no}"><p style="font-size: 12pt">다음글 | ${row.title}</p></a>
    </c:forEach>

    <c:if test="${fn:length(next.rows) == 0}">
        <p style="float: right; display: inline; font-size: 12pt">다음글이 없습니다.</p>
    </c:if>

    <c:if test="${e != null}">
        ${e}
    </c:if>
</c:catch>

    <!-- 수정, 삭제 버튼 -->
    <div style="margin-top: 50px;">
        <a href="write_achieve.jsp?num=${num}"><button>수정</button></a>
        <a href="return_delete_result.jsp?num=${num}"><button>삭제</button></a>
    </div>

    <!-- 이쁘게 보이기 위한 공백 -->
    <div style="width: 100%; height: 100px;"></div>
</div>
</body>
</html>
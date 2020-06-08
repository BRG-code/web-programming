<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 검색어가 없는 경우, DB에서 프로그램 리스트를 받아옴. -->
<c:if test="${empty param.sc_string || empty param.sc_type}">
    <sql:query var="rs" dataSource="jdbc/mydb">
        SELECT no, title, location, start_date, end_date, category, people, join_people_num FROM program ORDER BY no DESC
    </sql:query>
</c:if>

<!-- 검색 파라미터 존재 여부 판단하여 쿼리문 변경 -->
<c:if test="${!empty param.sc_string && !empty param.sc_type}">
    <!-- 제목 검색일 때 -->
    <c:if test="${param.sc_type=='title'}">
        <sql:query var="rs" dataSource="jdbc/mydb">
            SELECT no, title, location, start_date, end_date, category, people, join_people_num FROM program WHERE title LIKE ? ORDER BY no DESC
            <sql:param> <c:out value="%${param.sc_string}%" /></sql:param>
        </sql:query>
    </c:if>

    <!-- 내용 검색일 때 -->
    <c:if test="${param.sc_type=='comment'}">
        <sql:query var="rs" dataSource="jdbc/mydb">
            SELECT no, title, location, start_date, end_date, category, people, join_people_num FROM program WHERE comment LIKE ? ORDER BY no DESC
            <sql:param><c:out value="%${param.sc_string}%" /></sql:param>
        </sql:query>
    </c:if>

    <!-- 작성자 검색일 때 -->
    <c:if test="${param.sc_type=='writer'}">
        <sql:query var="rs" dataSource="jdbc/mydb">
            SELECT no, title, location, start_date, end_date, category, people, join_people_num FROM program as n JOIN user as u ON u.id = n.id WHERE n.id = (SELECT id FROM user WHERE name LIKE ?) ORDER BY no DESC
            <sql:param><c:out value="%${param.sc_string}%" /></sql:param>
        </sql:query>
    </c:if>

    <!-- 분류 검색일 때 -->
    <c:if test="${param.sc_type=='category'}">
        <sql:query var="rs" dataSource="jdbc/mydb">
            SELECT no, title, location, start_date, end_date, category, people, join_people_num FROM program WHERE category = ? ORDER BY no DESC
            <sql:param value="${param.sc_string}"/>
        </sql:query>
    </c:if>

</c:if>

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
        <a href="return_logout_result.jsp" style="display: inline; float: right; margin-top: 20px; margin-right: 10px;"><p>로그아웃</p></a>
        <p style="margin-top: 20px; margin-right: 10px; float: right; display: inline">${sessionScope.loginedname}님 환영합니다.  |   </p>
    </c:if>
</div>


<!-- 교육 프로그램 부분 -->
<div class="sub-title">
    <h2>온라인신청</h2>
</div>

<div style="margin-left: 100px; margin-right: 100px;" id="content" class="content">
    <div>
        <h3 style="margin-left: 30px; font-weight: bold; font-size: 24pt">진행프로그램</h3>

        <!-- 검색 창 -->
        <div style="height: 70px; margin-top: 30px; margin-left: 30px; margin-right: 30px; background-color: #f2f2f2">
            <form style="display:inline;" action="">
                <!-- 검색어 타입 선택 -->
                <!-- margin: top right bottom left -->
                <select style="margin: 20px 40px 20px 30px;" name="sc_type">
                    <option value="title" selected>제목</option>
                    <option value="comment">내용</option>
                    <option value="writer">작성자</option>
                </select>

                <!-- 검색어 입력 -->
                <input style="width: 50%; height: 33px;" type="text" placeholder="검색 내용을 입력해주세요" name="sc_string">
                <button class="search-btn" type="submit"><span style="margin: 0px 5px 0px 5px" class="glyphicon glyphicon-search"></span>검색</button>
            </form>
        </div>

        <div style="width: 100%; text-align: center;" class="sub7_tab_menu">
            <a href="../index.jsp" style="display: inline-block;" class="sub7_tab check">전체 프로그램</a>
            <a href="../js/notice.jsp" style="display: inline-block;" class="sub7_tab">진행 프로그램</a>
            <a style="display: inline-block;" class="sub7_tab">신청한 프로그램</a>

            <div style="margin-top: 20px">
                <a style="display: inline;" href="programlist.jsp">전체</a>
                <p style="display: inline;">  |  </p>
                <a style="display: inline;" href="?sc_type=category&sc_string=비교과교육">비교과교육</a>
                <p style="display: inline;">  |  </p>
                <a style="display: inline;" href="?sc_type=category&sc_string=창의융합전공">창의융합전공</a>
                <p style="display: inline;">  |  </p>
                <a style="display: inline;" href="?sc_type=category&sc_string=캡스톤디자인">캡스톤디자인</a>
                <p style="display: inline;">  |  </p>
                <a style="display: inline;" href="?sc_type=category&sc_string=프로젝트LAB">프로젝트LAB</a>
                <p style="display: inline;">  |  </p>
                <a style="display: inline;" href="?sc_type=category&sc_string=현장실습">현장실습</a>
                <p style="display: inline;">  |  </p>
                <a style="display: inline;" href="?sc_type=category&sc_string=창업교육">창업교육</a>
                <p style="display: inline;">  |  </p>
                <a style="display: inline;" href="programlist.jsp?sc_type=category&sc_string=재직자교육">재직자교육</a>
                <p style="display: inline;">  |  </p>
            </div>
        </div>
        <div style="margin-top: 10px; margin-left: 250px; width: 72%; border-bottom: 1px solid #E2E2E2;"> </div>

        <c:if test="${fn:length(rs.rows) eq 0}">
            <div style="padding-top: 30px; padding-bottom: 30px; margin-left: 250px; width: 72%; margin-top: 10px; border-top: 2px solid #000; border-bottom: 1px solid #000">
                <p style="text-align: center; font-size: 14pt;">게시물이 없습니다.</p>
            </div>
        </c:if>

        <div>
            <style>
                table {
                    margin-top: 15px;
                    margin-left: 250px;
                    width: 72%;
                    border-top: 3px solid #111111;
                }

                th {
                    padding-top: 10px;
                    padding-bottom: 10px;
                    border-right: 1px dotted #999999;
                    border-bottom: 1px solid #999999;
                    text-align: center;
                    font-weight: normal;
                }
            </style>

            <c:forEach var="row" items="${rs.rows}">
            <table>
                <tr>
                    <th style="font-weight: bold; border-bottom: 1px solid #000">프로그램명</th>
                    <th style="font-weight: bold; border-bottom: 1px solid #000" colspan="2"><a href="programviewer.jsp?articleno=${row.no}">${row.title}</a></th>
                    <jsp:useBean id="now" class="java.util.Date" />
                    <fmt:parseDate value="${row.start_date}" pattern="yyyy-MM-dd HH:mm:ss.S" var="startDate" />
                    <fmt:parseDate value="${row.end_date}" pattern="yyyy-MM-dd HH:mm:ss.S" var="endDate" />

                    <fmt:formatDate value="${now}" pattern="yyyyMMddhhmm" var="nowDate" />             <%-- 오늘날짜 --%>
                    <fmt:formatDate value="${startDate}" pattern="yyyyMMddhhmm" var="startdate"/>       <%-- 시작날짜 --%>
                    <fmt:formatDate value="${endDate}" pattern="yyyyMMddhhmm" var="enddate"/>        <%-- 마감날짜 --%>

                    <c:if test="${enddate < nowDate}">
                        <th style="font-weight: bold; border-right: None; border-bottom: 1px solid #000">종료된 프로그램</th>
                    </c:if>

                    <c:if test="${startDate < nowDate && enddate > nowDate}">
                        <th style="font-weight: bold; border-right: None; border-bottom: 1px solid #000">진행 중인 프로그램</th>
                    </c:if>

                    <c:if test="${startDate > nowDate && endDate < nowDate}">
                        <th style="font-weight: bold; border-right: None; border-bottom: 1px solid #000">대기 중인 프로그램</th>
                    </c:if>
                </tr>
                <tr>
                    <th>진행장소</th>
                    <th>${row.location}</th>
                    <th>접수기간</th>
                    <fmt:parseDate value="${row.start_date}" var="start_date" pattern="yyyy-MM-dd HH:mm:ss.S"/>
                    <fmt:parseDate value="${row.end_date}" var="end_date" pattern="yyyy-MM-dd HH:mm:ss.S"/>

                    <th style="border-right: None;" ><fmt:formatDate value="${start_date}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${end_date}" pattern="yyyy.MM.dd"/></th>
                </tr>
                <tr>
                    <th>분류</th>
                    <th>${row.category}</th>
                    <th>정원</th>
                    <th style="border-right: 0px;">${row.join_people_num} / ${row.people}</th>
                </tr>
                </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
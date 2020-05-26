<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/mydb">
    select notice.no,notice.title,user.name,notice.uploadtime,notice.view,notice.file from notice JOIN user  ON user.id=notice.id
</sql:query>
<html>
<head>
    <title>
       캡스톤디자인
    </title>
    <!-- css 선언 -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<!-- 웹 페이지 윗 부분의 사업단 로고 부분 -->
<div style="background-color: white; height: 70px; width: 100%;">
    <img style="margin-left: 15px; align-content: center;" src="image/logo.png">
</div>

<!-- 교육 프로그램 부분 -->
<div class="sub-title">
    <h2>교육프로그램</h2>
</div>

<div style="margin-left: 100px; margin-right: 100px;" id="content" class="content">
    <style>
        .sub7_tab_menu{
            margin-top:20px;
        }
        .sub7_tab_menu > .sub7_tab{
            display: inline-block;
            border: 1px solid #e1e1e1;
            border-bottom: none;
            width: 24%;
            text-align: center;
            line-height: 40px;
            background: #eee;
            color: #000000;
            font-size: 12pt;
        }
        .check{
            background-color: #ffffff!important;
            border-top:3px solid #0075c2!important;
        }
    </style>

    <div>
        <h3 style="margin-left: 30px; font-weight: bold; font-size: 24pt">캡스톤디자인</h3>
        <div class="sub7_tab_menu" style="text-align: center;">
            <a class="sub7_tab " href="/WP2_project1_war_exploded" style="display: inline-block;">소개</a>
            <a class="sub7_tab check" href="" style="display: inline-block;">공지사항</a>
            <a class="sub7_tab" href="" style="display: inline-block;">서식</a>
            <a class="sub7_tab" href="" style="display: inline-block;">성과</a>

        </div>

        <table style="margin-left: 30px; margin-right: 100px;" class="cap-list">
            <thead>
            <tr>
                <th>NO</th>
                <th>제목</th>
                <th>작성자</th>
                <th>등록일</th>
                <th>진행일</th>
                <th>조회수</th>
                <th>첨부파일</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="row" items="${rs.rows}">
            <tr>
                <td>${row.no}</td>
                <td>${row.title}</td>
                <td>${row.name}</td>
                <td>${row.uploadtime}</td>
                <td>${row.view}</td>
                <td>${row.file}</td>
                <td>${row.comment}</td>
            </tr>
            </c:forEach>


            </tbody>
        </table>
    </div>
</div>
</body>
</html>

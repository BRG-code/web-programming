<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>캡스톤디자인</title>
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
        .sub7_tab_menu  .sub7_tab{
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
            <a class="sub7_tab" href="http://localhost:8080/WP2_project1_war_exploded" style="display: inline-block;">소개</a>
            <a class="sub7_tab" href="http://localhost:8080/WP2_project1_war_exploded/Notice.jsp" style="display: inline-block;">공지사항</a>
            <a class="sub7_tab check" href="" style="display: inline-block;">서식</a>
            <a class="sub7_tab" href="http://localhost:8080/WP2_project1_war_exploded/outcome.jsp" style="display: inline-block;">성과</a>

            <div class="board-btn" style="float: right; margin-right: 30px; margin-bottom: 15px;">
                <a href="">
                    <button id="write" data-align="right">캡스톤<br>디자인신청</button>
                </a>
            </div>
        </div>

        <table style="margin-left: 30px; margin-right: 100px;" class="cap-list">
            <thead>
            <tr>
                <th>NO</th>
                <th>분류</th>
                <th>제목</th>
                <th>담당자</th>
                <th>등록일</th>
                <th>조회수</th>
                <th>첨부</th>

            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>Content</td>
                <td>Content</td>
                <td>Content</td>
                <td>Content</td>
                <td>Content</td>
                <td>Content</td>
            </tr>
            <tr>
                <td>2</td>
                <td>Content</td>
                <td>Content</td>
                <td>Content</td>
                <td>Content</td>
                <td>Content</td>
                <td>Content</td>
            </tr>
            <tbody>
        </table>
    </div>
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- DB에서 공지사항 글 리스트를 받아옴. -->
<sql:query var="rs" dataSource="jdbc/mydb">
  SELECT no, title, uploadtime, view, file, u.name as name FROM notice as n JOIN user as u ON u.id = n.id ORDER BY no DESC
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
      <a class="sub7_tab" href="../index.jsp" style="display: inline-block;">소개</a>
      <a class="sub7_tab check" href="" style="display: inline-block;">공지사항</a>
      <a class="sub7_tab" href="" style="display: inline-block;">서식</a>
      <a class="sub7_tab" href="" style="display: inline-block;">성과</a>
    </div>

    <table style="margin-left: 30px; margin-right: 100px; margin-top: 30px" class="cap-list">
      <thead>
      <tr>
        <th>NO</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th>조회수</th>
        <th>첨부</th>
      </tr>
      </thead>
      <tbody>
      <!-- DB에서 받은 내용을 for 문으로 출력 -->
      <c:forEach var="row" items="${rs.rows}">
        <tr>
          <td style="width: 5%">${row.no}</td>
          <td style="text-align: left; width: 50%">${row.title}</td>
          <td style="width: 10%">${row.name}</td>
          <td style="width: 15%">${row.uploadtime}</td>
          <td style="width: 10%">${row.view}</td>
          <!-- 첨부파일이 있다면 파일 아이콘을 표시. 첨부파일이 없다면 아무 것도 표시 안함.-->
          <c:choose>
            <c:when test="${row.file eq 1}">
              <td style="width: 10%;"><img src="../image/icon_file.png"></td>
            </c:when>
            <c:otherwise>
              <td style="width: 10%;"> </td>
            </c:otherwise>
          </c:choose>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<!-- 이쁘게 보이기 위한 공백 -->
<div style="width: 100%; height: 100px;"></div>

</body>
</html>
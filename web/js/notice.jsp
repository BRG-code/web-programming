<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${empty param.sc_string || empty param.sc_type}">
  <!-- DB에서 공지사항 글 리스트를 받아옴. -->
  <sql:query var="rs" dataSource="jdbc/mydb">
    SELECT no, title, uploadtime, view, file, u.name as name FROM notice as n JOIN user as u ON u.id = n.id ORDER BY no DESC
  </sql:query>
</c:if>

<!-- 검색 파라미터 존재 여부 판단하여 쿼리문 변경 -->
<c:if test="${!empty param.sc_string && !empty param.sc_type}">
  <!-- 제목 검색일 때 -->
  <c:if test="${param.sc_type=='title'}">
    <sql:query var="rs" dataSource="jdbc/mydb">
      SELECT no, title, uploadtime, view, file, u.name as name FROM notice as n JOIN user as u ON u.id = n.id WHERE title LIKE ? ORDER BY no DESC
      <sql:param><c:out value="%${param.sc_string}%" /></sql:param>
    </sql:query>
  </c:if>

  <!-- 내용 검색일 때 -->
  <c:if test="${param.sc_type=='comment'}">
    <sql:query var="rs" dataSource="jdbc/mydb">
      SELECT no, title, uploadtime, view, file, u.name as name FROM notice as n JOIN user as u ON u.id = n.id WHERE comment LIKE ? ORDER BY no DESC
      <sql:param><c:out value="%${param.sc_string}%" /></sql:param>
    </sql:query>
  </c:if>

  <!-- 작성자 검색일 때 -->
  <c:if test="${param.sc_type=='writer'}">
    <sql:query var="rs" dataSource="jdbc/mydb">
      SELECT no, title, uploadtime, view, file, u.name as name FROM notice as n JOIN user as u ON u.id = n.id WHERE n.id = (SELECT id FROM user WHERE name LIKE ?) ORDER BY no DESC
      <sql:param><c:out value="%${param.sc_string}%" /></sql:param>
    </sql:query>
  </c:if>
</c:if>





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
      <a href="../js/notice.jsp" style="display: inline-block;" class="sub7_tab check" >공지사항</a>
      <a href="" style="display: inline-block;" class="sub7_tab">서식</a>
      <a href="" style="display: inline-block;" class="sub7_tab">성과</a>
    </div>

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

    <!-- 게시글 총 개수 / 검색 상태 표시 -->
    <c:if test="${!empty param.sc_type && !empty param.sc_string}">
      <c:if test="${param.sc_type == 'title'}">
        <p style="margin-left: 28px; margin-top: 30px; font-size: 14pt"><c:out value="제목 \'${param.sc_string}\'"/>에 대한 검색 결과 게시글이 총 <c:out value="${fn:length(rs.rows)}"></c:out>개 있습니다.</p>
      </c:if>

      <c:if test="${param.sc_type == 'comment'}">
        <p style="margin-left: 28px; margin-top: 30px; font-size: 14pt"><c:out value="내용 \'${param.sc_string}\'"/>에 대한 검색 결과 게시글이 총 <c:out value="${fn:length(rs.rows)}"></c:out>개 있습니다.</p>
      </c:if>

      <c:if test="${param.sc_type == 'writer'}">
        <p style="margin-left: 28px; margin-top: 30px; font-size: 14pt"><c:out value="작성자 \'${param.sc_string}\'"/>에 대한 검색 결과 게시글이 총 <c:out value="${fn:length(rs.rows)}"></c:out>개 있습니다.</p>
      </c:if>
    </c:if>

    <c:if test="${empty param.sc_type || empty param.sc_string}">
      <p style="margin-left: 28px; margin-top: 30px; font-size: 14pt">게시글이 총 <c:out value="${fn:length(rs.rows)}"></c:out>개 있습니다.</p>
    </c:if>


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
          <fmt:parseDate value="${row.uploadtime}" var="noticePostDate" pattern="yyyy-MM-dd HH:mm:ss.S"/>

          <td style="width: 5%">${row.no}</td>
          <td style="text-align: left; width: 50%;"><a style="color: #000000" href="article_viewer.jsp?boardno=23&articleno=${row.no}">${row.title}</a></td>
          <td style="width: 10%">${row.name}</td>
          <td style="width: 15%"><fmt:formatDate value="${noticePostDate}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
          <td style="width: 10%">${row.view}</td>
          <!-- 첨부파일이 있다면 파일 아이콘을 표시. 첨부파일이 없다면 아무 것도 표시 안함.-->
          <c:choose>
            <c:when test="${row.file == 1}">
              <td style="width: 10%;"><img src="../image/icon_file.png"></td>
            </c:when>
            <c:otherwise>
              <td style="width: 10%;"> </td>
            </c:otherwise>
          </c:choose>
        </tr>
      </c:forEach>
      <c:if test="${fn:length(rs.rows) eq 0}">
        <tr><td colspan="6">게시글이 없습니다.</td></tr>
      </c:if>
      </tbody>
    </table>
  </div>
</div>

<!-- 이쁘게 보이기 위한 공백 -->
<div style="width: 100%; height: 100px;"></div>

</body>
</html>
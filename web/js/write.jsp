<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>캡스톤 디자인 신청</title>
    <!-- css 선언 -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<!-- 웹 페이지 윗 부분의 사업단 로고 부분 -->
<div style="background-color: white; height: 70px; width: 100%;">
    <a href="../index.jsp"><img style="margin-left: 15px; align-content: center;" src="../image/logo.png"></a>
</div>

<!-- 교육 프로그램 부분 -->
<div style="margin-bottom: 30px" class="sub-title">
    <h2>캡스톤 디자인 신청</h2>
</div>

<!-- 글 쓰는 영역 -->
<div class="write-area">
<form class="write-area" method="post" action="owrite.jsp" enctype="multipart/form-data">
    <input class="write-area" style="display: inline" type="text" name="title" size="63"
           placeholder="프로젝트 제목을 입력해주세요."
           required>

    <br> <h3 class="write-area">프로젝트 소개<h3> <br>
    <textarea name="contents" rows="8" cols="50"
              placeholder="내용을 기술해주세요."
              required></textarea>
    <br>
    <h3 class="write-area">첨부 파일<h3><br>
    <table style="margin-bottom: 10px;">
        <tr>
            <td style="font-size: 12pt">파일 이름:</td>
            <td><input type="file" name="file1"></td>
        </tr>
        <tr>
            <td>파일 이름:</td>
            <td><input type="file" name="file2"></td>
        </tr>
    </table>
    <input type="submit" value="글 등록">
</form>
</div>
</body>
</html>

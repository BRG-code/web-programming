<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "com.oreily.servlet.*"%>
<%@ page import = "com.oreilly.servlet.multipart.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="utf-8">
    <title>성과</title>
    <!-- css 선언 -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/style.css">
</head>

<c:if test="${empty sessionScope.loginedid || empty sessionScope.loginedname}" >
    <script>
        alert("로그인이 되어있지 않은 상태입니다. 로그인을 먼저 진행하세요.")
        location.href="javascript:history.back(-1)"
    </script>
</c:if>

<body>
<script src="//cdn.ckeditor.com/4.14.0/basic/ckeditor.js"></script>

<!-- 웹 페이지 윗 부분의 사업단 로고 부분 -->
<div style="background-color: white; height: 70px; width: 100%;">
    <a href="../index.jsp"><img style="margin-left: 15px; align-content: center;" src="../image/logo.png"></a>
</div>

<!-- 교육 프로그램 부분 -->
<div style="margin-bottom: 30px" class="sub-title">
    <h2>캡스톤 디자인 신청</h2>
</div>

<div class="write-area">
<form method="post" action="oachieve.jsp" enctype="multipart/form-data">
    <select style="width: 150px" name="department">
        <option value="간호학과">간호학과</option>
        <option value="건축공학과">건축공학과</option>
        <option value="건축공학심화트랙">건축공학심화트랙</option>
        <option value="건축학과">건축학과</option>
        <option value="경상학부">경상학부</option>
        <option value="경영학과">경영학과</option>
        <option value="경제학과">경제학과</option>
        <option value="고고문화인류학과">고고문화인류학과</option>
        <option value="고고학과">고고학과</option>
        <option value="공공인재학부">공공인재학부</option>
        <option value="관광경영학과">관광경영학과</option>
        <option value="교육학과">교육학과</option>
        <option value="금융보험학과">금융보험학과</option>
        <option value="기계공학과">기계공학과</option>
        <option value="기계공학심화트랙">기계공학심화트랙</option>
        <option value="기계ㆍ신소재공학과">기계ㆍ신소재공학과</option>
        <option value="기초과학부">기초과학부</option>
        <option value="도시및지역개발학과">도시및지역개발학과</option>
        <option value="독일언어문화학과">독일언어문화학과</option>
        <option value="무역학과">무역학과</option>
        <option value="문화인류학과">문화인류학과</option>
        <option value="물리학과">물리학과</option>
        <option value="미래사회공학부">미래사회공학부</option>
        <option value="미술학과">미술학과</option>
        <option value="사회과학부">사회과학부</option>
        <option value="사회복지학과">사회복지학과</option>
        <option value="생명과학과">생명과학과</option>
        <option value="생활과학부">생활과학부</option>
        <option value="스마트운송기계ㆍ신소재공학부">스마트운송기계ㆍ신소재공학부</option>
        <option value="식품공학과">식품공학과</option>
        <option value="식품영양트랙">식품영양트랙</option>
        <option value="식품영양학과">식품영양학과</option>
        <option value="신소재공학과">신소재공학과</option>
        <option value="신소재공학트랙">신소재공학트랙</option>
        <option value="아동학과">아동학과</option>
        <option value="에너지ICT공학부">에너지ICT공학부</option>
        <option value="영어영문학과" selected="selected">영어영문학과</option>
        <option value="원예과학과">원예과학과</option>
        <option value="원예생명과학트랙">원예생명과학트랙</option>
        <option value="융합소프트웨어학과">융합소프트웨어학과</option>
        <option value="인문학부">인문학부</option>
        <option value="일어일문학과">일어일문학과</option>
        <option value="전기공학과">전기공학과</option>
        <option value="전기및제어공학과">전기및제어공학과</option>
        <option value="전자상거래학과">전자상거래학과</option>
        <option value="전자ㆍ정보통신공학과">전자ㆍ정보통신공학과</option>
        <option value="정보보호학과">정보보호학과</option>
        <option value="정보전자공학과">정보전자공학과</option>
        <option value="정보전자공학심화트랙">정보전자공학심화트랙</option>
        <option value="정보통신공학과">정보통신공학과</option>
        <option value="정보통신공학심화트랙">정보통신공학심화트랙</option>
        <option value="정치언론홍보학과">정치언론홍보학과</option>
        <option value="제어로봇공학과">제어로봇공학과</option>
        <option value="조경학과">조경학과</option>
        <option value="조선공학과">조선공학과</option>
        <option value="조선해양공학과">조선해양공학과</option>
        <option value="조선해양생산트랙">조선해양생산트랙</option>
        <option value="조선해양설계트랙">조선해양설계트랙</option>
        <option value="중국언어와문화학과">중국언어와문화학과</option>
        <option value="지적학과">지적학과</option>
        <option value="체육학과">체육학과</option>
        <option value="친환경바이오융합학과">친환경바이오융합학과</option>
        <option value="컴퓨터공학과">컴퓨터공학과</option>
        <option value="컴퓨터ㆍ정보보호학부">컴퓨터ㆍ정보보호학부</option>
        <option value="토목공학과">토목공학과</option>
        <option value="토목공학트랙">토목공학트랙</option>
        <option value="패션의류학과">패션의류학과</option>
        <option value="한약자원트랙">한약자원트랙</option>
        <option value="한약자원학과">한약자원학과</option>
        <option value="해양수산자원트랙">해양수산자원트랙</option>
        <option value="해양수산자원학과">해양수산자원학과</option>
        <option value="해양시스템공학과">해양시스템공학과</option>
        <option value="화학과">화학과</option>
        <option value="환경공학과">환경공학과</option>
    </select>
    <br><br>
    <input style="display: inline" type="text" name="team"
           placeholder="팀명"
           required>

    <input style="display: inline"  type="text" name="professor"
           placeholder="지도 교수"
           required>
    <br><br>
    <input style="width: 500px" type="text" name="title" size="50"
           placeholder="제목"
           required>
    <br><br>

    <div>
        <textarea name="comment" class="form-control" id="comment"></textarea>
        <script type="text/javascript">
            CKEDITOR.replace('comment', {height: 500 });
        </script>
    </div>

    <table>
        <tr>
            <td>썸네일 이미지:</td>
            <td><input type="file" name="file1"></td>
        </tr>
        <tr>
            <td>첨부 파일1:</td>
            <td><input type="file" name="file2"></td>
        </tr>
        <tr>
            <td>첨부 파일2:</td>
            <td><input type="file" name="file3"></td>
        </tr>
        <tr>
            <td>첨부 파일3:</td>
            <td><input type="file" name="file4"></td>
        </tr>
    </table>
    <input type="submit" value="글 등록">
</form>
</div>
</body>
</html>

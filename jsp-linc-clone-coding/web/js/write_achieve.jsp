<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "com.oreily.servlet.*"%>
<%@ page import = "com.oreilly.servlet.multipart.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

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
<!-- 웹 페이지 윗 부분의 사업단 로고 부분 -->
<div style="background-color: white; height: 70px; width: 100%;">
    <a href="../index.jsp"><img style="margin-left: 15px; align-content: center;" src="../image/logo.png"></a>
</div>

<!-- 교육 프로그램 부분 -->
<div style="margin-bottom: 30px" class="sub-title">
    <h2>캡스톤 디자인 신청</h2>
</div>

<c:if test="${param.num !=null}">
    <sql:query var="rs" dataSource="jdbc/mydb">
        SELECT id, title, comment, department, team, professor FROM achieve WHERE no = ?
        <sql:param value="${param.num}" />
    </sql:query>
</c:if>

<c:forEach var="row" items="${rs.rows}">
    <c:if test="${param.num !=null}">
        <c:if test="${row.id != sessionScope.loginedid}">
            <script>
                alert("작성자만 수정 할 수 있습니다.")
                location.href="javascript:history.back(-1)"
            </script>
        </c:if>
    </c:if>

    <div class="write-area">
       <c:if test="${param.num != null}">
            <c:set var="num" value="${param.num}" scope="session"/>
       </c:if>
    <form method="post" action="update_achieve.jsp">
        <select style="width: 150px" name="department">
            <option value="간호학과" <c:if test="${row.department eq '간호학과'}"><c:out value = "selected" /></c:if>>간호학과</option>
            <option value="건축공학과" <c:if test="${row.department eq '건축공학과'}"><c:out value = "selected" /></c:if>>건축공학과</option>
            <option value="건축공학심화트랙" <c:if test="${row.department eq '건축공학심화트랙'}"><c:out value = "selected" /></c:if>>건축공학심화트랙</option>
            <option value="건축학과" <c:if test="${row.department eq '건축학과'}"><c:out value = "selected" /></c:if>>건축학과</option>
            <option value="경상학부" <c:if test="${row.department eq '경상학부'}"><c:out value = "selected" /></c:if>>경상학부</option>
            <option value="경영학과" <c:if test="${row.department eq '경영학과'}"><c:out value = "selected" /></c:if>>경영학과</option>
            <option value="경제학과" <c:if test="${row.department eq '경제학과'}"><c:out value = "selected" /></c:if>>경제학과</option>
            <option value="고고문화인류학과" <c:if test="${row.department eq '고고문화인류학과'}"><c:out value = "selected" /></c:if>>고고문화인류학과</option>
            <option value="고고학과" <c:if test="${row.department eq '고고학과'}"><c:out value = "selected" /></c:if>>고고학과</option>
            <option value="공공인재학부" <c:if test="${row.department eq '공공인재학부'}"><c:out value = "selected" /></c:if>>공공인재학부</option>
            <option value="관광경영학과" <c:if test="${row.department eq '관광경영학과'}"><c:out value = "selected" /></c:if>>관광경영학과</option>
            <option value="교육학과" <c:if test="${row.department eq '교육학과'}"><c:out value = "selected" /></c:if>>교육학과</option>
            <option value="금융보험학과" <c:if test="${row.department eq '금융보험학과'}"><c:out value = "selected" /></c:if>>금융보험학과</option>
            <option value="기계공학과" <c:if test="${row.department eq '기계공학과'}"><c:out value = "selected" /></c:if>>기계공학과</option>
            <option value="기계공학심화트랙" <c:if test="${row.department eq '기계공학심화트랙'}"><c:out value = "selected" /></c:if>>기계공학심화트랙</option>
            <option value="기계ㆍ신소재공학과" <c:if test="${row.department eq '기계ㆍ신소재공학과'}"><c:out value = "selected" /></c:if>>기계ㆍ신소재공학과</option>
            <option value="기초과학부" <c:if test="${row.department eq '기초과학부'}"><c:out value = "selected" /></c:if>>기초과학부</option>
            <option value="도시및지역개발학과" <c:if test="${row.department eq '도시및지역개발학과'}"><c:out value = "selected" /></c:if>>도시및지역개발학과</option>
            <option value="독일언어문화학과" <c:if test="${row.department eq '독일언어문화학과'}"><c:out value = "selected" /></c:if>>독일언어문화학과</option>
            <option value="무역학과" <c:if test="${row.department eq '무역학과'}"><c:out value = "selected" /></c:if>>무역학과</option>
            <option value="문화인류학과" <c:if test="${row.department eq '문화인류학과'}"><c:out value = "selected" /></c:if>>문화인류학과</option>
            <option value="물리학과" <c:if test="${row.department eq '물리학과'}"><c:out value = "selected" /></c:if>>물리학과</option>
            <option value="미래사회공학부" <c:if test="${row.department eq '미래사회공학부'}"><c:out value = "selected" /></c:if>>미래사회공학부</option>
            <option value="미술학과" <c:if test="${row.department eq '미술학과'}"><c:out value = "selected" /></c:if>>미술학과</option>
            <option value="사회과학부" <c:if test="${row.department eq '사회과학부'}"><c:out value = "selected" /></c:if>>사회과학부</option>
            <option value="사회복지학과" <c:if test="${row.department eq '사회복지학과'}"><c:out value = "selected" /></c:if>>사회복지학과</option>
            <option value="생명과학과" <c:if test="${row.department eq '생명과학과'}"><c:out value = "selected" /></c:if>>생명과학과</option>
            <option value="생활과학부" <c:if test="${row.department eq '생명과학부'}"><c:out value = "selected" /></c:if>>생활과학부</option>
            <option value="스마트운송기계ㆍ신소재공학부" <c:if test="${row.department eq '스마트운송기계ㆍ신소재공학부'}"><c:out value = "selected" /></c:if>>스마트운송기계ㆍ신소재공학부</option>
            <option value="식품공학과" <c:if test="${row.department eq '식품공학과'}"><c:out value = "selected" /></c:if>>식품공학과</option>
            <option value="식품영양트랙" <c:if test="${row.department eq '식품영양트랙'}"><c:out value = "selected" /></c:if>>식품영양트랙</option>
            <option value="식품영양학과" <c:if test="${row.department eq '식품영양학과'}"><c:out value = "selected" /></c:if>>식품영양학과</option>
            <option value="신소재공학과" <c:if test="${row.department eq '신소재공학과'}"><c:out value = "selected" /></c:if>>신소재공학과</option>
            <option value="신소재공학트랙" <c:if test="${row.department eq '신소재공학트랙'}"><c:out value = "selected" /></c:if>>신소재공학트랙</option>
            <option value="아동학과" <c:if test="${row.department eq '아동학과'}"><c:out value = "selected" /></c:if>>아동학과</option>
            <option value="에너지ICT공학부" <c:if test="${row.department eq '에너지ICT공학부'}"><c:out value = "selected" /></c:if>>에너지ICT공학부</option>
            <option value="영어영문학과" <c:if test="${row.department eq '영어영문학과'}"><c:out value = "selected" /></c:if>>영어영문학과</option>
            <option value="원예과학과" <c:if test="${row.department eq '원에과학과'}"><c:out value = "selected" /></c:if>>원예과학과</option>
            <option value="원예생명과학트랙" <c:if test="${row.department eq '원예생명과학트랙'}"><c:out value = "selected" /></c:if>>원예생명과학트랙</option>
            <option value="융합소프트웨어학과" <c:if test="${row.department eq '융합소프트웨어학과'}"><c:out value = "selected" /></c:if>>융합소프트웨어학과</option>
            <option value="인문학부" <c:if test="${row.department eq '인문학부'}"><c:out value = "selected" /></c:if>>인문학부</option>
            <option value="일어일문학과" <c:if test="${row.department eq '일어일문학과'}"><c:out value = "selected" /></c:if>>일어일문학과</option>
            <option value="전기공학과" <c:if test="${row.department eq '전기공학과'}"><c:out value = "selected" /></c:if>>전기공학과</option>
            <option value="전기및제어공학과" <c:if test="${row.department eq '전기및제어공학과'}"><c:out value = "selected" /></c:if>>전기및제어공학과</option>
            <option value="전자상거래학과" <c:if test="${row.department eq '전자상거래학과'}"><c:out value = "selected" /></c:if>>전자상거래학과</option>
            <option value="전자ㆍ정보통신공학과" <c:if test="${row.department eq '전자ㆍ정보통신공학과'}"><c:out value = "selected" /></c:if>>전자ㆍ정보통신공학과</option>
            <option value="정보보호학과" <c:if test="${row.department eq '정보보호학과'}"><c:out value = "selected" /></c:if>>정보보호학과</option>
            <option value="정보전자공학과" <c:if test="${row.department eq '정보전자공학과'}"><c:out value = "selected" /></c:if>>정보전자공학과</option>
            <option value="정보전자공학심화트랙" <c:if test="${row.department eq '정보전자공학심화트랙'}"><c:out value = "selected" /></c:if>>정보전자공학심화트랙</option>
            <option value="정보통신공학과" <c:if test="${row.department eq '정보통신공학과'}"><c:out value = "selected" /></c:if>>정보통신공학과</option>
            <option value="정보통신공학심화트랙" <c:if test="${row.department eq '정보통신공학심화트랙'}"><c:out value = "selected" /></c:if>>정보통신공학심화트랙</option>
            <option value="정치언론홍보학과" <c:if test="${row.department eq '정치언론홍보학과'}"><c:out value = "selected" /></c:if>>정치언론홍보학과</option>
            <option value="제어로봇공학과" <c:if test="${row.department eq '제어로봇공학과'}"><c:out value = "selected" /></c:if>>제어로봇공학과</option>
            <option value="조경학과" <c:if test="${row.department eq '조경학과'}"><c:out value = "selected" /></c:if>>조경학과</option>
            <option value="조선공학과" <c:if test="${row.department eq '조선공학과'}"><c:out value = "selected" /></c:if>>조선공학과</option>
            <option value="조선해양공학과" <c:if test="${row.department eq '조선해양공학과'}"><c:out value = "selected" /></c:if>>조선해양공학과</option>
            <option value="조선해양생산트랙" <c:if test="${row.department eq '조선해양생산트랙'}"><c:out value = "selected" /></c:if>>조선해양생산트랙</option>
            <option value="조선해양설계트랙" <c:if test="${row.department eq '조선해양설계트랙'}"><c:out value = "selected" /></c:if>>조선해양설계트랙</option>
            <option value="중국언어와문화학과" <c:if test="${row.department eq '중국언어문화학과'}"><c:out value = "selected" /></c:if>>중국언어와문화학과</option>
            <option value="지적학과" <c:if test="${row.department eq '지적학과'}"><c:out value = "selected" /></c:if>>지적학과</option>
            <option value="체육학과" <c:if test="${row.department eq '체육학과'}"><c:out value = "selected" /></c:if>>체육학과</option>
            <option value="친환경바이오융합학과" <c:if test="${row.department eq '친환경바이오융합학과'}"><c:out value = "selected" /></c:if>>친환경바이오융합학과</option>
            <option value="컴퓨터공학과" <c:if test="${row.department eq '컴퓨터공학과'}"><c:out value = "selected" /></c:if>>컴퓨터공학과</option>
            <option value="컴퓨터ㆍ정보보호학부" <c:if test="${row.department eq '컴퓨터ㆍ정보보호학부'}"><c:out value = "selected" /></c:if>>컴퓨터ㆍ정보보호학부</option>
            <option value="토목공학과" <c:if test="${row.department eq '토목공학과'}"><c:out value = "selected" /></c:if>>토목공학과</option>
            <option value="토목공학트랙" <c:if test="${row.department eq '토목공학트랙'}"><c:out value = "selected" /></c:if>>토목공학트랙</option>
            <option value="패션의류학과" <c:if test="${row.department eq '패션의류학과'}"><c:out value = "selected" /></c:if>>패션의류학과</option>
            <option value="한약자원트랙" <c:if test="${row.department eq '한약자원트랙'}"><c:out value = "selected" /></c:if>>한약자원트랙</option>
            <option value="한약자원학과" <c:if test="${row.department eq '한약자원학과'}"><c:out value = "selected" /></c:if>>한약자원학과</option>
            <option value="해양수산자원트랙" <c:if test="${row.department eq '해양수산자원트랙'}"><c:out value = "selected" /></c:if>>해양수산자원트랙</option>
            <option value="해양수산자원학과" <c:if test="${row.department eq '해양수산자원학과'}"><c:out value = "selected" /></c:if>>해양수산자원학과</option>
            <option value="해양시스템공학과" <c:if test="${row.department eq '해양시스템공학과'}"><c:out value = "selected" /></c:if>>해양시스템공학과</option>
            <option value="화학과" <c:if test="${row.department eq '화학과'}"><c:out value = "selected" /></c:if>>화학과</option>
            <option value="환경공학과" <c:if test="${row.department eq '환경공학과'}"><c:out value = "selected" /></c:if>>환경공학과</option>
        </select>
        <br><br>

           <input style="display: inline" type="text" name="team"
                  placeholder="팀명" value="${row.team}"
                  required>

           <input style="display: inline"  type="text" name="professor"
                  placeholder="지도 교수" value="${row.professor}"
                  required>
           <br><br>
           <input style="width: 500px" type="text" name="title" size="50"
                  placeholder="제목" value="${row.title}"
                  required>
           <br><br>

           <textarea name="comment">${row.comment}</textarea>

           <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
           <script>
               CKEDITOR.replace('comment');
           </script>
        <input type="submit" value="글 수정">
</form>
</div>
    <!-- 이쁘게 보이기 위한 공백 -->
    <div style="width: 100%; height: 100px;"></div>
</c:forEach>

<c:if test="${param.num == null}">
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

    <textarea name="comment"></textarea>

    <script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('comment');
    </script>


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

    <!-- 이쁘게 보이기 위한 공백 -->
    <div style="width: 100%; height: 100px;"></div>
</c:if>

</body>
</html>
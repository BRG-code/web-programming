<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title>회원 가입</title>
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

<!-- 회원 가입 부분 -->
<div style="margin-bottom: 15px" class="sub-title">
    <h2>회원 가입</h2>
</div>

<!-- 회원 가입 폼 영역 -->
<div class="write-area">
    <!-- 스타일 정의 -->
    <style>
        p {
            width: 30%;
            display: inline;
        }

        input {
            width: auto;
        }
    </style>

    <form style="padding-left: 20%; width: 50%" class="write-area" method="post" action="return_register_result.jsp">
        <!-- 이름 입력 영역 -->
        <p>이름 <span class="necessary">*</span> :</p>
        <input type="text" name="name" required><br>

        <!-- 아이디 입력 영역 -->
        <p>아이디 <span class="necessary">*</span> :</p>
        <input type="text" name="id" placeholder="5자 이상" pattern="[A-Za-z0-9]{5,}" required> <br>

        <!-- 비밀번호 입력 영역 -->
        <p>비밀번호 <span class="necessary">*</span> :</p>
        <input type="password" name="pw" placeholder="8자 이상" pattern="{8,}" required> <br>

        <!-- 비밀번호 확인 입력 영역 -->
        <p>비밀번호 확인 <span class="necessary">*</span> :</p>
        <input style="width: auto" type="password" name="re_pw" required> <br>

        <!-- 이메일 입력 영역 -->
        <p>이메일 <span class="necessary">*</span> :</p>
        <input style="width: auto" type="email" name="email" placeholder="example@*****.com" required><br>

        <!-- 주소 입력란 By Daum API-->
        <!-- 우편번호 입력 영역 -->
        <p>우편번호 <span class="necessary">*</span> : </p>
        <input style="width: 20%;" type="text" id="zipcode" name="zipcode" placeholder="우편번호" required disabled>
        <input style="width: 20%;" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>

        <!-- 주소 입력 영역
             자동으로 채워질 부분은 입력하지 못하도록 비활성화 -->
        <p>주소 <span class="necessary">*</span></p><br>
        <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" required>
        <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소">
        <span id="guide" style="color:#999; display:none"></span><br>
        <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"  required>
        <input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">

        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
            function execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 참고 항목 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraRoadAddr !== ''){
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('zipcode').value = data.zonecode;
                        document.getElementById("roadAddress").value = roadAddr;
                        document.getElementById("jibunAddress").value = data.jibunAddress;

                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if(roadAddr !== ''){
                            document.getElementById("extraAddress").value = extraRoadAddr;
                        } else {
                            document.getElementById("extraAddress").value = '';
                        }

                        var guideTextBox = document.getElementById("guide");

                        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                        if(data.autoRoadAddress) {
                            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                            guideTextBox.style.display = 'block';

                        } else if(data.autoJibunAddress) {
                            var expJibunAddr = data.autoJibunAddress;
                            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                            guideTextBox.style.display = 'block';
                        } else {
                            guideTextBox.innerHTML = '';
                            guideTextBox.style.display = 'none';
                        }
                    }
                }).open();
            }
        </script>
        <br><br>
        <input style="height: 30px; width: 15%" type="submit" value="회원가입">
        <a href="javascript:history.back(-1)"><button style="height: 30px; width: 15%" type="button" id="cancel" class="cancel">취소</button></a>
    </form>
</div>
</body>
</html>
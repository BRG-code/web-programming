<%@ page contentType="text/html; charset=UTF-8" %> <html>
<head><title>예약 정보</title></head>
<body> 
    <h2>예약 정보</h2>
    <form method="post" action="opatient.jsp">
        이름: <input type="text" name="name" required> <br><br> 
        연락처: <input type="tel" name="phone" required><br><br>
        예약 날짜: <input type="date" name="serve" required><br><br> 
        약 형태 선택<br><br>
        <input type="radio" name="drug" value="바르는 약">바르는 약
        <input type="radio" name="drug" value="먹는 약">먹는 약
        <input type="radio" name="drug" value="약을 먹지 않음" checked="checked">약을 먹지 않음
        <br><br>
        <input type="reset" value="초기화">
        <input type="submit" value="예약">
    </form> 
</body> 
</html>
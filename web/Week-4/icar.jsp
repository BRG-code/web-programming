<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head><title>자동차 정보</title></head>
    <body>
        <h2>자동차 정보</h2>
        <form method="post" action="ocar.jsp">
            자동차 색: <input type="color" name="carcolor"><br><br>
            사용 형태: 
                <input type="radio" name="use", value="buy" checked>구매
                <input type="radio" name="use", value="lease">리스
            <br><br>

            자동차 옵션: <br>
            <input type="checkbox" name="option", value="에어백">에어백<br>
            <input type="checkbox" name="option", value="네비게이션">네비게이션<br>
            <input type="checkbox" name="option", value="블랙박스">블랙박스<br>

            <br><br>
            <input type="reset" value="초기화">
            <input type="submit" value="자동차 등록">
        </form>
    </body>
</html>
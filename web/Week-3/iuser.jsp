<%@ page contentType="text/html; charset=UTF-8" %> <html>
<head><title>사용자 정보</title></head>
<body> 
    <h2>사용자 정보</h2>
    <form method="post" action="ouser.jsp">
        메일: <input type="email" name="mail" required> <br><br> 
        전화: <input type="tel" name="phone"><br><br>
        생일: <input type="date" name="birthday"> <br><br> 
        홈페이지: <input type="url" name="home"><br><br>
        <br><br>
        <input type="reset" value="초기화">
        <input type="submit" value="사용자 등록">
    </form> 
</body> 
</html>
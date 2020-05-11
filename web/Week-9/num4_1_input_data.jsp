<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <header><title>데이터 넣기</title></header>
<body>
    <h2>사용자 정보</h2>
    <form method="post" action="num4_2_output_data.jsp">
        메일: <input type="email" name="email"><br><br>
        전화: <input type="tel" name="tel"><br><br>
        생일: <input type="date" name="bday"><br><br>
        홈페이지: <input type="text" name="home"><br><br>
        <input type="submit" value="출력">
    </form>
</body>
</html>
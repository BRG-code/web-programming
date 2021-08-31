<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head><title>개발 환경 정보</title></head>
    <body>
        <h2>개발 환경 정보</h2>
        <form method="post" action="odevelop.jsp">
            현재 운영체제: <br>
            <select name="os">
                <option value="win">윈도우</option>
                <option value="linux">리눅스</option>
                <option value="mac">맥 OS</option>
                <option value="android">안드로이드</option>
            </select>
            <br><br>

            사용 언어: <br>
            <select name="lang" multiple size="3">
                <option value="C">C</option>
                <option value="Java">Java</option>
                <option value="Cpp">C++</option>
                <option value="JS">JavaScript</option>
            </select>
            <br><br>

            <input type="reset" value="초기화">
            <input type="submit" value="개발정보 등록"> 
        </form>
    </body>
</html>
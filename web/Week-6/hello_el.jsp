<%@ page contentType="text/html; charset=UTF-8" %>
    <html>
    <head><title>EL 테스트</title></head>
    <body>
        <h3 align="center">EL 테스트</h3>
        <p>수식 계산하기</p>
        <li>\${ 2 + 5 } = ${ 2 + 5 }</li>
        <li>\${ 2 / 5 } = ${ 2 / 5 }</li>
        <li>\${ 2 < 5 } = ${ 2 < 5 }</li>

        <p>헤더 정보 얻기</p>
        <li>웹 브라우저 : ${ header["user-agent"] }</li>
        <li>사용자 컴퓨터 : ${ header["host"] }</li>

        <p>request 정보 얻기</p>
        <li>웹 브라우저 : ${ header["user-agent"] }</li>
        <li>사용자 컴퓨터 : ${ header["host"] }</li>

        <p>파라메터 값 얻기</p>
        <li>name 파라메터: ${ param["name"] }</li>
        <li>name 파라메터 값이 공백? : ${ empty param["name"] }</li>

        <p>쿠키 값 얻기</p>
        <li>세션 ID: ${ cookie["JSESSIONID"].value }</li>
    </body>
    </html>
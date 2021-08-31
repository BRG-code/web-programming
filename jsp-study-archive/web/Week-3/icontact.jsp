<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head><title>연락처</title></head>
<body>
    <h2>연락처</h2>
    연락처를 입력해주세요.<br>
    <form method='post' action='ocontact.jsp'>
    이름    <input type='text'  name='cname' required><br>
    이메일  <input type='email' name='email'><br>
        <input type='reset' value='취소'>
        <input type='submit' value='전송'>
    </form>
</body>
</html>
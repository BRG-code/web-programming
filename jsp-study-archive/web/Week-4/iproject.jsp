<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head><title>프로젝트 정보</title></head>
    <body>
        <h2>프로젝트 정보</h2>
        <form method="post" action="oproject.jsp">
            프로젝트 제목<br>
            <input type="text" name="title" size="50" placeholder="제목을 구체적으로 기술해주세요" required><br><br>
            프로젝트 소개<br>
            <textarea name="project" rows="8" col="50" placeholder="프로젝트에 대한 자세한 정보를 입력해주세요"
            required></textarea><br><br>
            <input type="reset" value="초기화">
            <input type="submit" value="프로젝트 등록">

        </form>
    </body>
</html>

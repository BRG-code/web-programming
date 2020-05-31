<%--
  Created by IntelliJ IDEA.
  User: cocoblue
  Date: 2020/05/26
  Time: 3:50 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import = "com.oreily.servlet.*"%>
<%@ page import = "com.oreilly.servlet.multipart.*"%>
<html>
<head>
    <title>글쓰기</title>
</head>
<body>
<h2>프로젝트 정보</h2>
<form method="post" action="owrite.jsp" enctype="multipart/form-data">
    프로젝트 제목 <br>
    <input type="text" name="title" size="50"
           placeholder="제목을 입력해주세요."
           required>
    <br><br>
    프로젝트 소개 <br>
    <textarea name="project" rows="8" cols="50"
              placeholder="내용을 기술해주세요."
              required></textarea>
    <br><br>
    <table>
        <tr>
            <td>파일 이름:</td>
            <td><input type="file" name="file1"></td>
        </tr>
        <tr>
            <td>파일 이름:</td>
            <td><input type="file" name="file2"></td>
        </tr>
    </table>
    <input type="submit" value="글 등록">

</form>
</body>
</html>

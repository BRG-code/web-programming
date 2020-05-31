<%--
  Created by IntelliJ IDEA.
  User: cocoblue
  Date: 2020/05/26
  Time: 4:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <title>파일업로드</title>
</head>
<body>
<h3>파일업로드</h3>
<%
    String dir = application.getRealPath("/upload");
    int max = 5 * 1024 * 1024;
    try {
        MultipartRequest m = new MultipartRequest(request, dir, max,
                "UTF-8", new DefaultFileRenamePolicy());
        String subject = m.getParameter("title");
        String contents = m.getParameter("project");
        String file1 = m.getFilesystemName("file1");
        String ofile1 = m.getOriginalFileName("file1");
        String file2 = m.getFilesystemName("file2");
        String ofile2 = m.getOriginalFileName("file2");
%>
<p>제목 : <%= subject %>
<p>내용 : <%= contents %>
        <% if(file1 != null) { %>
<p> 업로드파일1 : <a href=/upload/<%=file1%>><%=ofile1%></a>
        <%  }
   if(file2 != null) { %>
<p>업로드 파일2 : <a href=/upload/<%= file2%>><%=ofile2%></a>
        <%  }
} catch(Exception e) {
   e.printStackTrace(new PrintWriter(out));
}
%>
</body>
</html>

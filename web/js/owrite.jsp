<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.io.PrintWriter"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.File" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <title>파일업로드</title>
</head>
<body>
<%
    String dir = application.getRealPath("/upload");
    int max = 5 * 1024 * 1024;
    try {
        MultipartRequest m = new MultipartRequest(request, dir, max,
                "UTF-8", new DefaultFileRenamePolicy());

        String title = m.getParameter("title");
        String contents = m.getParameter("contents");

        String file1 = m.getFilesystemName("file1");
        String ofile1 = m.getOriginalFileName("file1");
        String file2 = m.getFilesystemName("file2");
        String ofile2 = m.getOriginalFileName("file2");

        Connection con;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://35.225.0.199:3306/wppone";
        String id = "wp2p1";
        String pass = "wp2PTwo!";
        con = DriverManager.getConnection(url, id, pass);
        Calendar cal = Calendar.getInstance();
        int file_use = 0;
        String file_sql_1;
        String file_sql_2;
        if(file1 == null || file2 == null) {
            file_use = 1;

        }
        String sql = "insert into notice(title, id, uploadtime, view, file, comment) values (?, '1', now(), 0," + file_use+ ", ?)";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, title);
        st.setString(2, contents);
        st.executeUpdate();
        String no_sql="select no from notice WHERE title ='"+ title +"'";
        PreparedStatement st_no = con.prepareStatement(no_sql);
        ResultSet rs = st_no.executeQuery();
        int f_no=0;
        while(rs.next()){
             f_no = rs.getInt(1);
        }
        if (file1 != null && file2 != null){
            File f_size_1 = m.getFile("file1");
            long size_1 = f_size_1.length();
            File f_size_2 = m.getFile("file2");
            long size_2 = f_size_2.length();
            file_sql_1 = "insert into file(filename, size, link, board, article, upload) values(?, "+ size_1 +", ?, 1, "+ f_no +", now())";
            file_sql_2 = "insert into file(filename, size, link, board, article, upload) values(?, "+ size_2 +", ?, 1, "+ f_no +", now())";
            PreparedStatement ufile1 = con.prepareStatement(file_sql_1);
            ufile1.setString(1, ofile1);
            ufile1.setString(2, file1);
            ufile1.executeUpdate();
            ufile1.close();
            PreparedStatement ufile2 = con.prepareStatement(file_sql_2);
            ufile2.setString(1, ofile2);
            ufile2.setString(2,file2);
            ufile2.executeUpdate();
            ufile2.close();
        }else if(file1 != null){
            File f_size_1 = m.getFile("file1");
            long size_1 = f_size_1.length();
            file_sql_1 = "insert into file(filename, size, link, board, article, upload) values(?, "+ size_1 +", ?, 1,"+ f_no +", now())";
            PreparedStatement ufile1 = con.prepareStatement(file_sql_1);
            ufile1.setString(1, ofile1);
            ufile1.setString(2, file1);

            ufile1.executeUpdate();
            ufile1.close();
        }else if(file2 != null) {
            File f_size_2 = m.getFile("file2");
            long size_2 = f_size_2.length();
            file_sql_2 = "insert into file(filename, size, link, board, article, upload) values(?, "+size_2+", ?, 1, "+ f_no +", now())";
            PreparedStatement ufile2 = con.prepareStatement(file_sql_2);
            ufile2.setString(1, ofile2);
            ufile2.setString(2,file2);
            ufile2.executeUpdate();
            ufile2.close();
        }
        st.close();
        st_no.close();

        out.println("<script>\n" +
                "            alert(\"게시글이 업로드 되었습니다.\");\n" +
                "            location.href=\"notice.jsp\";\n" +
                "        </script>");

        } catch(Exception e) {
            out.println("<script>\n" +
                    "    alert(\"게시글 업로드 실패.\");\n" +
                    "    location.href=\"notice.jsp\";\n" +
                    "</script>");
            e.printStackTrace();
        }
%>
</body>
</html>

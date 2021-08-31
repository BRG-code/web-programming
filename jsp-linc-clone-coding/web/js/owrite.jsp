<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
    <title>파일업로드</title>
</head>
<body>
<%
    String dir = application.getRealPath("/upload");
    int max = 5 * 1024 * 1024; // 5MB 제한
    try {
        MultipartRequest m = new MultipartRequest(request, dir, max, "UTF-8", new DefaultFileRenamePolicy());
        String title = m.getParameter("title");
        String contents = m.getParameter("contents");
        // getFilesystemName: 서버에 올라간 파일명
        // OriginalFileName: 원본 파일명
        ArrayList<String> filelist = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            String file_para = "file" + (i + 1);
            filelist.add(m.getFilesystemName(file_para));
            filelist.add(m.getOriginalFileName(file_para));
        }
        // 첨부 파일이 있냐 없냐
        boolean file_use = false;
        // 파일은 array 2개에 1개 파일.
        for (int i = 0; i < filelist.size(); i += 2) {
            if (filelist.get(i) != null && filelist.get(i + 1) != null) {
                file_use = true;
            }
        }
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://35.225.0.199:3306/wppone";
        String id = "wp2p1";
        String pass = "wp2PTwo!";
        Connection con = DriverManager.getConnection(url, id, pass);
        // 첨부파일을 제외한 내용을 DB에 INSERT
        String sql = "insert into introduce(title, id, uploadtime, view, file, comment) values (?, ?, now(), 0, ?, ?)";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, title);
        st.setString(2, (String) session.getAttribute("loginedid"));
        st.setBoolean(3, file_use);
        st.setString(4, contents);
        st.executeUpdate();
        st.close();
        // 아까 올라간 글의 고유 번호를 받아옴.
        String num_query = "select no from introduce WHERE title = ? AND id = ?";
        PreparedStatement num_sql = con.prepareStatement(num_query);
        num_sql.setString(1, title);
        num_sql.setString(2, (String) session.getAttribute("loginedid"));
        // 쿼리를 실행해서 rs에 받아옴.
        ResultSet rs = num_sql.executeQuery();
        // 아까 글의 고유 번호를 f_no에 할당
        int f_no = 0;
        if (rs.next()) {
            f_no = rs.getInt(1);
        }
        // 실제 파일 업로드.
        // 파일은 array 2개에 1개 파일.
        for (int i = 0; i < filelist.size(); i += 2) {
            if (filelist.get(i) != null && filelist.get(i + 1) != null) {
                // 해당 경로에 있는 파일 사이즈를 받아오기 위한 변수
                String file_para = "file" + (i / 2 + 1);
                long size = m.getFile(file_para).length();
                // SQL 쿼리 구성
                String file_sql = "insert into file(filename, size, link, board, article, upload) values(?, ?, ?, ?, ?, now())";
                // 쿼리에 변수 값 할당
                PreparedStatement ps = con.prepareStatement(file_sql);
                ps.setString(1, filelist.get(i + 1));
                ps.setLong(2, size);
                ps.setString(3, filelist.get(i));
                ps.setInt(4, 22);
                ps.setInt(5, f_no);
                // 쿼리 실행
                ps.executeUpdate();
                // 닫기
                ps.close();
            }
        }
        con.close();
        out.println("    <script>\n" +
                "        alert(\"업로드가 완료되었습니다.\")\n" +
                "        location.href=\"../index.jsp\"\n" +
                "    </script>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("    <script>\n" +
                "        alert(\"서버 문제로 업로드에 실패하였습니다.\")\n" +
                "        location.href=\"javascript:history.back(-1)\"\n" +
                "    </script>");
    }
%>
</body>
</html>
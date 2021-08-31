<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>수정</title>
</head>
<body>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://35.225.0.199:3306/wppone";
        String id = "wp2p1";
        String pass = "wp2PTwo!";
        Connection con = DriverManager.getConnection(url, id, pass);

        System.out.println(session.getAttribute("num"));
        System.out.println(session.getAttribute("num").getClass().getName());
        int num = Integer.parseInt((String) session.getAttribute("num"));

        String department = request.getParameter("department");
        String team = request.getParameter("team");
        String professor = request.getParameter("professor");
        String title = request.getParameter("title");
        String comment = request.getParameter("comment");

        String sql = "update achieve set title = ?, department = ?, team = ?, professor = ?, comment = ? WHERE no = ?";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, title);
        st.setString(2, department);
        st.setString(3, team);
        st.setString(4, professor);
        st.setString(5, comment);
        st.setInt(6, num);
        st.executeUpdate();

        st.close();
        con.close();

        out.println("    <script>\n" +
                "        alert(\"수정이 완료되었습니다.\")\n" +
                "        location.href=\"achieve.jsp\"\n" +
                "    </script>");
    } catch(Exception e){
        e.printStackTrace();
        out.println("    <script>\n" +
                "        alert(\"서버 문제로 수정에 실패하였습니다.\")\n" +
                "        location.href=\"achieve.jsp\"\n" +
                "    </script>");
    }
%>
</body>
</html>

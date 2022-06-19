<%@ page import="com.zrl.dao.Dao" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/14
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加</title>
</head>
<body>
<%
    String m_name = request.getParameter("m_name");
    String s_name = request.getParameter("s_name");
    String a_name = request.getParameter("a_name");
    String m_style = request.getParameter("m_style");

    if (Dao.isExit("select * from music_info where m_name=? and s_name=? and a_name=?", new Object[]{m_name, s_name, a_name})) {
        response.getWriter().println("歌曲内容已存在！");
    } else {

        String sql = "insert into music_info (m_name,s_name,a_name,m_style) values(?,?,?,?)";

        Dao.insertUpdate(sql, new Object[]{m_name, s_name, a_name, m_style});
        response.sendRedirect("music.jsp");
    }

%>
<script>
    //window.location.href="music.jsp";
</script>
</body>
</html>

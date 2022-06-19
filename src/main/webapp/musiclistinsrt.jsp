<%@ page import="com.zrl.dao.Dao" %><%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/16
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    String l_id = request.getParameter("l_id");
    String m_id = request.getParameter("m_id");

	int l_cnt = Integer.parseInt(l_id);

    if (Dao.isExit("select * from list_musics where l_id=? and m_id=? ", new Object[]{l_id, m_id})) {
        response.getWriter().println("歌曲内容已存在！");
    } else {
    String sql = "insert into list_musics (l_id,m_id,l_track) values(?,?,?)";

    Dao.insertUpdate(sql, new Object[]{l_id, m_id,l_cnt+1});
    response.sendRedirect("list.jsp");

	}
%>

</body>
</html>

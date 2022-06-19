<%@ page import="com.zrl.dao.Dao" %><%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/18
  Time: 10:45
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
    System.out.println(l_id);
    System.out.println(m_id);
    Dao.insertUpdate("delete from list_musics where l_id = ? and m_id = ?",new Object[]{l_id,m_id});
    response.sendRedirect("list.jsp");
%>
</body>
</html>

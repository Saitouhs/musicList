<%@ page import="com.zrl.dao.Dao" %><%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/18
  Time: 8:57
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
  Dao.insertUpdate("delete from list_info where l_id = ?",new Object[]{l_id});
  Dao.insertUpdate("delete from list_musics where l_id = ?",new Object[]{l_id});
  System.out.println(l_id);
  response.sendRedirect("list.jsp");
%>
</body>
</html>

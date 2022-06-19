<%@ page import="com.zrl.dao.Dao" %>
<%@ page import="com.zrl.entity.Music" %><%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/16
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table>
    <thead>
    <tr></tr>
    </thead>
    <tbody>
    <%
        Music[] music = Dao.getMusic();
        for (Music value : music)
			out.println(value);
    %>
    </tbody>
</table>
</body>
</html>

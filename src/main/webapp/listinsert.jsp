<%@ page import="com.zrl.dao.Dao" %><%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/16
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    String l_name = request.getParameter("l_name");
    String l_date = request.getParameter("l_date");
	String u_name = request.getParameter("u_name");
    System.out.println(u_name);

    if (Dao.isExit("select * from list_info where l_name = ?", new Object[]{l_name})) {

        request.setAttribute("error","歌单名重复");

        request.getRequestDispatcher("listadd.jsp").forward(request,response);

    } else {

        String sql = "insert into list_info (l_name,l_date,u_name) values(?,?,?)";

        Dao.insertUpdate(sql, new Object[]{l_name, l_date,u_name});
        response.sendRedirect("musiclistadd.jsp");
    }

%>
</body>
</html>

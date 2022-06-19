<%@ page import="com.zrl.dao.Dao" %>
<%@ page import="com.zrl.entity.Music" %>

<%@ page import="com.zrl.entity.List_info" %><%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/16
  Time: 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        input,
        select {
            width: 50%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            width: 50%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #1167b8;
        }

        input[type=button]:hover {
            background-color: #4553a0;
        }

        div {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
        }
    </style>
</head>
<body>


<form onsubmit="" action="musiclistinsrt.jsp">
    歌曲名
    <select name="m_id" id="m_id">
        <%
            Music music[] = Dao.getMusic();
            for (int i = 0; i < Dao.getMusicCnt(); i++) {%>
        <option value=" <% out.print(music[i].getId()) ; %> "><%
            out.println(music[i].getM_name());

        %></option>
        <%}%>
    </select><br>
    歌单名
    <select name="l_id" id="l_id"><%
        List_info list[] = Dao.getListinfo();
        for (int i = 0; i < Dao.getListCnt(); i++) {%>
        <option value="<%out.print(list[i].getL_id()) ;%>"><%
            out.println(list[i].getList_name());

        %></option>
        <%}%>
    </select><br>
    <input type="submit" value="添加">
</form>
</body>
</html>

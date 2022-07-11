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
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
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


<zrl id="zrl" style="color: red;">
    <%
        Object error = request.getAttribute("zrlerror");
        if (error != null)
            out.println(error);
    %>

</zrl>
<form onsubmit="" action="musiclistact">
    <input type="hidden" id="opr" name="opr" value="insert">
    歌曲名
    <select name="m_id" id="m_id">
       <%-- <%
            Music music[] = Dao.getDao().getMusic();
            for (int i = 0; i < Dao.getDao().getMusicCnt(); i++) {%>
        <option value=" <% out.print(music[i].getId()) ; %> "><%
            out.println(music[i].getM_name());

        %></option>
        <%}%>--%>
    </select><br>
    歌单名
    <select name="l_id" id="l_id">
        <%--<%
        List_info list[] = Dao.getDao().getListinfo("");
        for (int i = 0; i < Dao.getDao().getListCnt(); i++) {%>
        <option value="<%out.print(list[i].getL_id()) ;%>"><%
            out.println(list[i].getList_name());

        %></option>
        <%}%>--%>
    </select><br>
    <input type="submit" value="添加">
</form>
</body>
<script>
    $.get("musiclistact", {opr:"checkmusic"},function (zhp) {
        var s = "";
        for (var i = 0; i < zhp.length; i++) {
            s = s + "<option value='" + zhp[i].id + "'>" + zhp[i].m_name + "</option>";
        }
        $("#m_id").html(s);
    });

    $.get("musiclistact", {opr:"checklist"},function (req) {
        var s = "";
        for (var i = 0; i < req.length; i++) {
            s = s + "<option value='" + req[i].l_id + "'>" + req[i].l_name + "</option>";
        }
        $("#l_id").html(s);
    });
</script>
</html>

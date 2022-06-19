<%@ page import="com.zrl.dao.Dao" %>
<%@ page import="com.zrl.entity.List_info" %>
<%@ page import="com.zrl.entity.Music" %>
<%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/14
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<a href="musicadd.jsp" style="text-decoration:none; color:#0410c5">用户</a>
<a href="listadd.jsp" style="text-decoration:none; color:#0410c5">歌单</a>
<a href="musiclistadd.jsp" style="text-decoration:none; color:#0410c5">曲库</a>

<form action="list.jsp">
    <input type="text" name="l_name" id="l_name" placeholder="查询歌单">
    <input type="submit" name="sub" id="sub" value="查询">
</form>
<table>
    <tr>
        <th>歌单号</th>
        <th>歌单名</th>
        <th>创建日期</th>
    </tr>
    <%
        String l_name = request.getParameter("l_name");
        if (l_name == null)
            l_name = "";
        System.out.println(l_name);
        List_info[] ml = Dao.getListinfo(l_name);
        if (ml!=null) {
            for (List_info list_info : ml) {
                out.print("<td><a href=>" + list_info.getList_name() + "</td>");
                out.print("<td><a href='listdel.jsp?l_id=" + list_info.getL_id() + "' onclick='return confirm(\"确定要删除[" + list_info.getL_id() + "]吗？\")'> 删除</a></td>");
                out.print("<td><a href='listedt.jsp?l_id=" + list_info.getL_id() + "&l_name=" + list_info.getList_name() +
                        "' onclick='return confirm(\"要修改[" + list_info.getL_id() + "]吗？\")'> 修改</a></td>");
                out.print("</tr>");
            }//输出列表

    %>
</table>
<%
    Music[] lis;
    int cnt = ml.length;
    int a[] = Dao.getMusicListNum();
    for (int i = 0; i < cnt; i++) {
%>


<div>
    <%
        out.print(ml[i].getList_name() + "<br>");
    %>
    <table>
        <tr>
            <th>曲名</th>
            <th>歌手</th>
            <th>专辑</th>
            <th>时长</th>
            <th>流派</th>
        </tr>
        <%
            if (Dao.getMusicListcnt(a[i]) != 0) {
                lis = Dao.getMusic(a[i]);
                for (Music li : lis) {
                    out.print(li);
                    System.out.println(ml[i].getL_id() + "\t" + li.getId());
                    out.print("<td><a href='listmusicdel.jsp?l_id=" + ml[i].getL_id() + "&m_id=" + li.getId() + "' onclick='return confirm(\"确定要删除[" + ml[i].getL_id() + "中的" + li.getId() + "]吗？\")'> 删除</a></td>");
                    out.print("<td><a href='listmusicedt.jsp?l_id=" + ml[i].getL_id() + "&m_id=" + li.getId() + "' onclick='return confirm(\"要修改[" + ml[i].getL_id() + "中的" + li.getId() + "]\")'> 修改</a></td>");
                    out.print("</tr>");
                }
            }
        %></table>
</div>
<%
        }
    }%>


<a href="musicadd.jsp" style="text-decoration:none; color:#0410c5">添加歌曲</a>
<a href="listadd.jsp" style="text-decoration:none; color:#0410c5">新建歌单</a>
<a href="musiclistadd.jsp" style="text-decoration:none; color:#0410c5">向歌单添加歌曲</a>

</body>
</html>

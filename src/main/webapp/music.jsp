<%@ page import="com.zrl.entity.Music" %>
<%@ page import="com.zrl.dao.Dao" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/19
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>曲目</title>
</head>
<body>

<a href="user.jsp" style="text-decoration:none; color:#0410c5">用户</a>
<a href="list.jsp" style="text-decoration:none; color:#0410c5">歌单</a>
<a href="music.jsp" style="text-decoration:none; color:#0410c5">曲库</a>

<form action="music.jsp">
    <input type="text" name="m_name" id="m_name" placeholder="查询歌曲">
    <input type="submit" name="sub" id="sub" value="查询">
</form>
<table>
    <tr>
        <th>曲名</th>
        <th>歌手</th>
        <th>专辑</th>
        <th>时长</th>
        <th>流派</th>
    </tr>

    <%
        String m_name =  request.getParameter("m_name");
        if (m_name==null)
            m_name="";
        String sql="select * from `music_info` where m_name like \'%"+m_name+"%\'";
        ArrayList<Map<String,Object>> lst = Dao.getDao().getAny(sql);
        for (Map<String,Object> m:lst){
            out.print("<tr id ='"+m.get("m_id")+"'>");
            out.print("<td>"+m.get("m_name")+"</td>");
            out.print("<td>"+m.get("s_name")+"</td>");
            out.print("<td>"+m.get("a_name")+"</td>");
            out.print("<td>"+m.get("m_time")+"</td>");
            out.print("<td>"+m.get("m_style")+"</td>");
            System.out.println( m.get("m_id"));
            out.print("<td><a href='musicact?opr=delete&m_id="+ m.get("m_id")+"' onclick='return confirm(\"确定要删除["+m.get("m_name")+"]吗？\")'> 删除</a></td>");
            out.print("<td><a href='musicmodify.jsp?m_id="+ m.get("m_id")+"&m_name="+m.get("m_name")+"&s_name="+m.get("s_name")+
                    "&a_name="+m.get("a_name")+"&m_style="+m.get("m_style")+"' onclick='return confirm(\"修改["+m.get("u_name")+"]\")'> 修改</a></td>");
            out.print("</tr>");
        }
    %>

</table>

<a href="musicadd.jsp" style="text-decoration:none; color:#0410c5">添加歌曲</a>


</body>
</html>

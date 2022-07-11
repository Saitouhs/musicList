<%@ page import="com.zrl.entity.Music" %>
<%@ page import="com.zrl.dao.Dao" %>
<%@ page import="com.zrl.entity.List_info" %><%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/20
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<form onsubmit="" action="musiclistact">
  <input type="hidden" name="opr" id="opr" value="update">
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
    List_info list[] = Dao.getListinfo("");
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

<%@ page import="java.util.Map" %>
<%@ page import="com.zrl.dao.Dao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.zrl.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/19
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<a href="user.jsp" style="text-decoration:none; color:#0410c5">用户</a>
<a href="list.jsp" style="text-decoration:none; color:#0410c5">歌单</a>
<a href="music.jsp" style="text-decoration:none; color:#0410c5">曲库</a>
<form action="${pageContext.servletContext.contextPath}/useract">
    <input type="text" name="u_name" id="u_name" placeholder="查询用户名">
    <input type="submit" name="sub" id="sub" value="查询">
</form>
<table>
    <tr id="user">
        <td>username</td>
        <td>password</td>
    </tr>


    <c:forEach items="${sessionScope.tes}" var="e">
        <tr id="${e.u_id}">
            <td>${e.u_id}</td><td>${e.u_name}</td>
            <td><a href="useract?opr=delete&u_id=${e.u_id}" onclick="return confirm('确定要删除[${e.u_name}${e.u_id}]吗？')"> 删除</a></td>
            <td><a href="usermodify.jsp?u_id=${e.u_id}&u_name=${e.u_name}&u_pass=${e.u_pass}" onclick="return confirm('修改[${e.u_name}]')"> 修改</a></td>
        </tr>
    </c:forEach>

</table>
<a href="userRes.jsp" style="text-decoration:none; color:#0410c5">添加账号</a>
</body>
</html>

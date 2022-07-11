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
<html>
<head>
    <title>Title</title>

    <!-- 包含头部信息用于适应不同设备 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 包含 bootstrap 样式表 -->
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
</head>


<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <nav class="navbar navbar-default navbar-static-top" role="navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-1"><span
                                    class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                                    class="icon-bar"></span><span class="icon-bar"></span></button>
                            <a class="navbar-brand" href="#">云音乐</a>
                        </div>

                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="active">
                                    <a href="home.jsp">歌单</a>
                                </li>
                                <li>
                                    <a href="musicnew.jsp">曲库</a>
                                </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="#">Link</a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong
                                            class="caret"></strong></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="#">我的主页</a>
                                        </li>
                                        <li>
                                            <a href="#">消息中心</a>
                                        </li>
                                        <li>
                                            <a href="#">个人设置</a>
                                        </li>
                                        <li class="divider">
                                        </li>
                                        <li>
                                            <a href="#">退出登录</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>

                            <form class="navbar-form navbar-left" role="search" action="usernew.jsp">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="l_name" id="l_name"
                                           placeholder="查询用户"/>
                                </div>
                                <button type="submit" class="btn btn-default" name="sub" id="sub">查询</button>
                            </form>
                        </div>

                    </nav>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table>
                        <tr id="user">
                            <td>username</td>
                            <td>password</td>
                        </tr>
                        <%
                            String u_name =  request.getParameter("u_name");
                            if (u_name==null)
                                u_name="";
                            String sql="select * from user_info where u_name like \'%"+u_name+"%\'";
                            ArrayList<User> lst = Dao.getDao().getUser(sql);
                            for (User m:lst){
                                out.print("<tr id ='"+m.getU_id()+"'>");
                                out.print("<td>"+m.getU_name()+"</td>");
                                out.print("<td>"+m.getU_pass()+"</td>");
                                out.print("<td><a href='useract?opr=delete&u_id="+ m.getU_id()+"' onclick='return confirm(\"确定要删除["+m.getU_name()+"\t"+m.getU_id()+"]吗？\")'> 删除</a></td>");
                                out.print("<td><a href='usermodify.jsp?u_id="+ m.getU_id()+"&u_name="+m.getU_name()+
                                        "&u_pass="+m.getU_pass()+"' onclick='return confirm(\"修改["+m.getU_name()+"]\")'> 修改</a></td>");
                                out.print("</tr>");
                            }
                        %>
                    </table>
                    <a href="userRes.jsp" style="text-decoration:none; color:#0410c5">添加账号</a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- JavaScript 放置在文档最后面可以使页面加载速度更快 -->
<!-- 可选: 包含 jQuery 库 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 可选: 合并了 Bootstrap JavaScript 插件 -->
<script src="https://apps.bdimg.com/libs/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>

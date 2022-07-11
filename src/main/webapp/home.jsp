<%@ page import="com.zrl.entity.List_info" %>
<%@ page import="com.zrl.dao.Dao" %>
<%@ page import="com.zrl.entity.Music" %><%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/23
  Time: 15:06
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
                                            <a href="usernew.jsp">我的主页</a>
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

                            <form class="navbar-form navbar-left" role="search" action="home.jsp">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="l_name" id="l_name"
                                           placeholder="查询歌单"/>
                                </div>
                                <button type="submit" class="btn btn-default" name="sub" id="sub">查询</button>
                            </form>
                        </div>

                    </nav>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <ol>
                        <%
                            String l_name = request.getParameter("l_name");
                            String l_id = request.getParameter("l_id");
                            if (l_name == null) {
                                l_name = "";
                            }
                            if (l_id == null) {
                                l_id = "";
                            }
                            List_info[] ml;
                            if (!l_id.equals(""))
                                ml = Dao.getDao().getListinfo("");
                            else ml = Dao.getDao().getListinfo(l_name);
                            if (ml != null) {
                                for (List_info list_info : ml) {
                                    out.print("<li><a href='home.jsp?l_id=" + list_info.getL_id() + " '>" + list_info.getList_name() + "</li>");
                                    //out.print("<td><a href='listact?opr=delete&l_id=" + list_info.getL_id() + "' onclick='return confirm(\"确定要删除[" + list_info.getList_name() + "]吗？\")'> 删除</a></td>");
                                    // out.print("<td><a href='listmodify.jsp?l_id=" + list_info.getL_id() + "&l_name=" + list_info.getList_name() +
                                    //        "' onclick='return confirm(\"要修改[" + list_info.getL_id() + "]吗？\")'> 修改</a></td>");
                                    // out.print("</tr>");
                                }//输出列表

                        %>
                    </ol>
                </div>
                <div class="col-md-6 column">
                    <table class="table">
                        <tbody>
                        <tr>
                            <th>曲名</th>
                            <th>歌手</th>
                            <th>专辑</th>
                            <th>时长</th>
                            <th>流派</th>
                        </tr>
                        <%
                                Music[] lis;
                                if (l_id!=""){
                                    lis = Dao.getDao().getMusic(Integer.valueOf(l_id));
                                    for (Music li : lis) {
                                        out.print("<tr id ='" + li.getId() + "'>");
                                        out.print("<td>" + li.getM_name() + "</td>");
                                        out.print("<td>" + li.getS_name() + "</td>");
                                        out.print("<td>" + li.getA_name() + "</td>");
                                        out.print("<td>" + li.getM_time() + "</td>");
                                        out.print("<td>" + li.getM_style() + "</td>");
                                        System.out.println(l_id + "\t" + li.getId());
                                        out.print("<td><a href='musiclistact?opr=delete&l_id=" +l_id + "&m_id=" + li.getId() + "' onclick='return confirm(\"确定要删除[" + l_id + "中的" + li.getId() + "]吗？\")'> 删除</a></td>");
                                        //out.print("<td><a href='musiclistmodify.jsp?l_id=" + ml[i].getL_id() + "&m_id=" + li.getId() + "' onclick='return confirm(\"要修改[" + ml[i].getL_id() + "中的" + li.getId() + "]吗？\")'> 修改</a></td>");
                                        out.print("</tr>");
                                    }
                                }
                            }
                        %>


                        </tbody>
                    </table>
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

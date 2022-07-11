<%@ page import="com.zrl.dao.Dao" %>
<%@ page import="javax.jws.soap.SOAPBinding" %>
<%@ page import="com.zrl.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/18
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="cldmsc.ico">
    <title>Usermodify</title>

    <script src="zrl.js"></script>

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
<form id="form" action="useract" onsubmit="return (cpr()&&zrl(this))">
    <input type="hidden" id="opr" name="opr" value="update">
    <input type="hidden" id="u_id" name="u_id" value="<%=request.getParameter("u_id")%>">

    用 户 名:
    <input type="text" name="u_name" id="u_name" placeholder="用户名" onkeyup="usrn(u_name.value)"
           value="<%=request.getParameter("u_name")==null?"":request.getParameter("u_name")%>"><span id="usrn"
                                                                                                     style="color: red;"></span><br>
    <br>设置密码:
    <input type="password" name="u_pass" id="u_pass" placeholder="请输入密码" onkeyup="zps(u_pass.value)"
           value="<%=request.getParameter("u_pass")==null?"":request.getParameter("u_pass")%>"><span id="zpss"
                                                                                                     style="color: red;"></span>
    <br> 确认密码:
    <input type="password" name="c_pass" id="c_pass" placeholder="请再次输入密码"
           onkeyup="cps(u_pass.value,c_pass.value)"><span id="cpss" style="color: red;"></span>

    </select><br>
    <input type="submit" value="修改"></form>

</body>

<script>

    function check() {
        var u_name = document.getElementById("u_name").value;
        var u_pass = $("#u_pass").value;
        var c_pass = $("#c_pass").value;
        var allow = false;


        allow = u_pass != "" && u_name != "" && c_pass != "" && u_pass == c_pass ;

        $.ajax(
            {
                url: "useract", data: {opr: "check", u_name: u_name},async:false, success: function (ret) {
                    if (ret.indexOf("exist") > -1) {
                        $("#zrl").html("不可用");
                        allow= false;
                    } else {
                        $("#zrl").html("可用");
                        this.allow = true;
                    }
                }
            }
        );
        if(!allow)
            return false;
    }
    function usrn(name) {
        x = document.getElementById("usrn");

        if (name == "")
            x.innerHTML = "用户名不得为空";
        else if (name.length > 10)
            x.innerHTML = "用户名长度不能超过10个字符";
        else if (!isLetChi(name))
            x.innerHTML = "用户名只能由汉字和字母组成";
        else
            x.innerHTML = "";

    }

    function zps(pass) {
        x = document.getElementById("cpss");
        y = document.getElementById("zpss");
        if (pass.length < 6)
            y.innerHTML = "密码长度过短";
        else
            y.innerHTML = "";
        x.innerHTML = "两次输入不一致";
    }

    function cps(pass, cpass) {
        x = document.getElementById("cpss");
        if (pass != cpass)
            x.innerHTML = "两次输入不一致";
        else
            x.innerHTML = "";
    }


</script>
</html>

<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="cldmsc.ico">
    <title>UserRes</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
        <script src="fun.js"></script>

    <script>
    </script>


</head>

<body>
<zrl id="zrl" style="color: red;">
    <%/*
        Object error = request.getAttribute("zrlerror");
        if (error != null)
            out.println(error);*/

    %> ${requestScope.zrlerror}

</zrl>
<form id="form" action="${pageContext.servletContext.contextPath}/useract" onsubmit="return  check() ">
    <input type="hidden" id="opr" name="opr" value="insert">
    用 户 名:
    <input type="text" name="u_name" id="u_name" placeholder="用户名" onkeyup="usrn(u_name.value)"
           value="${param.u_name}"><span id="usrn" style="color: red;"></span>
    <br>设置密码:
    <input type="password" name="u_pass" id="u_pass" placeholder="请输入密码" onkeyup="zps(u_pass.value)"
           value="${param.u_pass}"><span id="zpss"  style="color: red;"></span>
    <br> 确认密码:
    <input type="password" name="c_pass" id="c_pass" placeholder="请再次输入密码" onkeyup="cps(u_pass.value,c_pass.value)"><span id="cpss" style="color: red;"></span>

    </select><br>
    <input type="submit" value="注册">
    <input type="button" value="已有账号" onclick="window.open('userLogin.jsp')" )><br>
    <a href="userLogin.jsp" style="text-decoration:none; color:#0410c5">已有账号?</a>
</form>
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
                        $("#com.zrl").html("不可用");
                        allow= false;
                    } else {
                        $("#com.zrl").html("可用");
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
<script>
</script>

</html>
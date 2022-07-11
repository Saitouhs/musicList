<%@ page import="com.zrl.dao.Dao" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="cldmsc.ico">
    <link rel="stylesheet" href="form.css" type="text/css" media="all">
    <title>用户登录</title>
    <style>

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
<form action="useract" onsubmit="">
    <input type="hidden" name="opr" id="opr" value="login">
    username: <br>
    <input type="text" name="u_name" id="u_name" placeholder="input username"><br>
    password: <br>
    <input type="password" name="u_pass" id="u_pass" placeholder="inpur password"><br>
    <input type="submit" value="login">
    <input type="button" value="no accont?" onclick="window.open('userRes.jsp')" )><br>

</form>




</body>
<script>
</script>

</html>
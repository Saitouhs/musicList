<%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/21
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>

<form action="">
    <select name="id" id="id">

    </select>

</form>

</body>
<script>/*
        $.ajax(
            {
                url:"testact",
                success:
            }

        );*/
$.get("testact", {u_id: 1}, function (zhp) {
    var s = "";
    for (var i = 0; i < zhp.length; i++) {
        s = s + "<option value='" + zhp[i].id + "'>" + zhp[i].name + "</option>";
    }
    $("#id").html(s);
})

</script>
</html>

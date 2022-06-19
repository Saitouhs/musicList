<%--
  Created by IntelliJ IDEA.
  User: Saito
  Date: 2022/6/16
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="fun.js"></script>
<html>
<head>
    <title>Title</title>
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
    <script>

        function namecheck(frm){
            var name = frm.l_name.value;
            x = document.getElementById("usrn");
            if (name.length < 1)
                x.innerHTML = "不能为空";
            else if (name.length > 10)
                x.innerHTML = "长度不能超过10个字符";
            else if (!isLetChi(name))
                x.innerHTML = "用户名只能由汉字和字母组成";
            else
                x.innerHTML = "";
            if (name === "" || name.length > 30 || !isLetChi(name)) {

                return false;

            }   
            
        }
    </script>
</head>

<body>

<form onsubmit="namecheck(this)" action="listinsert.jsp?">
    歌单名
    <input type="text" id="l_name" name="l_name"><span  id="lname" style="color: red"></span><br>
    创建用户
    <input type="text" id="u_name" name="u_name"><span  id="uname" style="color: red"></span><br>
    创建日期
    <input type="date" id="l_date" name="l_date"><br>
    <input type="submit" value="新建" >
</form>

</body>
</html>

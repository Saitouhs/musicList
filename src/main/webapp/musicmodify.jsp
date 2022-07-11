<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>music</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">

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

<zrl id="zrl" style="color: red;"></zrl>
<form id="form" action="musicact" onsubmit="" method="post">
    <input type="hidden" name="opr" id="opr" value="update">
    <input type="hidden" name="m_id" id="m_id"   value="<%=request.getParameter("m_id")==null?"":request.getParameter("m_id")%>">
    曲名:
    <input type="text" name="m_name" id="m_name"  value="<%=request.getParameter("m_name")==null?"":request.getParameter("m_name")%>"><br>
    歌手:
    <input type="text" name="s_name" id="s_name"  value="<%=request.getParameter("s_name")==null?"":request.getParameter("s_name")%>"><br>
    专辑:
    <input type="text" name="a_name" id="a_name" value="<%=request.getParameter("a_name")==null?"":request.getParameter("a_name")%>"> <br>
    风格:
    <input type="text" name="m_style" id="m_style"  value="<%=request.getParameter("m_style")==null?"":request.getParameter("m_style")%>">
    <br>
    <input type="submit" value="修改">
</form>
</body>
</html>
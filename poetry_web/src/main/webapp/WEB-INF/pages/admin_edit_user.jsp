<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/15/015
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>修改用户信息</title>
    <style type="text/css">
        label{
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="jumbotron">
        <h1 class="text-center">修改用户</h1>
    </div>
    <form class="form-horizontal" action="/admin/editUser/${user.id}" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">账户</label>
            <div class="col-sm-12">
                <input type="text" name="account" class="form-control" id="firstname" value="${user.account}">
            </div>
        </div>
        <div class="form-group">
            <label for="account" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-12">
                <input type="text" name="username" class="form-control" id="account" value="${user.username}">
            </div>
        </div>
        <div class="form-group">
            <label for="a" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-12">
                <input type="text" name="password" class="form-control" id="a" value="${user.password}">
            </div>
        </div>
        <div class="form-group">
            <label for="b" class="col-sm-2 control-label">总场数</label>
            <div class="col-sm-12">
                <input type="text" name="totalNumber" class="form-control" id="b" value="${user.totalNumber}">
            </div>
        </div>
        <div class="form-group">
            <label for="c" class="col-sm-2 control-label">胜场数</label>
            <div class="col-sm-12">
                <input type="text" name="winNumber" class="form-control" id="c" value="${user.winNumber}">
            </div>
        </div>
        <div class="form-group">
            <label for="d" class="col-sm-2 control-label">头像路径</label>
            <div class="col-sm-12">
                <input type="text" name="image" class="form-control" id="d" value="${user.image}">
            </div>
        </div>
        <div class="form-group">
            <label for="e" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-12">
                <input type="text" name="email" class="form-control" id="e" value="${user.email}">
            </div>
        </div>
        <div class="form-group text-center">
            <div class="col-12 text-center">
                <button type="submit" class="btn btn-primary btn-lg">修改</button>
            </div>
        </div>
    </form>
    <div style="height: 50px">
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        $(":input").attr("required","required");
    })
</script>
</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/23/023
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>反馈管理</title>
    <style type="text/css">
        .dropdown-menu li:hover{
            background: #cccccc;
        }
        ul.pagination {
            display: inline-block;
            padding: 0;
            margin: 0;
        }

        ul.pagination li {display: inline;}

        ul.pagination li a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
        }

        ul.pagination li a.active {
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
        }

        ul.pagination li a:hover:not(.active) {background-color: #ddd;}

        div.center {text-align: center;}
    </style>
</head>
<body>
<div class="container col-10">
    <div class="jumbotron">
        <div class="offset-8" style="font-size: 20px">
            <ul class="nav nav-pills">
                <li class="nav-item">
                    <ul class="dropdown-menu text-center" style="font-size:20px">
                    </ul>
                </li>
            </ul>
        </div>
        <h1 class="display-3 text-center">反馈管理</h1>
        <h5><a href="/enjoy/index">回到主页</a></h5>
        <h5><a href="/admin/poetryAdd/addPage">现在添加</a></h5>
    </div>
    <h3>需要添加的诗词</h3>
    <table class="table table-bordered col-10 text-center">
        <thead>
        <tr>
            <th>id</th>
            <th>诗词名</th>
            <th>作者</th>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="poetryAdd" items="${pageInfo.list}">
            <tr>
                <th>${poetryAdd.id}</th>
                <th>${poetryAdd.title}</th>
                <th>${poetryAdd.author}</th>
                <th><a href="/admin/poetryAdd/remove/${poetryAdd.id}">删除</a></th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="center">
        <ul class="pagination">

            <c:if test="${pageInfo.pageNum==1}">
                <li><a style="pointer-events: none;cursor:default;" href="/admin/poetryAdd/1">首页</a></li>            </c:if>
            <c:if test="${pageInfo.pageNum!=1}">
                <li><a href="/admin/poetryAdd/1">首页</a></li>            </c:if>
            <c:if test="${pageInfo.pageNum==1}">
                <li><a style="pointer-events: none;cursor:default;" href="/admin/poetryAdd/${pageInfo.prePage}">前一页</a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=1}">
                <li><a href="/admin/poetryAdd/${pageInfo.prePage}">前一页</a></li>
            </c:if>
            <li><a href="#">当前页${pageInfo.pageNum}</a></li>
            <li><a href="#">共${pageInfo.pages}页</a></li>
            <c:if test="${pageInfo.pageNum==pageInfo.pages}">
                <li><a style="pointer-events:none;cursor:default;" href="/admin/poetryAdd/${pageInfo.nextPage}">下一页</a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                <li><a  href="/admin/poetryAdd/${pageInfo.nextPage}">下一页</a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum==pageInfo.pages}">
                <li><a style="pointer-events:none;cursor:default;" href="/admin/poetryAdd/${pageInfo.pages}">尾页</a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                <li><a href="/admin/poetryAdd/${pageInfo.pages}">尾页</a></li>
            </c:if>

        </ul>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript">
    $(function () {
        $("[data-toggle='popover']").popover();
    });
</script>
</body>
</html>

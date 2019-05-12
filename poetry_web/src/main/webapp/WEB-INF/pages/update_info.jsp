<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/13/013
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>信息修改</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/animate2.css">
    <link rel="stylesheet" href="/css/style2.css">

    <!-- Modernizr JS -->
    <script src="/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

</head>
<body class="style-3">

<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <!-- Start Sign In Form -->
            <form action="/update/${user.id}" class="fh5co-form animate-box" data-animate-effect="fadeInRight" method="post">
                <h2>个人信息修改</h2>
                <c:if test="${errors!=null||error!=null}">
                    <p style="font-size: 20px;color: #dd356e">错误提示:</p>
                </c:if>
                <c:if test="${error!=null}">
                    <p style="font-size: 20px;color: #dd356e">${error}</p>
                </c:if>
                <c:forEach var="error" items="${errors}">
                    <p style="font-size: 17px;color: #dd356e">${error.defaultMessage}</p>
                </c:forEach>
                <div class="form-group">
                    <div class="alert alert-success" role="alert">请填写需要修改项</div>
                </div>
                <div class="form-group">
                    <label for="account"  style="color: #000000;">账户</label>
                    <input type="text" class="form-control" readonly="readonly" name="account" id="account" value="${user.account}" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="name"  style="color: #000000;">昵称</label>
                    <input type="text" class="form-control" name="username" id="name" value="${user.username}" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="email"  style="color: #000000;">邮箱</label>
                    <input type="email" name="email" class="form-control" id="email" value="${user.email}" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password"  style="color: #000000;">密码(如果要修改密码请在此填写新密码)</label>
                    <input type="password" name="password" class="form-control" id="password" value="${user.password}" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="re-password" style="color: #000000;">新密码(如果要修改密码请在此再次填写新密码)</label>
                    <input type="password" name="passwordAgain" class="form-control" id="re-password"  value="${user.password}"  autocomplete="off">
                </div>
                <div class="form-group" style="text-align:center;">
                    <input type="submit" value="点击修改" class="btn btn-primary">
                </div>
            </form>
            <!-- END Sign In Form -->
        </div>
    </div>
    <div class="row" style="padding-top: 80px; clear: both;">
        <div class="col-md-12 text-center" style="font-size: 25px;"><p><small>&copy; All Rights Reserved.</small></p></div>
    </div>
</div>

<!-- jQuery -->
<script src="/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/js/bootstrap.min.js"></script>
<!-- Placeholder -->
<script src="/js/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="/js/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="/js/main2.js"></script>

</body>
</html>



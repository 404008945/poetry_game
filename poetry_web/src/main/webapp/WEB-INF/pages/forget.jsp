<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/9/009
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>忘记密码</title>
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
<body class="style-2">

<div class="container">
    <div class="row">
        <div class="col-md-6">


            <!-- Start Sign In Form -->
            <form action="/forget" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" method="post">
                <h2>忘记密码</h2>
                <div class="form-group">
                    <div class="alert alert-success" role="alert">我们将发送验证信息到你的邮箱，请注意查收</div>
                </div>
                <div class="form-group">
                    <label for="email" class="sr-only">电子邮箱</label>
                    <input type="email" required="required" type="email" name="email" class="form-control" id="email" placeholder="请填写你的电子邮箱" autocomplete="off">
                    <p id="text" style="color: #dd356e;font-size: 20px">${error}</p>
                </div>
                <div class="form-group">
                    <p style="font-size: 17px"><a href="index2.html" style="color: #33cccc;font-size:17px">登录</a> or <a href="sign-up2.html" style="color: #33cccc;font-size: 17px">注册</a></p>
                </div>
                <div class="form-group" style="text-align:center;">
                    <input type="submit" value="发送" class="btn btn-primary">
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



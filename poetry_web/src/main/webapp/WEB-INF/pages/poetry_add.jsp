<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/23/023
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>诗词反馈</title>
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
    <script src="js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

</head>
<body class="style-2">

<div class="container">
    <div class="row">
        <div class="col-md-6 col-lg-offset-3">
            <!-- Start Sign In Form -->
            <form action="/enjoy/poetryAdd" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" method="post" enctype="multipart/form-data">
                <h2>反馈</h2>
                <div class="form-group">
                    <div class="alert alert-success" role="alert">您的反馈将是我们前进的动力</div>
                </div>
                <div class="form-group">
                    <label for="account" style="color: #000000;font-size:20px; " >诗词名称</label>
                    <input type="text" name="title" required="required" class="form-control" id="account" placeholder="请输入你想添加诗的名字" autocomplete="off">
                    <p id="text" style="color: #dd356e;font-size: 20px"></p>
                </div>
                <div class="form-group">
                    <label for="name" style="color: #000000;font-size:20px; ">作者</label>
                    <input type="text" name="author" required="required"  class="form-control" id="name" placeholder="请输入你想添加诗的作者" autocomplete="off">
                </div>
                <div class="form-group" style="text-align:center;">
                    <input type="submit" id="btn" value="提交" class="btn btn-primary">
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
<script>
    $(document).ready(function() {
        $("#btn").click(function () {
            alert("提交成功");
        })
    });
</script>
</body>
</html>


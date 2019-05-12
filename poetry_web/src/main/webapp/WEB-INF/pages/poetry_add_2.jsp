<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/24/024
  Time: 19:12
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
    <title>诗词添加</title>
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
            <form action="/admin/poetryAdd/add" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" method="post" enctype="multipart/form-data">
                <h2>诗词添加</h2>
                <div class="form-group">
                    <label for="title" style="color: #000000;font-size:20px; " >诗词名称</label>
                    <input type="text" name="title" required="required" class="form-control" id="title"  autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="author" style="color: #000000;font-size:20px; ">作者</label>
                    <input type="text" name="author" required="required"  class="form-control" id="author" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="dynasty" style="color: #000000;font-size:20px; ">朝代</label>
                    <input type="text" name="dynasty" required="required"  class="form-control" id="dynasty" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="intro" style="color: #000000;font-size:20px; ">作者介绍</label>
                    <textarea name="intro" required="required"  class="form-control" id="intro" autocomplete="off"></textarea>
                </div>
                <div class="form-group">
                    <label for="content" style="color: #000000;font-size:20px; " >诗词内容</label>
                    <textarea name="content" required="required" class="form-control" id="content"  autocomplete="off"></textarea>
                </div>
                <div class="form-group">
                    <label for="translate" style="color: #000000;font-size:20px; ">翻译</label>
                    <textarea name="translate" required="required"  class="form-control" id="translate" autocomplete="off"></textarea>
                </div>
                <div class="form-group">
                    <label for="background" style="color: #000000;font-size:20px; ">写作背景</label>
                    <textarea name="background" required="required"  class="form-control" id="background" autocomplete="off"></textarea>
                </div>
                <div class="form-group">
                    <label for="note" style="color: #000000;font-size:20px; ">注释</label>
                    <textarea type="textarea" name="note" required="required"  class="form-control" id="note" autocomplete="off"></textarea>
                </div>
                <div class="form-group">
                    <label for="enjoy" style="color: #000000;font-size:20px; ">赏析</label>
                    <textarea name="enjoy" required="required"  class="form-control" id="enjoy" autocomplete="off"></textarea>
                </div>
                <div class="form-group">
                    <label for="type" style="color: #000000;font-size:20px; ">类型</label>
                    <input name="type" required="required"  class="form-control" id="type" autocomplete="off">
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

</body>
</html>



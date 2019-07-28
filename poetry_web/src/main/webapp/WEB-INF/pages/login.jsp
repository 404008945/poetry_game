<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co"/>
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive"/>
    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/animate2.css">
    <link rel="stylesheet" href="/css/style2.css">

    <script src="/js/modernizr-2.6.2.min.js"></script>
</head>
<body class="style-2">

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <!-- Start Sign In Form -->
            <form action="/loginAccount" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" method="post">
                <c:if test="${loginErr!=null}">
                    <span style="color: red">${loginErr}</span>
                </c:if>
                <h2>登录</h2>
                <div class="form-group">
                    <label for="username">账户名</label>
                    <input type="text" class="form-control" required="required" name="account" id="username"
                           placeholder="请输入用户名" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" class="form-control" required="required" name="password" id="password"
                           placeholder="请输入密码" autocomplete="off">
                </div>
                <div class="form-group" style="text-align: center;">
                    <input type="submit" id="btn"  value="登录" class="btn btn-primary">
                </div>
                <div style="text-align: center">
                    <span>QQ快速登录</span>
                    <a href="/login/qq">
                        <img src="/img/qq.gif" alt="">
                    </a>
                </div>
            </form>

        </div>
    </div>
    <div class="row" style="padding-top:80px; clear: both;">
        <div class="col-md-12 text-center" style="font-size: 25px;">
            <p>
                <small>&copy; All Rights Reserved.</small>
            </p>
        </div>
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
<script src="/js/jq-slideVerify.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

</script>
</body>
</html>


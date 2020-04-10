<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/14/014
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的空间</title>
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

    <!-- <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet">	 -->
    <link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/css/bootstrap.css">
    <!-- Flexslider  -->
    <link rel="stylesheet" href="/css/flexslider.css">

    <!-- Theme style  -->
    <link rel="stylesheet" href="/css/style.css">

    <!-- Modernizr JS -->
    <script src="/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
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

    <script src="https://cdn.staticfile.org/jquery/2.0.0/jquery.min.js">
    </script>
    <script>
        $(document).ready(function () {
            $("#button").click(function () {
                //在原来的窗口跳转
                window.location.href = "/enjoy/index";
            });
        });
    </script>
</head>
<body class="style-3">
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <button id="button" type="button" class="btn btn-default"
                    style="color:#ffffff;float: right;margin-top:20px;background-color: #5bc0de">返回主页
            </button>
            <!-- Start Sign In Form -->
            <div action="#" class="fh5co-form animate-box" data-animate-effect="fadeInRight">
                <c:if test="${messagesN.size()!=0}">
                    <h2 style="text-align:center;">新消息<span style="float: right;"><a href="/enjoy/index"
                                                                                     style="color: #e14b7e">我知道了</a></span>
                    </h2>
                    <c:forEach var="message" items="${messagesN}">
                        <div class="form-group">
                            <div class="alert alert-success" role="alert">
                                <a href="#" style="color:#3c763d;font-size: 20px">${message.info}</a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${requestMessage.size()!=0}">
                    <h2 style="text-align:center;">验证消息</h2>
                    <c:forEach var="message" items="${requestMessage}">
                        <form id="accept${message.id}" action="/friend/requestResult?result=1&messageId=${message.id}">
                            <input type="hidden" name="result" value="1">
                            <input type="hidden" name="messageId" value="${message.id}">
                        </form>
                        <form id="refuse${message.id}" action="/friend/requestResult?result=0&messageId=${message.id}">
                            <input type="hidden" name="result" value="0">
                            <input type="hidden" name="messageId" value="${message.id}">
                        </form>
                        <div class="form-group">
                            <div class="alert alert-success" role="alert">
                                <a href="#" style="color:#3c763d;font-size: 20px">在<fmt:formatDate
                                        value="${message.time}" pattern="yyyy年MM月dd日 HH:mm:ss"/>&nbsp;&nbsp;<span
                                        style="color: #e14b7e;font-size: 20px">${message.user.account}</span>&nbsp;&nbsp;请求添加你为好友</a>
                                &nbsp;&nbsp;&nbsp;<button class="btn-sm btn-success" form="accept${message.id}">同意
                            </button>
                                &nbsp;&nbsp;&nbsp;<button class="btn-sm btn-danger" form="refuse${message.id}">拒绝
                            </button>
                                <p style="font-size: 17px;color: #e14b7e">验证消息是：${message.message}</p>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <h2 style="text-align:center;">历史消息</h2>
                <c:forEach var="message" items="${messagesY}">
                    <div class="form-group">
                        <div class="alert alert-success" role="alert" style="padding-bottom: 30px">
                            <a href="#" style="color:#3c763d;font-size: 20px;text-decoration: none;">${message.info}</a>
                            <button class="btn btn-warning btn-sm" style="float: right;" onclick="location.href='/user/removeMessage/?id=${message.id}'">删除</button>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- END Sign In Form -->
        </div>
    </div>
    <div class="row" style="padding-top: 80px; clear: both;">
        <div class="col-md-12 text-center" style="font-size: 25px;">
            <p>
                <small>&copy; All Rights Reserved.</small>
            </p>
        </div>
    </div>
</div>
<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
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
<!-- jQuery -->
<script src="/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="/js/jquery.flexslider-min.js"></script>
<!-- Main -->
<script src="/js/main.js"></script>
</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/12/012
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
</head>
<body>
<nav class="fh5co-nav" role="navigation" style="background-color: #a9c6de">
    <div class="top-menu" style="padding: 10px">
        <div class="container">
            <div class="row">
                <div class="col-xs-2">
                    <p id="fh5co-logo" style="width:150px;font-weight: lighter"><a href="/enjoy/index">极简诗社</a></p>
                </div>
                <div class="col-xs-10 text-right menu-1">
                    <ul>
                        <li><a style="font-size: 25px;color:#e14b7e" href="/question/startPage">诗词游戏</a></li>
                        <li class="has-dropdown">
                            <a style="font-size: 25px" href="#">诗词欣赏</a>
                            <ul class="dropdown">
                                <c:if test="${sessionScope.user!=null}">
                                    <li><a style="font-size: 20px;" href="/enjoy/recommend">猜你喜欢</a></li>
                                </c:if>
                                <li><a style="font-size: 20px;" href="/enjoy/tangshi_list/1">唐代诗词</a></li>
                                <li><a style="font-size: 20px" href="/enjoy/songshi_list/1">宋代诗词</a></li>
                                <li><a style="font-size: 20px" href="/enjoy/searchPage">诗词搜索</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a style="font-size: 25px" href="#">诗词娱乐</a>
                            <ul class="dropdown">
                                <li><a style="font-size: 20px" href="/calendar/index">诗词周历</a></li>
                                <li><a style="font-size: 20px" href="/user/poetrySquare/1?type=0">诗词广场</a></li>
                                <li><a style="font-size: 20px" href="/user/writePage">我要写诗</a></li>
                                <li><a style="font-size: 20px" href="/user/headPoetryPage">藏头诗生成</a></li>
                            </ul>
                        </li>
                        <c:if test="${sessionScope.user==null}">
                            <li class="btn-cta"><a style="font-size: 20px" href="/loginPage"><span>登录</span></a></li>
                        </c:if>
                        <c:if test="${sessionScope.user!=null}">
                            <li class="has-dropdown" style="font-weight: lighter;">
                                <a href="#"><img src="/image/${sessionScope.user.image}" class="img-circle" style="width: 60px;height: 60px"/></a>
                                <ul class="dropdown">
                                    <c:if test="${user.type==1}">
                                        <li><a style="font-size: 20px" href="/admin/main">用户管理</a></li>
                                    </c:if>
                                    <c:if test="${user.type==1}">
                                        <li><a style="font-size: 20px" href="/admin/poetryAdd/1">诗词完善</a></li>
                                    </c:if>
                                    <li><a style="font-size: 20px" href="/zone">我的空间</a></li>
                                    <li><a style="font-size: 20px" href="/userInfo">个人中心</a></li>
                                    <li><a style="font-size: 20px" href="/logout">退出登录</a></li>
                                </ul>
                            </li>
                        <c:if test="${sessionScope.messageNum!=0}">
                        <li><a href="/user/message"><img src="/images/message_y.png" class="img-circle" style="width: 40px;height: 40px"/>${sessionScope.messageNum}</a>
                        </c:if>
                        <c:if test="${sessionScope.messageNum==0}">
                        <li><a href="#"><img src="/images/message_n.png" class="img-circle" style="width: 40px;height: 40px"/></a>
                            </c:if>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
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

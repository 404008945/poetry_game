<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getSession().getAttribute("user") == null) {//添加session
        response.sendRedirect("/loginPage");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/bs/css/bootstrap.css">
    <link rel="stylesheet" href="/css/styleformain.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <script src="/bs/js/jquery.min.js"></script>
    <script src="/bs/js/bootstrap.js"></script>
    <link rel="stylesheet" href="/css/styleforsbutton.css">
    <script src="/js/scriptforsbutton.js"></script>
    <title>诗词游戏</title>
</head>
<body style="background: #eaf5ff">
<jsp:include page="nav.jsp"/>
<div class="container">
    <div class="user">
        <img src="/image/${user.image}" style="margin-top: 10px"/>
        <p class="text-info name" style="font-size: 35px">${user.username}</p>
        <dic class="row">
            <div class="col-xs-6 win">
                <p class="num">${user.winNumber}</p>
                <p class="ans" style="font-size: 40px">WIN</p>
            </div>
            <div class="col-xs-6 lose">
                <p class="num">${user.totalNumber-user.winNumber}</p>
                <p class="ans" style="font-size: 40px">LOSE</p>
            </div>
        </dic>
    </div>
  <!--  <a href="${request.getContextPath()}/question/play" class="start text-primary" style="height: 100px"><span
            class="glyphicon glyphicon-play-circle"></span></a>
               <a href="${request.getContextPath()}/question/singleplayer">单人练习</a>  -->
    <div class="box row"  style="margin: 0 auto">
        <div class="col-md-6">
        <div class="link mission-link">
            <a class="button" data-title="My mission is clear"  href="${request.getContextPath()}/question/play">
                <span class="line line-top"></span>
                <span class="line line-right"></span>
                <span class="line line-bottom"></span>
                <span class="line line-left"></span>
               匹配模式
            </a>
        </div>
        </div>
        <div class=" col-md-6">
        <div class="link play-link"  style="margin-left: 20%;">
            <a class="button" data-title="This is my playground" href="${request.getContextPath()}/question/singleplayer" style="color:#D0C7AA ">
                <span class="line line-top"></span>
                <span class="line line-right"></span>
                <span class="line line-bottom"></span>
                <span class="line line-left"></span>
               单人模式
            </a>
        </div>
        </div>
    </div>
    <!-- 两种开始游戏方式，，单人游戏模式-->
    <!--<p class="text-info tip">开始游戏</p>-->
    <p class="text-center text-info">当前在线人数:<span class="text-danger">${count}</span></p>
    </p>
    <div class="alert alert-danger">游戏说明:<br>&nbsp;&nbsp;玩家点击开始游戏，将自动开始匹配，匹配到对手自动开始游戏，游戏采取计分制，两位玩家同时答题，每一题用时较少将获得更多的积分，最终分积分高者获胜。</div>
</div>
   <script>
             $(function () {
                 if($(window).width()<500)
                 {
                     $(".play-link").css({'margin-left':"0%"})
                 }
                 $(window).resize(function(){
                     if($(window).width()<500)
                     {
                         $(".play-link").css({'margin-left':"0%"})
                     }else{
                         $(".play-link").css({'margin-left':"20%"})
                     }
                 });

             })
   </script>
</body>
</html>

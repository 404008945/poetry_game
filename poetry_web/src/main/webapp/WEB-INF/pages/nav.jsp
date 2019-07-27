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
                                    <li><a style="font-size: 20px" href="/enjoy/recommend">猜你喜欢</a></li>
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
                                    <li><a style="font-size: 20px" href="/friend/searchPage">添加好友</a></li>
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
<%--<script>--%>
    <%--$(".fh5co-nav li").mouseover(function () {--%>
        <%--$(this).sibling().stop();--%>
    <%--})--%>
<%--</script>--%>
<script>
    var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://localhost:8010/online");//第一次进去有seseeson被服务器保存下来了
    } else {
        alert('当前浏览器 Not support websocket')
    }
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };
    websocket.onopen = function () {
        //需要告知服务器客户的id号 发送请求请求服务器的数据
        var msg={req:'update',from_acc:'${user.account}'}
        websocket.send(JSON.stringify(msg));
    }
    websocket.onmessage = function (event) {//发起邀请请求
        var obj=JSON.parse(event.data);
   console.log(obj)
        if(obj.op=='update')
        {
            var data=obj.data;
           var ele= crrateList(data);
           uppdateList(ele)

        }
    }
    websocket.onclose = function () {
    }
      window.onbeforeunload = function () {
        closeWebSocket();
    }
    function closeWebSocket() {
        /*
        * 答题结束
        * */
        websocket.close();
    }


    //获取好友列表功能

</script>
<script src="http://www.jq22.com/jquery/jquery-migrate-1.2.1.min.js"></script>
<script language="javascript" src="/js/sonline.js"></script>
<link rel="stylesheet" type="text/css" href="/css/default_blue.css"/>
<script>
$(function(){
    $("body").Sonline({
        Position:"right",//left或right
        Top:100,//顶部距离，默认200px
        Effect:true, //滚动或者固定两种方式，布尔值：true或false
        DefaultsOpen:true, //默认展开：true,默认收缩：false
        Qqlist:""
    });
})
function   crrateList(Qqlist) {
    var strs = new Array(); //定义一数组
    var QqlistText =Qqlist;
    strs = QqlistText.split(","); //字符分割
    var QqHtml = ""
    for (var i = 0; i < strs.length; i++) {
        var subStrs = new Array(); //定义一数组
        var subQqlist = strs[i];
        subStrs = subQqlist.split("|"); //字符分割
        QqHtml = QqHtml + "<div class='QQList' style='margin-bottom:20px'><img class='pull-left' src='/images/onlineuser.png' />   <span class='pull-left'>" + subStrs[1]+"：</span> <img style='margin-left:20px' class='pull-right' src='/images/message.png'><button   class='pull-right' style='border-radius:5px;margin-left:20px;background:#3596D3; color:white'>邀请</button> </div>"
    }
    return QqHtml;
}//改变列表

    function uppdateList(ele) {

        $("#SonlineBox > .contentBox > .listBox").html("");
        $("#SonlineBox > .contentBox > .listBox").append(ele);
        var yjfk="<form class='form-inline' role='form'><div class='form-group'><label class='sr-only' for='name'>名称</label><input style='width:150px' type='text' class='form-control' style='width:180px; height:15px' id='name' placeholder='请输要发送的消息'></div><button type='submit' style='display: inline-block' height='30px' class='btn btn-sm'>发送</button></form>";
        $("#SonlineBox > .contentBox > .listBox").append(yjfk);
        var allHeights = 0;
        if ($("#SonlineBox > .contentBox").height() < $("#SonlineBox > .openTrigger").height()) {
            allHeights = $("#SonlineBox > .openTrigger").height() + 4;
        } else {
            allHeights = $("#SonlineBox > .contentBox").height() + 4;
        }
        $("#SonlineBox").height(allHeights);
    }
</script>
</body>
</html>

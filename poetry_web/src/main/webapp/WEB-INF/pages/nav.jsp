<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/12/012
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    ResourceBundle resource = ResourceBundle.getBundle("info");
%>
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
                        <li><img src="/images/hot1.png" style="width: 40px;height: 35px;margin-bottom: 13px"><a
                                style="font-size: 25px;color:#e14b7e" href="/question/startPage">诗词游戏</a></li>
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
                            <a href="#"><img src="/image/${sessionScope.user.image}" class="img-circle"
                                             style="width: 60px;height: 60px"/></a>
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
                        <li><a href="/user/message"><img src="/images/message_y.png" class="img-circle"
                                                         style="width: 40px;height: 40px"/>${sessionScope.messageNum}
                        </a>
                            </c:if>
                            <c:if test="${sessionScope.messageNum==0}">
                        <li><a href="/user/message"><img src="/images/message_n.png" class="img-circle"
                                                         style="width: 40px;height: 40px"/></a>
                            </c:if>
                            </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
<button class="btn1" style="display: none">点击我，打开</button>
<button class="btn2" style="display: none"> >点击我，打开</button>
<button class="btn3" style="display: none">>点击我，打开</button>
<div class="m-modal" style="z-index:9999999999999999">
    <div class="m-modal-dialog">
        <div class="m-top">
            <h4 class="m-modal-title" style="background: #ff2d51">
                诗词游戏
            </h4>
            <span class="m-modal-close">&times;</span>
        </div>
        <div class="m-middle">
            <!--content-->
            <p style="font-size: 20px">您的好友<span id="from_name" style="color: #ff2d51">&lt;hello&gt;</span>邀请您玩诗词对战游戏~
            </p>
        </div>
        <div class="m-bottom">
            <button class="m-btn-cancel">稍后再说</button>
            <button class="m-btn-sure" style="background: #ff2d51;border-color: #ff2d51">我要应战</button>
        </div>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="/css/jquery.my-modal.1.1.winStyle.css"/>
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
    <c:if test="${sessionScope.user!=null}">
    var websocket = null;
    var acc = '${user.account}'
    var from_acc;
    var from_name;
    var message;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        var str='<%=resource.getString("host2")%>'
       websocket = new WebSocket("ws:"+str);//第一次进去有seseeson被服务器保存下来了
    } else {
        alert('当前浏览器 Not support websocket')
    }
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };
    websocket.onopen = function () {
        //需要告知服务器客户的id号 发送请求请求服务器的数据
        var msg = {req: 'update', from_acc: acc};
        websocket.send(JSON.stringify(msg));
    }
    websocket.onmessage = function (event) {//发起邀请请求
        var obj = JSON.parse(event.data);
        if (obj.op == 'update') {
            var data = obj.data;
            if (data == "") {
                $("#SonlineBox > .contentBox > .listBox").html("");
                $("#SonlineBox > .contentBox > .listBox").append("<p style='padding:15px'>您暂时还没有一个好友哦。</p>")
            } else {
                var ele = crrateList(data);
                uppdateList(ele);
            }
        }
        if (obj.op == "invite") {
            //获取
            from_acc = obj.from_acc;
            from_name = obj.from_name;
            //弹框跳出
            $('.btn1').click();
        }
        if (obj.op == 'start') {
            message = "组建房间成功，即将键入游戏";
            $(".btn2").click();
            setTimeout(function () {
                location = "/question/play";
            }, 2000);
        }
        if (obj.op == "failure") {
            message = obj.msg;
            $(".btn3").click();//提示用户邀请失败
        }
        if (obj.op == "message") {
            var fn = obj.from_name;
            var content = obj.content;
            message = fn + ":" + content;
            $(".btn2").click();
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
    </c:if>
    //获取好友列表功能
</script>
<script src="http://www.jq22.com/jquery/jquery-migrate-1.2.1.min.js"></script>
<script language="javascript" src="/js/sonline.js"></script>
<link rel="stylesheet" type="text/css" href="/css/default_blue.css"/>
<script>
    <c:if test="${sessionScope.user!=null}">
    $(function () {
        $("body").Sonline({
            Position: "right",//left或right
            Top: 100,//顶部距离，默认200px
            Effect: true, //滚动或者固定两种方式，布尔值：true或false
            DefaultsOpen: false, //默认展开：true,默认收缩：false
            Qqlist: ""
        });
    })
    </c:if>
    function crrateList(Qqlist) {
        var strs = new Array(); //定义一数组
        var QqlistText = Qqlist;
        strs = QqlistText.split(","); //字符分割
        var QqHtml = ""
        for (var i = 0; i < strs.length; i++) {
            var subStrs = new Array(); //定义一数组
            var subQqlist = strs[i];
            subStrs = subQqlist.split("|"); //字符分割
            if(subStrs[3]=='邀请') {
                QqHtml = QqHtml + "<div  onmouseover=\"this.style.backgroundColor='#f0f0f4';\" onmouseout=\"this.style.backgroundColor='white';\" class='QQList' style='margin:0;height: 50px;width: 100%'> <div style='padding-top:10px '><img class='pull-left isrc' style='width: 28px;height: 28px;margin-left:15px;border-radius: 50%' value='" + subStrs[1] + "' src='/image/" + subStrs[2] + "' />   <span class='pull-left' style='font-size: 15px;margin-left:3px;width: 60px;height: 25px;overflow: hidden'>" + subStrs[0] + "</span><img style='margin-left:20px;margin-right: 15px' class='pull-right msg' value='" + subStrs[1] + "' value1='" + subStrs[0] + "'  onmouseover=\"this.style.cursor='pointer'\" src='/images/message.png'><button   class='pull-right invite'  style='border-radius:5px;margin-left:20px;background:#3596D3; color:white' value='" + subStrs[1] + "'>邀请</button></div> </div>"
            }
            if(subStrs[3]=='正在游戏')
            {
                QqHtml = QqHtml + "<div  onmouseover=\"this.style.backgroundColor='#f0f0f4';\" onmouseout=\"this.style.backgroundColor='white';\" class='QQList' style='margin:0;height: 50px;width: 100%'> <div style='padding-top:10px '><img class='pull-left isrc' style='width: 28px;height: 28px;margin-left:15px;border-radius: 50%' value='" + subStrs[1] + "' src='/image/" + subStrs[2] + "' />   <span class='pull-left' style='font-size: 15px;margin-left:3px;width: 60px;height: 25px;overflow: hidden'>" + subStrs[0] + "</span><img style='margin-left:20px;margin-right: 15px' class='pull-right msg' value='" + subStrs[1] + "' value1='" + subStrs[0] + "'  onmouseover=\"this.style.cursor='pointer'\" src='/images/message.png'><button   class='pull-right invite'  style='border-radius:5px;margin-left:15px;background:#ccc; color:white' value='" + subStrs[1] + "' disabled='true'>游戏中</button></div> </div>"

            }

            }
        return QqHtml;
    }//改变列表
    function uppdateList(ele) {
        $("#SonlineBox > .contentBox > .listBox").html("");
        $("#SonlineBox > .contentBox > .listBox").append(ele);
        var yjfk = "<form class='form-inline' role='form'><div class='form-group'><label class='sr-only' for='name'>名称</label><input type='text' class='form-control pull-left' style='width:150px; height:15px;margin:0 20px 0 10px;font-size: 13px' id='msg_content' placeholder='点击消息图标选择'></div><button  class='pull-right' style='display: inline-block;width:55px;height:25px;border-radius: 30%;background: #1685a9;color: white;margin-right: 10px' id='msg_send' disabled='true'>发送</button></form>";
        $("#SonlineBox > .contentBox > .listBox").append(yjfk);
        var allHeights = 0;
        if ($("#SonlineBox > .contentBox").height() < $("#SonlineBox > .openTrigger").height()) {
            allHeights = $("#SonlineBox > .openTrigger").height() + 4;
        } else {
            allHeights = $("#SonlineBox > .contentBox").height() + 4;
        }
        $("#SonlineBox").height(allHeights);
        $(".invite").click(function () {
            //向服务器发送邀请信息
            var msg = {"req": "invite", "from_acc": acc, "to_acc": $(this).attr("value")};
            websocket.send(JSON.stringify(msg))
            locatio = "/question/play"
        })

        $(".msg").click(function () {
            $("#msg_send").attr("value", $(this).attr("value"));
            $("#msg_send").attr("disabled", false);
            $("#msg_content").attr("placeholder", "发送给" + $(this).attr("value1"));
        });

        $("#msg_send").click(function () {
            var text = $("#msg_content")[0].value;
            var msg = {req: "message", from_acc: acc, to_acc: $(this).attr("value"), content: text};//发送消息到服务器w               websocket.send(JSON.stringify(msg));
            websocket.send(JSON.stringify(msg));
            $("#msg_content")[0].value = '';
            message = '消息发送成功';
            $(".btn2").click();
            return false
        })
    }
</script>
<script type="text/javascript" src="/js/jquery.my-modal.1.1.js"></script>
<script>
    var m1 = new MyModal.modal(function () {
        location.href = "#";
    });
    $('.btn1').on("click", function () {
        $("#from_name").html(from_name);
        m1.show();
        var count = 10;//十秒自动关闭模态框
        var timer = setInterval(function () {
            $(".m-btn-cancel").html("稍后再说(" + count + ")");
            count--;
        }, 1000)
        setTimeout(function () {
            clearInterval(timer);
            m1.hide();
        }, 10000);

    });
    $(window).resize(function () {
        updateModal()
    });
    updateModal();

    function updateModal() {
        if ($(window).width() > 500) {
            $(".m-modal-dialog").width("30%");
        } else {
            $(".m-modal-dialog").width("70%");
        }
    }
</script>
<script src="/js/hullabaloo.js"></script>
<script type="text/javascript">
    $(".btn2").click(function () {
        $.hulla = new hullabaloo();
        setTimeout(function () {
            $.hulla.send(message, "success");
        }, 1000);
    });
    $(".btn3").click(function () {
        $.hulla = new hullabaloo();
        setTimeout(function () {
            $.hulla.send(message, "danger");
        }, 1000);
    })
    $(".m-btn-sure").click(function () {
        var msg = {req: 'accept', from_acc: from_acc, to_acc: acc}
        websocket.send(JSON.stringify(msg));//需要隐藏该框
        return false;
        /// location = "/question/play";
    })
</script>
<%--<script>--%>
<%--var setTitle = '';--%>
<%--var setContents = '';--%>
<%--var setButton = '';--%>
<%--$('.open-window-simulate').on('click', function () {--%>
<%--setContents = from_name + "邀请你加入游戏";--%>
<%--setButton = '["取消","接受"]';--%>
<%--$(this).openWindow(setTitle, setContents, setButton);--%>
<%--$(".confirm-button").click(function () {--%>
<%--//发送接受请求--%>
<%--var msg = {req: 'accept', from_acc: from_acc, to_acc: '${user.account}'}--%>
<%--websocket.send(JSON.stringify(msg));//需要隐藏该框--%>
<%--location = "/question/play";--%>
<%--})--%>
<%--});--%>
<%--$('.open-tip').on('click', function () {--%>
<%--setTitle = '提示';--%>
<%--setContents = message;--%>
<%--setButton = '["确认"]';--%>
<%--$(this).openWindow(setTitle, setContents, setButton);--%>
<%--});--%>
<%--</script>--%>
</body>
</html>

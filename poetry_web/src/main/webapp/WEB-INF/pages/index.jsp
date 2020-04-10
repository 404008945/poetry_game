<%@ page import="com.poetry.entity.User" %>
<%@ page import="java.util.*" contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getSession().getAttribute("user") == null) {//添加session
        response.sendRedirect("/loginPage");
    }
%>
<%
    ResourceBundle resource = ResourceBundle.getBundle("info");
%>
<!DOCTYPE html>
<html>
<head>
    <title>游戏界面</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content  ="IE=edge,chrome=1"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="MobileOptimized" content="320"/>
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <link href="/css/styleforgame1.css" rel="stylesheet"/>
    <link href="/css/common.css" rel="stylesheet"/>
    <link href="/css/styleforgame.css" rel="stylesheet">
    <link href="/css/time_css.css" rel="stylesheet">
</head>
<body>
<div class="wrap">
    <div class="global">
        <div class="timeBox" style="margin-top: 20px">
            <div class="game_time clock">
                <div class="hold">
                    <div class="pie pie1"></div>
                </div>
                <div class="hold">
                    <div class="pie pie2"></div>
                </div>
                <div class="bg"></div>
                <div class="time"></div>
            </div>
        </div>
        <div class="user">
            <div class="left">
                <img src="/image/${user.image}" class="headPic">
                <br>
                <canvas id="myCanvas0" width="110" height="50"></canvas>
            </div>
            <div class="right">
                <img src="" style="display: none" class="headPic">
                <br>
                <canvas id="myCanvas1" width="110" height="50"></canvas>
            </div>
        </div>
        <div id="load">
            <div class="text">正在匹配</div>
        </div>
        <div class="text-main1 hide">
            <div class="question-text">
                <p class="question-act"></p>
            </div>
            <ul class="key-menu1">
                <li class="n key key1 key-action"></li>
                <li class="n key key2 key-action2"></li>
                <li class="n key key3 key-action3"></li>
            </ul>
        </div>
        <div class="text-main2 hide">
            <div class="question-text">
                <p class="question-act"></p>
            </div>
            <ul class="key-menu2">
                <li class="n key key1 key-action"></li>
                <li class="n key key2 key-action2"></li>
                <li class="n key key3 key-action3"></li>
            </ul>
        </div>
        <div class="text-main3 hide">
            <div class="question-text">
                <p class="question-act"></p>
            </div>
            <ul class="key-menu3">
                <li class="n key key1 key-action"></li>
                <li class="n key key2 key-action2"></li>
                <li class="n key key3 key-action3"></li>
            </ul>
        </div>

        <div class="text-main4 hide">
            <div class="question-text">
                <p class="question-act"></p>
            </div>
            <ul class="key-menu4">
                <li class="n key key1 key-action"></li>
                <li class="n key key2 key-action2"></li>
                <li class="n key key3 key-action3"></li>
            </ul>
        </div>
        <div class="text-main5 hide">
            <div class="question-text">
                <p class="question-act"></p>
            </div>
            <ul class="key-menu5">
                <li class="n key key1 key-action"></li>
                <li class="n key key2 key-action2"></li>
                <li class="n key key3 key-action3"></li>
            </ul>
        </div>
        <div class="text-main6 hide">
            <div class="question-text">
                <p class="question-act"></p>
            </div>
            <ul class="key-menu6">
                <li class="n key key1 key-action"></li>
                <li class="n key key2 key-action2"></li>
                <li class="n key key3 key-action3"></li>
            </ul>
        </div>
        <div class="text-main7 hide">
            <div class="question-text">
                <p class="question-act"></p>
            </div>
            <ul class="key-menu7">
                <li class="n key key1 key-action"></li>
                <li class="n key key2 key-action2"></li>
                <li class="n key key3 key-action3"></li>
            </ul>
        </div>
        <div class="text-main8 hide">
            <div class="question-text">
                <p class="question-act"></p>
            </div>
            <ul class="key-menu8">
                <li class="n key key1 key-action"></li>
                <li class="n key key2 key-action2"></li>
                <li class="n key key3 key-action3"></li>
            </ul>
        </div>
        <div class="text-main9 hide">
            <div class="question-text">
                <p class="question-act"></p>
            </div>
            <ul class="key-menu9">
                <li class="n key key1 key-action"></li>
                <li class="n key key2 key-action2"></li>
                <li class="n key key3 key-action3"></li>
            </ul>
        </div>
        <div class="text-main10 hide">
            <div class="question-text">
                <p class="question-act"></p>
            </div>
            <ul class="key-menu10">
                <li class="n key key1 key-action"></li>
                <li class="n key key2 key-action2"></li>
                <li class="n key key3 key-action3"></li>
            </ul>
        </div>
        <div class="text-main11 hide">
            <div class="success hide">
                <img src="/img/win.png" width="150px"  style="display: block;margin: 0 auto">
                <p>获胜</p>
            </div>
            <div class="failure hide">
                <img src="/img/los.png" width="150px" style="display: block;margin: 0 auto">
                <p>失败</p>
            </div>
            <div class="draw hide">
                <img src="/img/bal.png" width="150px"  style="display: block;margin: 0 auto">
                <p>平局</p>
            </div>
            <div class="agre">
                <a href="/question/startPage" class="again">再来一局</a>
                <a href="/enjoy/index" class="return">返回主页</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/loading.js"></script>
<script type="text/javascript" src="/js/script1.js"></script>
<script type="text/javascript" src="/js/time_js.js"></script>
<script type="text/javascript" src="/js/styleforscore.js"></script>
<script type="text/javascript">
    var yes = 0;
    var change = true;
    var choice = -1;

    /**
     * 答题
     */
    function setTime() {
        len--;
        $('.text-main' + len + '').addClass("hide");
        len++;
        $('.text-main' + len + '').removeClass("hide");
        change = true;
    }

    function answerClick(a) {
        $(a).find("li").click(function () {
            var correct = false;
            $(this).unbind("click").unbind("mouseover").unbind("mouseout");
            $(this).siblings().unbind("click").unbind("mouseover").unbind("mouseout");
            $(this).addClass("opActive");

            if (change == true) {
                change = false;
                choice = $(this).attr("class").split(" ")[2].charAt(3);//  key 1 ,2  3
                //判断是否正确
                var html = "";
                if ($(this).html().charAt(0) == ans) {
                    correct = true;

                    html = "<div class='yes-icon'></div>";
                    $(this).append(html);
                    yes++;
                } else if ($(this).hasClass("n")) {
                    html = "<div class='no-icon'></div>";
                    $(this).append(html);
                }
            }
            var str = "{'correct':'" + correct + "','choice':'" + choice + "','roomIdx':'" + roomIdx + "','playerIdx':'" + playerIdx + "'}"       //需要告诉服务器当前的时间以及是否正确
            send(str);
        });
    }

    answerClick(".key-menu1");
    answerClick(".key-menu2");
    answerClick(".key-menu3");
    answerClick(".key-menu4");
    answerClick(".key-menu5");
    answerClick(".key-menu6");
    answerClick(".key-menu7");
    answerClick(".key-menu8");
    answerClick(".key-menu9");
    answerClick(".key-menu10");
    score = 0;
    changing = true;
    var UA = function () {
        var userAgent = navigator.userAgent.toLowerCase();
        return {
            ipad: (/ipad/i).test(userAgent),
            iphone: (/iphone/i).test(userAgent),
            android: (/android/i).test(userAgent),
            weixin: (/micromessenger/i).test(userAgent)
        };
    };
    var ua = UA();
    if (ua.weixin || ua.android || ua.ipad || ua.iphone) {
        $(".qr1").addClass("hide");
        $(".qr2").addClass("hide");
    }

    $(".key").mouseover(function () {
        $(this).addClass("opActive");

    })
    $(".key").mouseout(function () {
        $(this).removeClass("opActive");
    })
</script>

<script type="text/javascript">

    var ans;  //存放当前题目的答案
    var roomIdx;
    var playerIdx;
    var flag = 0;
    var websocket = null;
    var len;//全局  代表当前页面
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        var str='<%=resource.getString("host")%>'
        websocket = new WebSocket('ws:'+str);//第一次进去有seseeson被服务器保存下来了
    } else {
        alert('当前浏览器 Not support websocket')
    }
    //连接发生错误的回调方法
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };
    //连接成功建立的回调方法
    websocket.onopen = function () {
        //需要告知服务器客户的id号 发送请求请求服务器的数据
    }
    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        var obj = eval('(' + event.data + ')');
        /*开始游戏*/
        if (obj.matching === 'true') {

            $(".clock").hide();
        } else if (obj.abc === 'true') {
            //   alert("游戏开始");
            setScore0(0);
            setScore1(0);
            $("#load").addClass("hide");
            $(".text-main1").removeClass("hide");
            $(".clock").show();
            //需要加载对手的信息
            var imgSrc = obj.userImg;
            var url = window.location;//当前url
            //  url += "";
            // url = "/downloadImg?imgSrc=" + imgSrc;
            var image = $(".user .right img")[0];
            image.src="/image/"+imgSrc;
            $(".user .right img").show();
            //downloadFilebyAjax(url);
        } else if (obj.zzz === 'true') {//发题
            clearTime();
            updateTime();
            if (obj.reconnect == "true") {
                var qNum = obj.questionNum;
                $("#load").addClass("hide");
                //     $(".text-main"+qNum+"").removeClass("hide");//显示出来
                clearTime();
                updateTimeBySecond(obj.time);
                if (obj.choice != -1) {
                    var str;
                    if (obj.isCorrect == true) {
                        str = "<div class='yes-icon'></div>"
                    } else {
                        str = "<div class='no-icon'></div>"
                    }
                    $(".text-main" + qNum + " ul li").eq(obj.choice - 1).append(str).addClass("opActive");
                    $(".text-main" + qNum + " ul li").unbind("click").unbind("mouseover").unbind("mouseout");
                }
            }
            roomIdx = obj.roomIdx;//拿到当前用户所在的房间号以及用户位置
            playerIdx = obj.playerIdx;
            len = obj.questionNum;
            $(".text-main" + len + " .question-text .question-act").html(obj.title);
            $(".text-main" + len + " li").eq(0).append("A:" + obj.A);
            $(".text-main" + len + " li").eq(1).append("B:" + obj.B);
            $(".text-main" + len + " li").eq(2).append("C:" + obj.C);
            ans = obj.correct;
            setTimeout(setTime, 600);
        } else if (obj.score == "true") {
            if (playerIdx == 0) {
                setScore0(obj.score0);
                setScore1(obj.score1);
            } else {
                setScore0(obj.score1);
                setScore1(obj.score0);
            }
        } else if (obj.over == "true") {
            //游戏结果出来了，本局游戏结束
            clearTime();
            $(".clock").hide();
            if (obj.winNum == -1) {
                $(".text-main11 .draw").removeClass("hide");
            } else if (obj.winNum == playerIdx) {
                $(".text-main11 .success").removeClass("hide");
            } else {
                $(".text-main11 .failure").removeClass("hide");
            }
            len = 11;
            setTime();
        } else if (obj.reconnect == "true") {
            var qNum = obj.questionNum;
            $("#load").addClass("hide");
            $(".text-main" + qNum + "").removeClass("hide");//显示出来
            //  alert(obj.choice);
            updateTimeBySecond(obj.time);
        } else if (obj.reconnectUserInfo == "true") {
            var imgSrc = obj.userImg;
            var url = window.location;//当前url
            var image = $(".user .right img")[0];
            image.src="/image/"+imgSrc;
            $(".user .right img").show();
            //     downloadFilebyAjax(url);//更新用户头像
        }else if(obj.timeOut=="true")
        {
            alert("匹配超时,即将跳会游戏主页");
            location="/question/startPage";
        }
    }
    //连接关闭的回调方法
    websocket.onclose = function () {

    }

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }

    //关闭WebSocket连接
    function closeWebSocket() {
        /*
        * 答题结束
        * */
        websocket.close();
    }

    //发送消息
    function send(str) {
        websocket.send(str);//随便发送一个数据
    }

</script>
</body>
</html>
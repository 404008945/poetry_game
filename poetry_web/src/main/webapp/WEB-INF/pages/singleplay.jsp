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
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/styleforgame1.css" rel="stylesheet"/>
    <link href="/css/common.css" rel="stylesheet"/>
    <link href="/css/styleforgame.css" rel="stylesheet">
    <link href="/css/time_css.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/flexslider.css">
    <link rel="stylesheet" type="text/css" href="/css/jquery.my-modal.1.1.winStyle.css"/>
</head>
<body>
<button class="btn1" style="display: none">点击我，打开</button>
<button class="btn2" style="display: none"> >点击我，打开</button>
<button class="btn3" style="display: none">>点击我，打开</button>
<a href="/question/startPage" class="btn btn-info" style="position: absolute;right: 15%;top:3%">返回</a>
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
                <canvas id="myCanvas0" width="110" height="50" style="margin-top: 20px"></canvas>
            </div>
            <div class="right">
                <span src=""  class="headPic" style="display: inline-block;font-size:24px;color: #D0504C;width: 100px">历史最高</span>
                <br>
                <span id="myCanvas1" style="width: 110px;color:#337AB7;font-size:35px ;font-weight: bold;display:inline-block;margin-bottom: 22px">${user.highestScore}</span>
            </div>
        <!--    <div class="right">
               <h1 style="height: 50px;">历史最高</h1>
                <br>
                <h3 class="text-info" style="text-align: center;color: red;height: 50px">500</h3>
            </div>  -->
        </div>
        <div id="load">
            <div class="text">Loading</div>
        </div>
        <div class="text-main1 hide">
            <div class="question-text">
                <p class="question-act">${questions.get(0).title}</p>
            </div>
            <ul class="key-menu1">  <!-- 给一个正确的值 -->
                <li class="n key key1 key-action" correct="${questions.get(0).correct=='A'}">${questions.get(0).optiona}</li>
                <li class="n key key2 key-action2" correct="${questions.get(0).correct=='B'}">${questions.get(0).optionb}</li>
                <li class="n key key3 key-action3" correct="${questions.get(0).correct=='C'}">${questions.get(0).optionc}</li>
            </ul>
        </div>
        <div class="text-main2 hide">
            <div class="question-text">
                <p class="question-act">${questions.get(1).title}</p>
            </div>
            <ul class="key-menu2">
                <li class="n key key1 key-action"  correct="${questions.get(1).correct=='A'}">${questions.get(1).optiona}</li>
                <li class="n key key2 key-action2" correct="${questions.get(1).correct=='B'}">${questions.get(1).optionb}</li>
                <li class="n key key3 key-action3" correct="${questions.get(1).correct=='C'}">${questions.get(1).optionc}</li>
            </ul>
        </div>
        <div class="text-main3 hide">
            <div class="question-text">
                <p class="question-act">${questions.get(2).title}</p>
            </div>
            <ul class="key-menu3">
                <li class="n key key1 key-action" correct="${questions.get(2).correct=='A'}">${questions.get(2).optiona}</li>
                <li class="n key key2 key-action2" correct="${questions.get(2 ).correct=='B'}">${questions.get(2).optionb}</li>
                <li class="n key key3 key-action3" correct="${questions.get(2).correct=='C'}">${questions.get(2).optionc}</li>
            </ul>
        </div>

        <div class="text-main4 hide">
            <div class="question-text">
                <p class="question-act">${questions.get(3).title}</p>
            </div>
            <ul class="key-menu4">
                <li class="n key key1 key-action" correct="${questions.get(3).correct=='A'}">${questions.get(3).optiona}</li>
                <li class="n key key2 key-action2" correct="${questions.get(3).correct=='B'}">${questions.get(3).optionb}</li>
                <li class="n key key3 key-action3" correct="${questions.get(3).correct=='C'}">${questions.get(3).optionc}</li>
            </ul>
        </div>
        <div class="text-main5 hide">
            <div class="question-text">
                <p class="question-act">${questions.get(4).title}</p>
            </div>
            <ul class="key-menu5">
                <li class="n key key1 key-action" correct="${questions.get(4).correct=='A'}">${questions.get(4).optiona}</li>
                <li class="n key key2 key-action2" correct="${questions.get(4).correct=='B'}">${questions.get(4).optionb}</li>
                <li class="n key key3 key-action3" correct="${questions.get(4).correct=='C'}">${questions.get(4).optionc}</li>
            </ul>
        </div>
        <div class="text-main6 hide">
            <div class="question-text">
                <p class="question-act">${questions.get(5).title}</p>
            </div>
            <ul class="key-menu6">
                <li class="n key key1 key-action" correct="${questions.get(5).correct=='A'}">${questions.get(5).optiona}</li>
                <li class="n key key2 key-action2" correct="${questions.get(5).correct=='B'}">${questions.get(5).optionb}</li>
                <li class="n key key3 key-action3" correct="${questions.get(5).correct=='C'}">${questions.get(5).optionc}</li>
            </ul>
        </div>
        <div class="text-main7 hide">
            <div class="question-text">
                <p class="question-act">${questions.get(6).title}</p>
            </div>
            <ul class="key-menu7">
                <li class="n key key1 key-action" correct="${questions.get(6).correct=='A'}">${questions.get(6).optiona}</li>
                <li class="n key key2 key-action2" correct="${questions.get(6).correct=='B'}">${questions.get(6).optionb}</li>
                <li class="n key key3 key-action3" correct="${questions.get(6).correct=='C'}">${questions.get(6).optionc}</li>
            </ul>
        </div>
        <div class="text-main8 hide">
            <div class="question-text">
                <p class="question-act">${questions.get(7).title}</p>
            </div>
            <ul class="key-menu8">
                <li class="n key key1 key-action" correct="${questions.get(7).correct=='A'}">${questions.get(7).optiona}</li>
                <li class="n key key2 key-action2" correct="${questions.get(7).correct=='B'}">${questions.get(7).optionb}</li>
                <li class="n key key3 key-action3" correct="${questions.get(7).correct=='C'}">${questions.get(7).optionc}</li>
            </ul>
        </div>
        <div class="text-main9 hide">
            <div class="question-text">
                <p class="question-act">${questions.get(8).title}</p>
            </div>
            <ul class="key-menu9">
                <li class="n key key1 key-action" correct="${questions.get(8).correct=='A'}">${questions.get(8).optiona}</li>
                <li class="n key key2 key-action2" correct="${questions.get(8).correct=='B'}">${questions.get(8).optionb}</li>
                <li class="n key key3 key-action3" correct="${questions.get(8).correct=='C'}">${questions.get(8).optionc}</li>
            </ul>
        </div>
        <div class="text-main10 hide">
            <div class="question-text">
                <p class="question-act">${questions.get(9).title}</p>
            </div>
            <ul class="key-menu10">
                <li class="n key key1 key-action" correct="${questions.get(9).correct=='A'}">${questions.get(9).optiona}</li>
                <li class="n key key2 key-action2" correct="${questions.get(9).correct=='B'}">${questions.get(9).optionb}</li>
                <li class="n key key3 key-action3" correct="${questions.get(9).correct=='C'}">${questions.get(9).optionc}</li>
            </ul>
        </div>
        <div class="text-main11 hide">
            <div class="success hide">
                <img src="/img/win.png" width="150px"  style="display: block;margin: 0 auto">
                <p></p>
            </div>
            <div class="draw hide">
                <img src="/img/bal.png" width="150px"  style="display: block;margin: 0 auto">
                <p>您的得分为xxx</p>
            </div>
            <div class="agre">
                <a href="/question/startPage" class="again">再来一局</a>
                <a href="/enjoy/index" class="return">返回主页</a>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/loading.js"></script>
<script type="text/javascript" src="/js/script1.js"></script>
<script type="text/javascript" src="/js/time_js.js"></script>
<script type="text/javascript" src="/js/styleforscore.js"></script>
<script type="text/javascript">


    $(function () {
        $("#load").addClass("hide");
        $(".text-main1").removeClass("hide");
        $(".clock").show();
        setScore0(0);
        clearTime();
        updateTime();
        //每一次切题都要有这个操作
    })
    //开始页面和计时
    var yes = 0;
    var change = true;
    var choice = -1;
    var questionNum=1;
    var score=0;
    var highestScore=${user.highestScore};
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
            var ans=$(this).attr("correct");
            var correct = false;
            $(this).unbind("click").unbind("mouseover").unbind("mouseout");
            $(this).siblings().unbind("click").unbind("mouseover").unbind("mouseout");
            $(this).addClass("opActive");
                change = false;
                choice = $(this).attr("class").split(" ")[2].charAt(3);//  key 1 ,2  3
                var html = "";
                if (ans=='true') {
                    var sc=SS*3;
                    score+=sc;
                    setScore0(score);
                    correct = true;
                    html = "<div class='yes-icon'></div>";
                    $(this).append(html);
                    yes++;
                } else if ($(this).hasClass("n")) {
                    html = "<div class='no-icon'></div>";
                    chtml = "<div class='yes-icon'></div>";
                    $(this).append(html);
                    $(this).siblings().filter("[correct='true']").append(chtml);
                    /*
                    错误要  显示出正确的
                     */
                }
                clearTime();
                var me=$(this);
                  setTimeout(function () {
                     me.parent().parent().next().show();
                     me.parent().parent().hide();
                      clearTime();
                      if(questionNum!=11)
                      {
                          updateTime();
                      }
                      questionNum++;
                      if(questionNum==11)
                      {
                          //游戏结束  出结果
                          $(".clock").hide();
                          dealAns();
                      }
                  },1000);//当前题目

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
    function  dealAns(){
        if(score>highestScore)
        {
            $(".text-main11 .success").show();
            $(".text-main11 .success p").html("得分为"+score+"恭喜您超过了最高分");
            //更新最高分
            $.ajax({
                url:"/question/updateScore",
                type:"get",
                data:{
                    score:score
                },
                success:function(data)
                {
                   console.log(data)
                }
            });
        }else{
            $(".text-main11 .draw").show();
            $(".text-main11 .draw p").html("得分为"+score)
        }
    }
</script>
<script>
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
</script>
<script type="text/javascript" src="/js/jquery.my-modal.1.1.js"></script>

<script src="/js/hullabaloo.js"></script>
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

</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/8/008
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户登录</title>
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
    <script src="/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/js/respond.min.js"></script>
    <![endif]-->

</head>
<body class="style-2">

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <!-- Start Sign In Form -->
            <form action="/login" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" method="post">
                <h2>登录</h2>
                <p style="font-size: 17px;color: #dd356e">${error}</p>
                <div class="form-group">
                    <label for="username" style="color: #000000;font-size:20px; ">账户名</label>
                    <input type="text" value="${user.account}" class="form-control" required="required" name="account" id="username" placeholder="请输入账户名或注册时的手机号" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password" style="color: #000000;font-size:20px; ">密码</label>
                    <input type="password" class="form-control" value="${user.password}" required="required" name="password" id="password" placeholder="请输入密码" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="remember"><input type="checkbox" checked name="remember" id="remember">记住我</label>
                </div>
                <div class="form-group">
                    <p style="font-size: 20px;">没有账号请<a href="/registerPage" style="color:#33cccc;">注册</a></p>
                </div>
                <div class="form-group">
                    <div class="verify-wrap form-group" id="verify-wrap"></div>
                </div>
                <div class="form-group" style="text-align: center;">
                    <input type="submit" id="btn" disabled="disabled" value="登录" class="btn btn-primary">
                </div>
            </form>
            <!-- END Sign In Form -->
        </div>
    </div>
    <div class="row" style="padding-top:80px; clear: both;">
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
<script src="/js/jq-slideVerify.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function(){
        var SlideVerifyPlug = window.slideVerifyPlug;
        var slideVerify = new SlideVerifyPlug('#verify-wrap',{
            //wrapWidth:'450',//设置 容器的宽度 ,不设置的话，会设置成100%，需要自己在外层包层div,设置宽度，这是为了适应方便点；
            initText:'请将滑块滑到最右边',  //设置  初始的 显示文字
            sucessText:'恭喜,验证通过',//设置 验证通过 显示的文字
            getSuccessState:function(res){
                //当验证完成的时候 会 返回 res 值 true，只留了这个应该够用了
                if(res==true)
                {
                    $("#btn").attr("disabled", false);
                }
            }
        });
        $("#resetBtn").on('click',function(){
            slideVerify.resetVerify();//可以重置 插件 回到初始状态
        })
        $("#getState").on('click',function(){
            alert(slideVerify.slideFinishState);   //这个可以拿到 当前验证状态  是否完成
        })
        var slideVerify2 = new SlideVerifyPlug('#verify-wrap2',{
            initText:'请按住滑块',
            sucessText:'验证通过',

        });
        $("#resetBtn2").on('click',function(){
            slideVerify2.resetVerify();
        })
        $("#getState2").on('click',function(){
            alert(slideVerify2.slideFinishState);
        })
    })
</script>
</body>
</html>


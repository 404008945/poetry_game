<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/8/008
  Time: 15:09
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
    <title>用户注册</title>
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
        <div class="col-md-6">
            <!-- Start Sign In Form -->
            <form action="/register" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" method="post" enctype="multipart/form-data">
                <h2>注册</h2>
                <c:if test="${errors!=null||error!=null}">
                    <p style="font-size: 20px;color: #dd356e">错误提示:</p>
                </c:if>
                <c:if test="${error!=null}">
                    <p style="font-size: 20px;color: #dd356e">${error}</p>
                </c:if>
                <c:forEach var="error" items="${errors}">
                    <p style="font-size: 17px;color: #dd356e">${error.defaultMessage}</p>
                </c:forEach>
                <div class="form-group">
                    <div class="alert alert-success" role="alert">请输入注册信息 <span style="margin-left:30%">嫌太麻烦？<a href="/fastReg">使用一键注册</a></span></div>
                </div>
                <div class="form-group">
                    <label for="account" style="color: #000000;font-size:20px; " >账号</label>
                    <input type="text" value="${users.account}" name="account" required="required" class="form-control" id="account" placeholder="由数字或英文字符组成(8位-15位)" autocomplete="off">
                    <p id="text" style="color: #dd356e;font-size: 20px"></p>
                </div>
                <div class="form-group">
                    <label for="name" style="color: #000000;font-size:20px; ">昵称</label>
                    <input type="text" value="${users.username}" name="username" required="required"  class="form-control" id="name" placeholder="支持数字、英文字符、中文、特殊字符" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="email" style="color: #000000;font-size:20px; ">电子邮箱</label>
                    <input type="email" required="required" value="${users.email}" name="email" class="form-control" id="email" placeholder="请输入电子邮箱" autocomplete="off">
                </div>
                <div class="form-group">
                    <p style="color: #000">请上传头像文件(小于5MB的图片)</p>
                    <input type="file" name="file" required="required" class="form-control" id="image"autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password" style="color: #000000;font-size:20px; ">密码</label>
                    <input type="password" name="password" required="required"  class="form-control" id="password" placeholder="由数字或英文字符组成(6位-20位)" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password" style="color: #000000;font-size:20px; ">再次输入密码</label>
                    <input type="password" name="passwordAgain" required="required"  class="form-control" id="passwordAgain" placeholder="由数字或英文字符组成(6位-20位)" autocomplete="off">
                </div>

                <div class="form-group" >
                    <p style="font-size: 17px">已经注册? <a href="loginPage" style="color: #33cccc;font-size: 17px">登录</a></p>
                </div>
                <div class="form-group" style="text-align:center;">
                    <input type="submit" id="btn" value="注册" class="btn btn-primary">
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
<script type="text/javascript">
    $(function(){
        $("#account").blur(function(){
            $.ajax({
                url:"${request.contextPath}/accountTest",
                type:"post",
                data:{
                    account:$(":input[name=account]").val()
                },
                success:function(data)
                {
                    if(data=='true')
                    {
                        $("#text").html("该账号可以被注册");
                        $("#btn").attr("disabled",false);
                    }else if(data=='false'){
                        $("#text").html("该账号已经被注册，换一个吧");
                        $("#btn").attr("disabled",true);

                    }
                }
            });
        });
    });
</script>
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

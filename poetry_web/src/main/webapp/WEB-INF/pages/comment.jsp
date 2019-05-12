<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/11/011
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>评论</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" href="pinglun.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
    <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
    <meta name="author" content="freehtml5.co" />



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
    <style type="text/css">
        li{
            list-style: none;
            float: left;
        }
        .like{ font-size:66px;  color:#ccc; cursor:pointer;}
        .cs{color:#f00;}
    </style>
</head>
<body>

<div class="fh5co-loader"></div>

<div id="page">
    <jsp:include page="nav.jsp"/>
    <div id="fh5co-contact">
        <div class="container">
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                    <h2>晨起裴吴二直讲过门云凤阁韩舍人物故作五章以哭之  其一</h2>
                    <p>[宋代] 梅尧臣</p>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading" >

                    <span style="text-align:center; font-size: 30px">平生交友泪，又哭寝门前。</span>

                    <span style="text-align:center; font-size: 30px">鲁叟不言命，楚人空问天。</span>

                    <span style="text-align:center; font-size: 30px">月沉沧海底，星陨太微边。</span>

                    <span style="text-align:center; font-size: 30px">莫恨终埋没，文章自可传。</span>

                </div>
            </div>
            <div style="text-align:center;">
                <p class="like">&#10084;</p>
            </div>
            <div class="container mt-3">
                <h2>用户评论</h2>
                <form role="form">
                    <div class="form-group">
                        <label style="font-size: 15px">我也要评论</label>
                        <textarea class="form-control" rows="3" placeholder="来了就说点什么吧"></textarea>
                    </div>
                    <div class="form-group" style="margin-bottom: 100px">
                        <button type="submit" style="width: 100px;float: right;" class="btn btn-primary btn-block">提交</button>
                    </div>
                </form>

                <div class="media border p-3">
                    <img src="http://static.runoob.com/images/mobile-icon.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
                    <div class="media-body">
                        <h3>给世界一个微笑</h3>
                        <div style="height: 15px">
                            <ul class="stuff" style="float: right;">
                                <li style="padding-right: 10px">
                                    <i class="icon-heart2" id="like1">123</i>
                                </li>

                                <li>
                                    <i class="icon-eye2" id="like2">123</i>
                                </li>
                            </ul></div>
                        <p>这首诗写的不错，语言流畅，感情极其细腻。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>


    <div class="gototop js-top">
        <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
    </div>
    </body>
    </html>



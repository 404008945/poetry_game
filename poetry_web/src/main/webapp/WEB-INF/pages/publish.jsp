<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/9/009
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>发表诗词</title>
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
</head>
<body style="background-color: #eaf5ff">

<div class="fh5co-loader"></div>

<div id="page">
    <jsp:include page="nav.jsp"/>
    <div id="fh5co-contact" style="text-align:center;">
        <div class="container">
            <div class="row animate-box" style="text-align:center;">
                <div class="col-md-12 fh5co-heading" style="text-align:center;">
                    <h2>诗词发表</h2>
                    <p>把你的诗句给分享给大家吧</p>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <form action="/user/write">
                <div class="col-md-12 animate-box" style="text-align:center;">
                    <div class="row">
                        <div class="col-md-12" style="text-align:center;">
                            <div class="form-group">
                                <input type="text" name="title" required="required" class="form-control" placeholder="诗词名称">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <textarea name="content" required="required" class="form-control" id="" cols="30" rows="7"
                                          placeholder="请开始你的创作。"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group" style="margin-top: 30px">
                                <input type="submit" value="发表" class="btn btn-primary btn-lg" style="background-color: #c8e6f5;color:#000000;border: #c8e6f5">
                            </div>
                        </div>
                    </div>
                </div>
                </form>
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



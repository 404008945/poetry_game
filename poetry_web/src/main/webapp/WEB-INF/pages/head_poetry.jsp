<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/12/012
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>藏头诗</title>
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
<body style="background-color: #d7f7f5">

<div class="fh5co-loader"></div>

<div id="page">
   <jsp:include page="nav.jsp"/>
    <div id="fh5co-contact" style="text-align:center;">
        <div class="container">
            <div class="row animate-box" style="text-align:center;">
                <div class="col-md-6 col-md-offset-3 fh5co-heading" style="text-align:center;">
                    <h2>${title}</h2>
                    <p style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;${content}</p>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 animate-box">
                    <div class="row">
                        <c:if test="${error!=null}">
                            <p style="color: #e14b7e">${error}</p>
                        </c:if>
                        <form action="/user/headPoetry/make" style="text-align:center;" method="get">
                            <div class="col-md-6 col-md-offset-3" style="text-align:center;">
                                <div class="form-group" style="text-align:left;">
                                    <label for="type">请先选择生成类型</label>
                                    <select id="type" class="form-control" name="type">
                                        <option value="1" selected="selected">五言</option>
                                        <option value="2">七言</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" required="required" name="title" placeholder="请输入你想要的藏头诗(十个字以内生成概率更大哦)">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group" style="margin-top: 30px">
                                    <input type="submit" value="点击生成" class="btn btn-primary btn-lg" style="background: #15cda8;border: #15cda8">
                                </div>
                            </div>
                        </form>
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



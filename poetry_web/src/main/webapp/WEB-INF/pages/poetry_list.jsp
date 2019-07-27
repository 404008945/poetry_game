<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>诗词</title>
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
<style type="text/css">
    ul.pagination {
        display: inline-block;
        padding: 0;
        margin: 0;
    }

    ul.pagination li {display: inline;}

    ul.pagination li a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
        transition: background-color .3s;
        border: 1px solid #ddd;
    }

    ul.pagination li a.active {
        background-color: #4CAF50;
        color: white;
        border: 1px solid #4CAF50;
    }

    ul.pagination li a:hover:not(.active) {background-color: #ddd;}

    div.center {text-align: center;}
</style>
<body style="background-color: #eaf5ff">

<div class="fh5co-loader"></div>

<div id="page">
    <jsp:include page="nav.jsp"/>
    <div id="fh5co-blog">
        <div class="container">
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                    <h2>${type}</h2>
                    <p style="text-align: left">${poetryValue}</p>
                </div>
            </div>
            <div class="row">
                <c:forEach var="info" items="${infos}">
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="/enjoy/detail_poetry/${info.poetry.id}" style="border-radius: 15px">
                                <div class="portfolio-entry" style="background: url('/images/${info.color}.jpg') no-repeat;border-radius: 15px">
                                    <p style="color: #000;text-align:center;padding-top: 120px;font-size: 25px">${info.poetry.title}</p>
                                </div>
                                <div class="portfolio-text">
                                    <h3 style="text-align:center;">作者——${info.poetry.author}</h3>
                                </div>
                                <div style="text-align: center;margin-bottom: 20px">
                                    <span style="padding-right: 130px"><i class="icon-heart2"></i>${info.likesNum}</span>
                                    <span><img width="23px" height="23px" class="icon-eye2" src="/images/comment.png"></img>${info.commentsNum}</span></div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <div class="center">
        <ul class="pagination">
            <li><a href="/enjoy/${type1}/1">首页</a></li>
            <c:if test="${pageInfo.pageNum==1}">
                <li><a style="pointer-events: none;cursor:default;" href="/enjoy/${type1}/${pageInfo.prePage}">前一页</a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=1}">
                <li><a href="/enjoy/${type1}/${pageInfo.prePage}">前一页</a></li>
            </c:if>
            <li><a href="#">当前页${pageInfo.pageNum}</a></li>
            <li><a href="#">共${pageInfo.pages}页</a></li>
            <c:if test="${pageInfo.pageNum==pageInfo.pages}">
                <li><a style="pointer-events:none;cursor:default;" href="/enjoy/${type1}/${pageInfo.nextPage}">下一页</a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                <li><a  href="/enjoy/${type1}/${pageInfo.nextPage}">下一页</a></li>
            </c:if>
            <li><a href="/enjoy/${type1}/${pageInfo.pages}">尾页</a></li>
        </ul>
    </div>
    <jsp:include page="footer.jsp"/>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
</div>
<script>
    $(".pagination a").css({'background-color':'#a9c6de'})
    var  w=$(window).width();
    update();

    $(window).resize(function () {
        update();
    });
    function update(){

        if(w<500)
        {
            $(".pagination li a").css({"width":"16.6666%"});
            $(".pagination li a").css({"font-size":"10px"});
            $(".pagination li a").css({"height":"60px"});

        }

    }
</script>
</body>
</html>
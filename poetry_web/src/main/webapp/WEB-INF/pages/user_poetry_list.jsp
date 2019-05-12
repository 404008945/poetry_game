<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/9/009
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
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
                    <h2>${title}</h2>
                    <p>${content}</p>
                </div>
            </div>
            <div class="row">
                <c:forEach var="dto" items="${poetrySquareDtos}">
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="/user/poetryDetail/${dto.userPoetry.id}" style="border-radius: 15px">
                                <div class="portfolio-entry" style="background: url('/images/${dto.colors}.jpg') no-repeat;border-radius: 15px">
                                    <p style="color: #000;text-align:center;padding-top: 80px;font-size: 25px">${dto.userPoetry.title}</p>
                                    <p style="color: #000;font-size: 20px;padding-left: 20px;margin-top: 60px">${dto.poetryPart}</p>
                                </div>
                                <div class="portfolio-text">
                                    <h3 style="text-align:center;">作者——${dto.userNames}</h3>
                                    <h4 style="text-align:center;"><fmt:formatDate value="${dto.userPoetry.time}" pattern="yyyy年MM月dd日 HH:mm:ss"/></h4>
                                </div>
                                <div style="text-align: center;margin-bottom: 20px">
                                    <span style="padding-right: 130px"><i class="icon-heart2"></i>${dto.userPoetry.likes}</span>
                                    <span><i class="icon-eye2"></i>${dto.userPoetry.views}</span></div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <div class="center">
        <ul class="pagination">
            <li><a href="/user/poetry/${userId}/1">首页</a></li>
            <c:if test="${pageInfo.pageNum==1}">
                <li><a style="pointer-events: none;cursor:default;" href="/user/poetry/${userId}/${pageInfo.prePage}">前一页</a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=1}">
                <li><a href="/user/poetry/${userId}/${pageInfo.prePage}">前一页</a></li>
            </c:if>
            <li><a href="#">当前页${pageInfo.pageNum}</a></li>
            <li><a href="#">共${pageInfo.pages}页</a></li>
            <c:if test="${pageInfo.pageNum==pageInfo.pages}">
                <li><a style="pointer-events:none;cursor:default;" href="/user/poetry/${userId}/${pageInfo.nextPage}">下一页</a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                <li><a  href="/user/poetry/${userId}/${pageInfo.nextPage}">下一页</a></li>
            </c:if>
            <li><a href="/user/poetry/${userId}/${pageInfo.pages}">尾页</a></li>
        </ul>
    </div>
    <jsp:include page="footer.jsp"/>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
</div>
<script>
    $(".pagination a").css({'background-color':'#a9c6de'})
</script>
</body>
</html>



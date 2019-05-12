<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/5/005
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>细节</title>
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
<body>

<div class="fh5co-loader"></div>

<div id="page" style="background-color: #29a3a3">
    <jsp:include page="nav.jsp"/>

    <div id="fh5co-contact">
        <div class="container">
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                    <h3>${poetryDto.title}</h3>
                    <p><c:if test="${poetryDto.dynasty!=null}">[${poetryDto.dynasty}]</c:if>
                        <c:if test="${poetryDto.dynasty!=null}">${poetryDto.author}</c:if>
                    </p>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row animate-box" style="width: 80%; margin: 0 auto">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading" >
                    <c:forEach var="item" items="${poetryDto.poetryArray}">
                        <span style="text-align:left; font-size: 23px">${item}</span>
                    </c:forEach>
                </div>
            </div>
            <h3>作者或作品简介:</h3>
            <c:if test="${poetryDto.authorInfo!=null}">
                <h4 style="letter-spacing: 3px">${poetryDto.authorInfo}</h4></c:if>
            <c:if test="${poetryDto.authorInfo==null}">
            <h3>暂无简介</h3>
            </c:if>
            <p>${info.enjoy}</p>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
</div>
</body>
</html>



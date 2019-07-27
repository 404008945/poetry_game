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
    <title>极简诗社</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Website Template by freehtml5.co"/>
    <meta name="keywords"
          content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive"/>
    <meta name="author" content="freehtml5.co"/>

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>
</head>
<body style="background-color: #d7f7f5">

<div class="fh5co-loader"></div>

<div id="page">
    <jsp:include page="nav.jsp"/>
    <div id="fh5co-contact">
        <div class="container">
            <div class="row animate-box" style="margin-top:100px">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                    <c:forEach var="item" items="${poetryArray}">
                        <span class="item" style="text-align:center; font-weight:lighter;font-size: 30px">${item}</span>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
</div>
<script>
    function changeDivWidth() {
        var w = document.documentElement.clientWidth;
        if (w < 500) {
            $(".item").css({'font-size': '19px'})
        } else {
            $(".item").css({'font-size': '30px'})
        }
    }

    changeDivWidth();
</script>
</body>
</html>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>论语</title>
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

<div id="page">
    <jsp:include page="nav.jsp"/>
    <div id="fh5co-portfolio">
        <div class="container">
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                    <h2>${type}</h2>
                    <p>${poetryValue}</p>
                    <button class="btn" onclick="location.reload()">换一批</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="fh5co-portfolio animate-box">
                        <a href="/enjoy/detail_lunyu/${lunyus[0].id}">
                            <div class="portfolio-entry" style="background-color: ${colors[0]}"><h3 style="color: #000;text-align:center;line-height: 300px;">${lunyus[0].chapter}</h3></div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-portfolio animate-box">
                        <a href="/enjoy/detail_lunyu/${lunyus[1].id}">
                            <div class="portfolio-entry" style="background-color: ${colors[1]}"><h3 style="color: #000;text-align:center;line-height: 300px;">${lunyus[1].chapter}</h3></div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-portfolio animate-box">
                        <a href="/enjoy/detail_lunyu/${lunyus[2].id}">
                            <div class="portfolio-entry" style="background-color: ${colors[2]}"><h3 style="color: #000;text-align:center;line-height: 300px;">${lunyus[2].chapter}</h3></div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-portfolio animate-box">
                        <a href="/enjoy/detail_lunyu/${lunyus[3].id}">
                            <div class="portfolio-entry" style="background-color: ${colors[3]}"><h3 style="color: #000;text-align:center;line-height: 300px;">${lunyus[3].chapter}</h3></div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-portfolio animate-box">
                        <a href="/enjoy/detail_lunyu/${lunyus[4].id}">
                            <div class="portfolio-entry" style="background-color: ${colors[4]}"><h3 style="color: #000;text-align:center;line-height: 300px;">${lunyus[4].chapter}</h3></div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-portfolio animate-box">
                        <a href="/enjoy/detail_lunyu/${lunyus[5].id}">
                            <div class="portfolio-entry" style="background-color:${colors[5]}"><h3 style="color: #000;text-align:center;line-height: 300px;">${lunyus[5].chapter}</h3></div>
                        </a>
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

<!-- jQuery -->
<script src="/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="/js/jquery.flexslider-min.js"></script>
<!-- Main -->
<script src="/js/main.js"></script>

</body>
</html>


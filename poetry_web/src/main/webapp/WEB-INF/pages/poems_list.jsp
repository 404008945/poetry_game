<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <a href="/enjoy/detail_poems/${poetry[0].id}">
                            <div class="portfolio-entry" style="background-color: ${colors[0]}">
                                <p style="color: #000;text-align:center;padding-top: 125px;font-size: 25px">${poetry[0].title}</p>
                            </div>
                            <div class="portfolio-text">
                                <h3 style="text-align:center;">作者——${poetry[0].author}</h3>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-portfolio animate-box">
                        <a href="/enjoy/detail_poems/${poetry[1].id}">
                            <div class="portfolio-entry" style="background-color: ${colors[1]}">
                                <p style="color: #000;text-align:center;padding-top: 125px;font-size: 25px">${poetry[1].title}</p>
                            </div>
                            <div class="portfolio-text">
                                <h3 style="text-align:center;">作者——${poetry[1].author}</h3>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-portfolio animate-box">
                        <a href="/enjoy/detail_poems/${poetry[2].id}">
                            <div class="portfolio-entry" style="background-color: ${colors[2]}">
                                <p style="color: #000;text-align:center;padding-top: 125px;font-size: 25px">${poetry[2].title}</p>
                            </div>
                            <div class="portfolio-text">
                                <h3 style="text-align:center;">作者——${poetry[2].author}</h3>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-portfolio animate-box">
                        <a href="/enjoy/detail_poems/${poetry[3].id}">
                            <div class="portfolio-entry" style="background-color: ${colors[3]}">
                                <p style="color: #000;text-align:center;padding-top: 125px;font-size: 25px">${poetry[3].title}</p>
                            </div>
                            <div class="portfolio-text">
                                <h3 style="text-align:center;">作者——${poetry[3].author}</h3>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-portfolio animate-box">
                        <a href="/enjoy/detail_poems/${poetry[4].id}">
                            <div class="portfolio-entry" style="background-color: ${colors[4]}">
                                <p style="color: #000;text-align:center;padding-top: 125px;font-size: 25px">${poetry[4].title}</p>
                            </div>
                            <div class="portfolio-text">
                                <h3 style="text-align:center;">作者——${poetry[4].author}</h3>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="fh5co-portfolio animate-box">
                        <a href="/enjoy/detail_poems/${poetry[5].id}">
                            <div class="portfolio-entry" style="background-color:${colors[5]}">
                                <p style="color: #000;text-align:center;padding-top: 125px;font-size: 25px">${poetry[5].title}</p>
                            </div>
                            <div class="portfolio-text">
                                <h3 style="text-align:center;">作者——${poetry[5].author}</h3>
                            </div>
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
</body>
</html>


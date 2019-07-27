<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>搜索结果</title>
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

</head>
<body style="background-color: #eaf5ff">

<div class="fh5co-loader"></div>

<div id="page">
    <jsp:include page="nav.jsp"/>
    <div id="fh5co-portfolio">
        <div class="container">
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                    <h2>${title}</h2>
                    <p style="text-align: left">${content}</p>
                </div>
            </div>
            <div class="row">
                <c:if test="${pageInfo.list[0]!=null}">
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="/enjoy/detail_poetry/${pageInfo.list[0].id}" style="border-radius: 15px">
                                <div class="portfolio-entry" style="border-radius: 15px;background: url('/images/${colors[0]}.jpg') no-repeat;">
                                    <p style="color: #000;text-align:center;padding-top: 115px;font-size: 25px">${pageInfo.list[0].title}</p>
                                    <c:if test="${likes!=null}">
                                        <p style="color: #000;text-align: center;">相似字符:<span style="color: red">${likes[0]}</span></p>
                                    </c:if>
                                </div>
                                <div class="portfolio-text">
                                    <h3 style="text-align:center;">作者——${pageInfo.list[0].author}</h3>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${pageInfo.list[1]!=null}">
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="/enjoy/detail_poetry/${pageInfo.list[1].id}" style="border-radius: 15px">
                                <div class="portfolio-entry" style="border-radius: 15px;background: url('/images/${colors[1]}.jpg') no-repeat">
                                    <p style="color: #000;text-align:center;padding-top: 115px;font-size: 25px">${pageInfo.list[1].title}</p>
                                    <c:if test="${likes!=null}">
                                        <p style="color: #000;text-align: center;">相似字符:<span style="color: red">${likes[1]}</span></p>
                                    </c:if>
                                </div>
                                <div class="portfolio-text">
                                    <h3 style="text-align:center;">作者——${pageInfo.list[1].author}</h3>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${pageInfo.list[2]!=null}">
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="/enjoy/detail_poetry/${pageInfo.list[2].id}" style="border-radius: 15px">
                                <div class="portfolio-entry" style="border-radius: 15px;background: url('/images/${colors[2]}.jpg') no-repeat">
                                    <p style="color: #000;text-align:center;padding-top: 115px;font-size: 25px">${pageInfo.list[2].title}</p>
                                    <c:if test="${likes!=null}">
                                        <p style="color: #000;text-align: center;">相似字符:<span style="color: red">${likes[2]}</span></p>
                                    </c:if>
                                </div>
                                <div class="portfolio-text">
                                    <h3 style="text-align:center;">作者——${pageInfo.list[2].author}</h3>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${pageInfo.list[3]!=null}">
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="/enjoy/detail_poetry/${pageInfo.list[3].id}" style="border-radius: 15px">
                                <div class="portfolio-entry" style="border-radius: 15px;background: url('/images/${colors[3]}.jpg') no-repeat">
                                    <p style="color: #000;text-align:center;padding-top: 115px;font-size: 25px">${pageInfo.list[3].title}</p>
                                    <c:if test="${likes!=null}">
                                        <p style="color: #000;text-align: center;">相似字符:<span style="color: red">${likes[3]}</span></p>
                                    </c:if>
                                </div>
                                <div class="portfolio-text">
                                    <h3 style="text-align:center;">作者——${pageInfo.list[3].author}</h3>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${pageInfo.list[4]!=null}">
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="/enjoy/detail_poetry/${pageInfo.list[4].id}" style="border-radius: 15px">
                                <div class="portfolio-entry" style="border-radius: 15px;background: url('/images/${colors[4]}.jpg') no-repeat">
                                    <p style="color: #000;text-align:center;padding-top: 115px;font-size: 25px">${pageInfo.list[4].title}</p>
                                    <c:if test="${likes!=null}">
                                        <p style="color: #000;text-align: center;">相似字符:<span style="color: red">${likes[4]}</span></p>
                                    </c:if>
                                </div>                            <div class="portfolio-text">
                                <h3 style="text-align:center;">作者——${pageInfo.list[4].author}</h3>
                            </div>
                            </a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${pageInfo.list[5]!=null}">
                    <div class="col-md-4">
                        <div class="fh5co-portfolio animate-box">
                            <a href="/enjoy/detail_poetry/${pageInfo.list[5].id}" style="border-radius: 15px">
                                <div class="portfolio-entry" style="border-radius: 15px;background: url('/images/${colors[5]}.jpg') no-repeat">
                                    <p style="color: #000;text-align:center;padding-top: 115px;font-size: 25px">${pageInfo.list[5].title}</p>
                                    <c:if test="${likes!=null}">
                                        <p style="color: #000;text-align: center;">相似字符:<span style="color: red">${likes[5]}</span></p>
                                    </c:if>
                                </div>
                                <div class="portfolio-text">
                                    <h3 style="text-align:center;">作者——${pageInfo.list[5].author}</h3>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <div class="center">
        <ul class="pagination">
            <li><a href="/enjoy/search/1">首页</a></li>
            <c:if test="${pageInfo.pageNum==1}">
                <li><a style="pointer-events: none;cursor:default;" href="/enjoy/search/${pageInfo.prePage}">前一页</a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=1}">
                <li><a href="/enjoy/search/${pageInfo.prePage}">前一页</a></li>
            </c:if>
            <li><a href="#">当前页${pageInfo.pageNum}</a></li>
            <li><a href="#">共${pageInfo.pages}页</a></li>
            <c:if test="${pageInfo.pageNum==pageInfo.pages}">
                <li><a style="pointer-events:none;cursor:default;" href="/enjoy/search/${pageInfo.nextPage}">下一页</a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                <li><a  href="/enjoy/search/${pageInfo.nextPage}">下一页</a></li>
            </c:if>
            <li><a href="/enjoy/search/${pageInfo.pages}">尾页</a></li>
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


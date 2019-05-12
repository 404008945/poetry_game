<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>诗词搜索</title>
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
    <style type="text/css">

    </style>
</head>
<div class="fh5co-loader"></div>
<div id="page">
    <jsp:include page="nav.jsp"/>
    <div style="padding-top: 80px" ; class="container">
        <form class="bs-example bs-example-form col-md-offset-2 col-lg-offset-2 col-xl-offset-2"
              action="/choose_enjoy?id=${id}" role="form">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-1">
                    <div style="text-align: center;margin-bottom: 100px"><h1>个性化选择</h1></div>
                    <label for="dynasty">你喜欢哪个朝代的诗</label>
                    <select id="dynasty" name="dynasty" class="form-control input-group"
                            style="margin-bottom: 20px;font-size: 20px">
                        <c:forEach var="item" items="${dynasty}">
                            <option value="${item}">${item}</option>
                        </c:forEach>
                    </select>
                    <label for="type">你喜欢那种类型</label>
                    <select id="type" name="type" class="form-control input-group"
                            style="margin-bottom: 20px;font-size: 20px">
                        <c:forEach var="item" items="${category}">
                            <option value="${item}">${item}</option>
                        </c:forEach>
                    </select>
                    <label for="author">你喜欢哪个作者</label>
                    <select id="author" name="authorId" class="form-control input-group"
                            style="margin-bottom: 20px;font-size: 20px">
                        <c:forEach var="author" items="${authors}">
                            <option value="${author.id}">${author.name}</option>
                        </c:forEach>
                    </select>
                    <div class="col-md-12">
                        <div class="form-group" style="margin-top: 30px;text-align: center">
                            <input type="submit" value="完成" class="btn btn-primary btn-lg">
                        </div>
                    </div>
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 --><br>
    </div><!-- /.row -->
    </form>
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



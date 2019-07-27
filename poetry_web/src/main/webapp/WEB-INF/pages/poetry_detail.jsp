<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/5/005
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>细节</title>
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
    <link href="/css/stylefordetail.css" rel="stylesheet" type="text/css">
</head>

<body style="background: #eaf5ff">

<div class="fh5co-loader"></div>

<div id="page">
    <jsp:include page="nav.jsp"/>

    <div id="fh5co-contact">
        <div class="container">
            <div class="row animate-box">

                <div class="col-md-8  text-center fh5co-heading">
                    <h3 style="font-size: 28px">${poetry.title}</h3>
                    <p><a href="/enjoy/search/1?searchType=0&content=${author.name}">[${poetry.dynasty}] ${author.name}</a></p>
                    <div class="row animate-box">
                        <div class="col-md-8 col-md-offset-2 <c:if test="${type==true}">text-left</c:if> "
                             style="margin-bottom: 0;">
                            <c:forEach var="paragraph" items="${content}">
                                <p style="<c:if
                                        test="${type==true}">text-indent:2em;</c:if>;font-size: 21px; color: #000000">${paragraph} </p>
                            </c:forEach>
                        </div>
                    </div>
                    <c:if test="${sessionScope.user!=null}">
                        <div style="text-align:center;">
                            <c:if test="${flag!=null&&flag==true}">
                                <p style="font-size:66px;  color:#f00; cursor:pointer;">&#10084;</p>
                                <div class="alert alert-danger" style="width: 200px;margin: 0 auto" id="tips">该作品已点赞
                                </div>
                            </c:if>
                            <c:if test="${flag!=null&&flag==false}">
                                <p class="like" style="font-size:66px;  color:#ccc; cursor:pointer">&#10084;</p>
                                <div class="alert alert-danger" style="width: 200px;margin: 0 auto" id="tips">点赞鼓励一下吧
                                </div>
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.user==null}">
                        <div style="text-align:center;">
                            <p id="like" style="font-size:66px;  color:#ccc; cursor:pointer;">&#10084;</p>
                            <div id="login" class="alert alert-danger" style="width: 200px;margin: 0 auto">点赞鼓励一下吧</div>
                        </div>
                    </c:if>
                </div>
                <div class="col-md-4">
                    <ul class="rec" style="font-size: 28px;">
                        相似的诗
                        <s:forEach items="${recommendPoetry}" var="poetry">
                            <li class="rec_li">
                                <a href="/enjoy/detail_poetry/${poetry.id}"><span
                                        class="rec_li_span1">${poetry.title}</span>
                                    <span class="rec_li_span2">${poetry.author}</span>
                                </a>
                            </li>
                        </s:forEach>

                    </ul>
                </div>
            </div>
        </div>
        <div class="container">
            <ul class="nav nav-tabs tab">
                <li class="active" index="0">
                    <a href="#" style="background:#fff5eb">诗词评论</a>
                </li>
                <li index="1">
                    <a href="#">诗词赏析</a></li>
                <li index="2">
                    <a href="#">诗词注释</a></li>
                <li index="3">
                    <a href="#">诗人简介</a>
                </li>
                <li index="4">
                    <a href="#">创作背景</a></li>
            </ul>

            <div class="con">
                <div class="" style="background:#fff5eb">
                    <form role="form" action="/comment/submit" method="post">
                        <div class="form-group">
                            <label style="font-size: 15px;margin-left: 20px;display: inline-block">我也要评论</label>
                            <input type="hidden" name="userId" value="${user.id}">
                            <input type="hidden" name="poetryId" value="${poetry.id}">
                            <textarea class="form-control" name="content" rows="2" required="required"
                                      placeholder="来了就说点什么吧(登录才能评论哦)"></textarea>
                        </div>
                        <div class="form-group" style="margin-bottom: 100px">
                            <button type="submit" style="width: 100px;float: right;" class="btn btn-primary btn-block">
                                提交
                            </button>
                        </div>
                    </form>
                    <c:forEach items="${poetry.commentForPoetry}" var="comment">
                        <div class="media border p-3" style="border: 1px solid #ccc;border-radius: 20px">
                            <div class="media-body" style=" width: 100%;padding: 10px">
                                <img class="img-circle" src="/image/${comment.user.image}" alt="John Doe"
                                     class="mr-3 mt-3 rounded-circle" style="width: 50px;height: 50px">
                                <a style="font-size: 23px;"
                                   href="/user/poetry/${comment.user.id}/1">${comment.user.username}</a>
                                <span style="font-size: 17px;margin-left: 30px"><fmt:formatDate value="${comment.time}"
                                                                                                pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                <c:if test="${comment.userId==sessionScope.user.id||(sessionScope.user!=null&&sessionScope.user.type==1)}"><span
                                        style="font-size: 19px;margin-left: 50px"><a
                                        href="/enjoy/deleteComment/${poetry.id}/${comment.id}"
                                        style="font-size: 17px;">删除</a> </span></c:if>
                                <div style="margin-top: 30px;margin-bottom:30px;text-align: left">
                                    <span>${comment.content}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="hide"
                     style="text-indent:2em; padding: 15px;padding-bottom:70px;border-radius: 15px">${info.enjoy}</div>
                <div class="hide" style="padding: 15px;border-radius: 15px;padding-bottom:70px;">${info.note}</div>
                <div class="hide"
                     style="text-indent:2em;padding: 15px;padding-bottom:70px;border-radius: 15px">${author.intro}</div>
                <div class="hide"
                     style="text-indent:2em;padding: 15px;padding-bottom:70px;border-radius: 15px">${info.background}</div>
            </div>


        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("#like").click(function () {
            $("#login").html("登录才能点赞哦");
        })
        $(".like").click(function () {
            $(this).toggleClass('cs');

            var test = $(this).hasClass('cs');
            if (test == true) {
                $(this).css({color: 'red'});
                $("#tips").html("点赞成功");
            } else {
                $("#tips").html("点赞已取消");
                $(this).css({color: '#ccc'});
            }
            var str = $(this).attr("class");
            var likes = false;
            if (str == 'like cs') {
                likes = true;
            }
            $.ajax({
                url: "${request.contextPath}/comment/dofavor",
                type: "post",
                data: {
                    pid:${poetry.id},
                    like: likes
                },
                success: function (data) {
                    console.log(data);
                }
            });
        })
    })
</script>
<script>
    $(".nav li").click(function () {
        $(this).addClass("active").siblings().removeClass("active");
        $(this).siblings().find("a").css({"background": "#eaf5ff"});
        $(this).find("a").css({"background": "#fff5eb"});

        $(".con>div").eq($(this).attr("index")).removeClass("hide").css({"background": "#fff5eb"}).siblings().addClass("hide").css({"background": "#eaf5ff"});

        return false;
    })

    window.onresize = function () {
        //  alert(1);
        changeDivHeight();
    }

    function changeDivHeight() {
        var w = document.documentElement.clientWidth;//获取页面可见高度

        if (w < 500) {
            $(".tab li").css({width: '100%'});
        } else {
            //  alert(1);
            $(".tab li").css({width: '20%'});
        }
    }

    changeDivHeight();
</script>
<script>


</script>
</html>



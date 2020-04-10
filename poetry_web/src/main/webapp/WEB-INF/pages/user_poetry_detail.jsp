<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/5/005
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>诗词详情</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" href="pinglun.css">
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
        .media li {
            list-style: none;
            float: left;
        }

        .like {
            font-size: 66px;
            color: #ccc;
            cursor: pointer;
        }

        .cs {
            color: #f00;
        }
    </style>

    <link rel="stylesheet" href="/dist/rmodal-no-bootstrap.css" type="text/css" />
    <script type="text/javascript" src="/dist/rmodal.js"></script>
    <script type="text/javascript">
        window.onload = function() {
            var modal = new RModal(document.getElementById('modal'), {
                beforeOpen: function(next) {
                    next();
                }
                , afterOpen: function() {

                }

                , beforeClose: function(next) {

                    next();
                }
                , afterClose: function() {

                }

                // , content: 'Abracadabra'

                // , bodyClass: 'modal-open'
                // , dialogClass: 'modal-dialog-lg'
                // , dialogOpenClass: 'fadeIn'
                // , dialogCloseClass: 'fadeOut'

                // , focus: true
                // , focusElements: ['input.form-control', 'textarea', 'button.btn-primary']

                // , escapeClose: true
            });

            document.addEventListener('keydown', function(ev) {
                modal.keydown(ev);
            }, false);

            document.getElementById('showModal').addEventListener("click", function(ev) {
                ev.preventDefault();
                modal.open();
            }, false);

            window.modal = modal;
        }
    </script>

</head>
<body style="background-color: #e9e4e6">

<div class="fh5co-loader"></div>

<div id="page">
    <jsp:include page="nav.jsp"/>
    <div id="fh5co-contact">
        <div class="container">
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                    <h2>${poetryDto.title}</h2>
                    <a style="font-size: 23px;" href="/user/poetry/${userId}/1">${poetryDto.author}</a>
                    <c:if test="${sessionScope.user!=null&&poetryDto.author!=sessionScope.user.username&&!isFriend}">
                        <div style="text-align: center;">
                            <c:if test="${msg==null}">
                                <a style="margin-top: 10px" href="/friend/add?account=${user.account}" class="btn btn-success btn-sm" id="showModal">添加对方为好友</a>
                            </c:if>
                            <c:if test="${msg!=null}">
                                <button style="margin-top: 10px" class="btn btn-success btn-sm" disabled>请求消息已发送</button>
                            </c:if>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row animate-box">
                <div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
                    <c:forEach var="item" items="${poetryDto.poetryArray}">
                        <span style="font-size: 30px;text-align: center">${item}</span>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="container">
            <c:if test="${sessionScope.user!=null}">
                <div style="text-align:center;">
                    <c:if test="${flag!=null&&flag==true}">
                        <p style="font-size:66px;  color:#f00; cursor:pointer;">&#10084;</p>
                        <div class="alert alert-danger" style="width: 200px;margin: 0 auto" id="tips">该作品已点赞</div>
                    </c:if>
                    <c:if test="${flag!=null&&flag==false}">
                        <p class="like">&#10084;</p>
                        <div class="alert alert-danger" style="width: 200px;margin: 0 auto" id="tips">点赞鼓励一下吧</div>
                    </c:if>
                </div>
            </c:if>
            <c:if test="${sessionScope.user==null}">
                <div style="text-align:center;">
                    <p id="like" style="font-size:66px;  color:#ccc; cursor:pointer;">&#10084;</p>
                    <div id="login" class="alert alert-danger" style="width: 200px;margin: 0 auto">点赞鼓励一下吧</div>
                </div>
            </c:if>
            <div class="container mt-3">
                <h2>用户评论</h2>
                <form role="form" action="/user/comment/${poetryId}" method="post">
                    <div class="form-group">
                        <label style="font-size: 15px">我也要评论</label>
                        <textarea class="form-control" name="comment" rows="6" required="required"
                                  placeholder="来了就说点什么吧(登录才能评论哦)"></textarea>
                    </div>
                    <div class="form-group" style="margin-bottom: 100px">
                        <button type="submit" style="width: 100px;float: right;" class="btn btn-primary btn-block">提交
                        </button>
                    </div>
                </form>
                <c:forEach var="dto" items="${commentDto}">
                    <div class="media border p-3" style="border: 2px solid #a1a1a1;border-radius: 20px">
                        <div class="media-body" style="width: 100%">
                            <img src="/image/${dto.user.image}" alt="John Doe" class="mr-3 mt-3 rounded-circle"
                                 style="width: 50px;height: 50px">
                            <a style="font-size: 23px;" href="/user/poetry/${dto.user.id}/1">${dto.user.username}</a>
                            <span style="font-size: 17px;margin-left: 30px"><fmt:formatDate value="${dto.comment.time}"
                                                                                            pattern="yyyy-MM-dd HH:mm:ss"/></span>
                            <c:if test="${dto.comment.userId==sessionScope.user.id||(sessionScope.user!=null&&sessionScope.user.type==1)}"><span
                                    style="font-size: 19px;margin-left: 50px"><a
                                    href="/user/comment/delete/${dto.comment.id}"
                                    style="font-size: 17px;">删除</a> </span></c:if>
                            <div style="margin-top: 30px;margin-bottom:30px;text-align: left">
                                <span>${dto.comment.content}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>

    <div class="gototop js-top">
        <a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
    </div>
    <script type="text/javascript">
        $(".fh5co-nav").css({'background-color': '#d8cbbb'})
        $(function () {
            $("#like").click(function () {
                $("#login").html("登录才能点赞哦");
            })

            $(".like").click(function () {
                $(this).toggleClass('cs');
                var test = $(this).hasClass('cs');
                if (test == true) {
                    $("#tips").html("点赞成功");
                } else {
                    $("#tips").html("点赞已取消");
                }

                var str = $(this).attr("class");
                var likes = false;
                if (str == 'like cs') {
                    likes = true;
                }
                $.ajax({
                    url: "${request.contextPath}/user/likes",
                    type: "post",
                    data: {
                        poetryId:${poetryId},
                        likes: likes
                    },
                    success: function (data) {

                    }
                });
            })
        })
    </script>
</div>

<!--模态窗口-->
<div id="modal" class="modal">
    <div class="modal-dialog animated">
        <div class="modal-content">
            <form class="form-horizontal" method="get" action="/friend/add">
                <div class="modal-header">
                    <strong>请输入验证消息</strong>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label for="dummyText" style="font-size: 13px" class="control-label col-xs-4">告诉好友你的身份吧~</label>
                        <div class="input-group col-xs-7">
                            <input type="text" required="required" style="font-size: 15px" value="我是${sessionScope.user.username}，让我们成为朋友吧~" name="message" id="dummyText" class="form-control" />
                            <input type="hidden" name="account" value="${account1}"/>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-default" type="button" onclick="modal.close();">取消</button>
                    <button class="btn btn-primary" type="submit" onclick="modal.close();">发送请求</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>





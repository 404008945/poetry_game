<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getSession().getAttribute("user") == null) {//添加session
        response.sendRedirect("/loginPage");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/bs/css/bootstrap.css">
    <link rel="stylesheet" href="/css/styleformain.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <script src="/bs/js/jquery.min.js"></script>
    <script src="/bs/js/bootstrap.js"></script>
    <title>诗词游戏</title>
</head>
<body style="background: #eaf5ff">
<jsp:include page="nav.jsp"/>
<div class="container">
    <div class="user">
        <img src="/image/${user.image}"/>
        <p class="text-info name">${user.username}</p>
        <dic class="row">
            <div class="col-xs-6 win">
                <p class="num">${user.winNumber}</p>
                <p class="ans">WIN</p>
            </div>
            <div class="col-xs-6 lose">
                <p class="num">${user.totalNumber-user.winNumber}</p>
                <p class="ans">LOSE</p>
            </div>
        </dic>
    </div>
    <a href="${request.getContextPath()}/question/play" class="start text-primary"><span
            class="glyphicon glyphicon-play-circle"></span></a>
    <p class="text-info tip">开始游戏</p>
    <p class="text-center text-info">当前在线人数:<span class="text-danger">${count}</span></p>
    <p class="text-danger start-tip" style="text-align: center;"><span class="label label-info">游戏说明</span>玩家点击开始游戏，将自动开始匹配，匹配到对手自动开始游戏，游戏采取计分制，两位玩家同时答题，每一题用时较少将获得更多的积分，最终分积分高者获胜
    </p>
</div>
</body>
</html>

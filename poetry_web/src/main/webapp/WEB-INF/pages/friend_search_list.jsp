<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/26/026
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>搜索结果</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcss.com/animate.css/3.5.2/animate.min.css">

    <link rel="stylesheet" href="/dist/rmodal-no-bootstrap.css" type="text/css" />
    <script type="text/javascript" src="/dist/rmodal.js"></script>
    <script type="text/javascript">
        window.onload = function() {
            var modal = new RModal(document.getElementById('modal'), {
                beforeOpen: function(next) {
                    console.log('beforeOpen');
                    next();
                }
                , afterOpen: function() {
                    console.log('opened');
                }

                , beforeClose: function(next) {
                    console.log('beforeClose');
                    next();
                }
                , afterClose: function() {
                    console.log('closed');
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
<body style="background-color: #eaf5ff">
<table class="table table-bordered" style="width: 70%;text-align:center;margin-left: 15%;margin-top: 150px;font-size: 17px">
    <h2 style="text-align:center;margin-top:100px">搜索结果</h2>
    <thead>
    <tr>
        <th style="text-align:center;">账户</th>
        <th style="text-align:center;">昵称</th>
        <th style="text-align:center;">电子邮箱</th>
        <th style="text-align:center;">操作</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><a href="/user/poetry/${user.id}/1" style="cursor: pointer;">${user.account}</a></td>
        <td>${user.username}</td>
        <td>${user.email}</td>
        <c:if test="${msg!=null}">
            <td style="color: #e14b7e">${msg}</td>
        </c:if>
        <c:if test="${msg==null}">
            <td><a href="/friend/add?account=${user.account}" style="cursor: pointer;" id="showModal">添加该好友</a></td>
        </c:if>
    </tr>
    </tbody>
</table>

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
                        <label for="dummyText" class="control-label col-xs-4">告诉好友你的身份吧~</label>
                        <div class="input-group col-xs-7">
                            <input type="text" required="required" value="我是${sessionScope.user.username}，一个诗词爱好者，让我们成为朋友吧~" name="message" id="dummyText" class="form-control" />
                            <input type="hidden" name="account" value="${user.account}"/>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-default" type="button" onclick="modal.close();">取消</button>
                    <button class="btn btn-primary" type="submit" onclick="modal.close();">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>

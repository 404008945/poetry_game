<%@ page language="java" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html>
 <head>
         <title>Java后端WebSocket的Tomcat实现</title>
     </head>
 <body>
 <h1>欢迎进入聊天室</h1>
     <br/><input id="text" style="margin-bottom: 30px" type="text" placeholder="请输入要发送的消息"/>
     <button onclick="send()" style="margin-bottom: 30px">发送</button><br>
     <button onclick="closeWebSocket()" style="margin-bottom: 30px">关闭连接</button>
     <div id="message"></div>
 </body>
 <script type="text/javascript">
         var websocket = null;
         //判断当前浏览器是否支持WebSocket
         if ('WebSocket' in window) {
                 websocket = new WebSocket("ws://localhost:8080/hello");
             }
         else {
                 alert('当前浏览器 Not support websocket')
             }
    
         //连接发生错误的回调方法
         websocket.onerror = function () {
                 setMessageInnerHTML("WebSocket连接发生错误");
             };
    
         //连接成功建立的回调方法
         websocket.onopen = function () {
                 setMessageInnerHTML("WebSocket连接成功");
             }
    
         //接收到消息的回调方法
         websocket.onmessage = function (event) {
                 setMessageInnerHTML(event.data);
             }
    
         //连接关闭的回调方法
         websocket.onclose = function () {
                 setMessageInnerHTML("WebSocket连接关闭");
             }
    
         //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
         window.onbeforeunload = function () {
                 closeWebSocket();
             }
    
         //将消息显示在网页上
         function setMessageInnerHTML(innerHTML) {
                 document.getElementById('message').innerHTML += innerHTML + '<br/>';
             }
    
         //关闭WebSocket连接
         function closeWebSocket() {
                 websocket.close();
             }
    
         //发送消息
         function send() {
                 var message = document.getElementById('text').value;
                 websocket.send(message);
             }
     </script>
 </html>
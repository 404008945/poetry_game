package com.poetry.websocket;

import com.poetry.entity.User;
import com.poetry.game.GameControll;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import javax.servlet.http.HttpSession;
import java.util.Map;
public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor {
    @Autowired
    private GameControll gameControll;    //此类会触发游戏控制类的一些操作
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        System.out.println("握手前");
        ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
        HttpSession session = servletRequest.getServletRequest().getSession(false);
        User user;
        if(session!=null) {
           user= (User) session.getAttribute("user");
            System.out.println(user.getId());
            attributes.put("user",user);
        }
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
        System.out.println("握手后");
        super.afterHandshake(request, response, wsHandler, ex);
    }
}

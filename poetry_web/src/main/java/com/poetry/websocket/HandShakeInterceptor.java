package com.poetry.websocket;

import com.poetry.entity.User;
import com.poetry.game.GameControll;
import com.poetry.game.OnlineUserOperator;
import com.poetry.game.Player;
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

    @Autowired
    private OnlineUserOperator  onlineUserOperator;
    /**
     *
     完成获取session中的user 并且传入websocket中的session中
     */
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        System.out.println(gameControll);
        System.out.println("握手前");
        ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
        HttpSession session = servletRequest.getServletRequest().getSession(false);
        User user=null;
        if(session!=null) {
           user= (User) session.getAttribute("user");
            System.out.println(user.getId());
            attributes.put("user",user);
        }
      //所有进来的用户都要加入在线集合
        int idx=onlineUserOperator.isExists(user);
        if(idx==-1)
        {
            //加入集合
            Player player=new Player();
            player.setUser(user);
            onlineUserOperator.add(player);//新用户上线  //需要通知
        }

        //在这里人数统计
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
        System.out.println("握手后");
        super.afterHandshake(request, response, wsHandler, ex);
    }
}

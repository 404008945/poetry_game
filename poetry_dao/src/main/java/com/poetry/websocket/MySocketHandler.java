package com.poetry.websocket;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.concurrent.CopyOnWriteArraySet;

public class MySocketHandler extends TextWebSocketHandler {

    //线上人数
    private static int count;
    private static CopyOnWriteArraySet<WebSocketSession> set=new CopyOnWriteArraySet();
    private WebSocketSession session;

    //确立连接后
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        this.session=session;
        try{
            //添加session
            set.add(session);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        //添加人数
        addCount();
        System.out.println("目前连接人数:"+getOnlineCount());
    }

    //处理信息
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        System.out.println("sessionId:"+session.getId()+","+"message:"+message.getPayload());
        for(WebSocketSession webSocketSession:set)
        {
            try{
                //发送消息
                webSocketSession.sendMessage(message);
            }catch (Exception e)
            {
                e.printStackTrace();
            }
        }
    }

    //断开连接后
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        this.session=session;
        try{
            //移除session
            set.remove(session);
        }catch (Exception e) {
            e.printStackTrace();
        }
        subCount();
        System.out.println("目前连接人数:"+getOnlineCount());
    }

    //获取线上人数
    private static int getOnlineCount()
    {
        return count;
    }

    //上线
    private static void addCount()
    {
        count++;
    }

    //下线
    private static void subCount()
    {
        count--;
    }
}

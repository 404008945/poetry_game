package com.poetry.websocket;


import com.poetry.entity.User;
import com.poetry.game.GameControll;
import com.poetry.game.OnlineUserOperator;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.List;

public class OnlineSocketHandler extends TextWebSocketHandler {   // handler需要拿到单例游戏类
    @Autowired
    private GameControll gameControll;    //此类会触发游戏控制类的一些操作
    @Autowired
    private OnlineUserOperator onlineUserOperator;
    //线上人数
    private static int count;
    private static List<WebSocketSession> set = new ArrayList<WebSocketSession>();
    private WebSocketSession session;
    //确立连接后
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        User user = (User) session.getAttributes().get("user");
        //每次都进行sesssion的刷新
        int index = onlineUserOperator.isExists(user);
        //进行session刷新
        onlineUserOperator.get(user.getAccount()).setSession(session);//刷新session   保证了即使用户刷新网页连接不会断掉
        onlineUserOperator.updateMyUsers(user.getAccount());
        onlineUserOperator.get(user.getAccount()).addCount();
    }
    //处理收到的客户信息，客户端请求时需要带上用户的信息
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        JSONObject json = JSONObject.fromObject(message.getPayload());

        if (json.getString("req").equals("update"))//更新用户信息
        {
            String fromAcc = json.getString("from_acc");
            onlineUserOperator.updateFriends(fromAcc);//只更新他的好友才对
        }
        if (json.getString("req").equals("invite")) {//邀请  判断是否满足邀请条件
            String fromAcc = json.getString("from_acc");
            String toAcc = json.getString("to_acc");
            onlineUserOperator.invite(fromAcc, toAcc);
        }
        if (json.getString("req").equals("accept"))//同样需要邀请和被邀请者的信息
        {
            String fromAcc = json.getString("from_acc");
            String toAcc = json.getString("to_acc");
            onlineUserOperator.start(fromAcc, toAcc);
        }
        if(json.getString("req").equals("message"))
        {
            String fromAcc = json.getString("from_acc");
            String toAcc = json.getString("to_acc");
            String content = json.getString("content");
            onlineUserOperator.sengMessage(fromAcc,toAcc,content);
        }

        //根据客户端请求获取信息
    }

    public void sendMessageToUser(int idx, WebSocketMessage<String> message) throws Exception {
        set.get(idx).sendMessage(message);//就是通过session发送的数据
    }

    //断开连接后
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        this.session = session;
        try {
            //移除session
            set.remove(session);
        } catch (Exception e) {
            e.printStackTrace();
        }
        synchronized (onlineUserOperator.getOnlineUsers()) {
            onlineUserOperator.removeUser(session);//掉线只清除自己不清除别人
        }
        subCount();

    }

    //获取线上人数
    private static int getOnlineCount() {
        return count;
    }

    //上线
    private static void addCount() {
        count++;
    }

    //下线
    private static void subCount() {
        count--;
    }

    public static int getCount() {
        return count;
    }
}

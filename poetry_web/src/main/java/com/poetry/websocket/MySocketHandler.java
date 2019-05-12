package com.poetry.websocket;


import com.poetry.entity.User;
import com.poetry.game.GameControll;
import com.poetry.game.Player;
import net.sf.json.JSONObject;
import org.aspectj.apache.bcel.util.Play;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import java.util.*;

public class MySocketHandler extends TextWebSocketHandler {   // handler需要拿到单例游戏类
    @Autowired
    private GameControll gameControll;    //此类会触发游戏控制类的一些操作
    //线上人数
    private static int count;
    private static List<WebSocketSession> set = new ArrayList<WebSocketSession>();
    private WebSocketSession session;

    //确立连接后`
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        User user = (User) session.getAttributes().get("user");
        System.out.println(user);
        try {
            boolean exits = false;
            for (int i = 0; i < gameControll.getRooms().size(); i++) {
                for (int j = 0; j < gameControll.getRooms().get(i).getPlayers().length; j++) {
                    if (gameControll.getRooms().get(i).getPlayers()[j].getUser().getId() == user.getId()) {
                        System.out.println("找到匹配的了   " + user.getId());
                        gameControll.getRooms().get(i).reconnect(j, session);
                        exits = true;
                        break;
                    }
                }
            }
            if (!exits) {
                Player plyer = new Player();
                plyer.setName("小鱼儿");//新连接创立时创建新用户的情况
                plyer.setSession(session);
                plyer.setUser(user);//间接从httpSession中得到的user对象
                this.gameControll.addPlayer1(plyer);
            }
            //添加进入等待游戏的队列
        } catch (Exception e) {
            e.printStackTrace();
        }
        //添加人数
        addCount();
        System.out.println("目前连接人数:" + getOnlineCount());
    }

    //处理信息
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        System.out.println("sessionId:" + session.getId() + "," + "message:" + message.getPayload());
        JSONObject jsonObject = JSONObject.fromObject(message.getPayload());
        this.gameControll.getRooms().get(jsonObject.getInt("roomIdx")).receiveMessage(jsonObject);
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
        subCount();
        System.out.println("目前连接人数:" + getOnlineCount());
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

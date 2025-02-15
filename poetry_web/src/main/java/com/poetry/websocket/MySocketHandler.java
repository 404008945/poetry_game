package com.poetry.websocket;


import com.poetry.entity.User;
import com.poetry.game.GameControll;
import com.poetry.game.OnlineUserOperator;
import com.poetry.game.Player;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.List;

public class MySocketHandler extends TextWebSocketHandler {   // handler需要拿到单例游戏类
    @Autowired
    private GameControll gameControll;    //此类会触发游戏控制类的一些操作
    //线上人数
    @Autowired
    private OnlineUserOperator onlineUserOperator;
    private static int count;
    private static List<WebSocketSession> set = new ArrayList<WebSocketSession>();
    private WebSocketSession session;
    //确立连接后
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        User user = (User) session.getAttributes().get("user");
        onlineUserOperator.get(user.getAccount()).addCount();//不管怎么样都要更新
        onlineUserOperator.get(user.getAccount()).setSession(session);
        onlineUserOperator.updateMyUsers(user.getAccount());
        //所有用户都需要加入到在线队列中
        try {
            boolean exits = false;
            for (int i = 0; i < gameControll.getRooms().size(); i++) {
                for (int j = 0; j < gameControll.getRooms().get(i).getPlayers().length; j++) {
                    if (gameControll.getRooms().get(i).getPlayers()[j].getUser().getId() == user.getId()) {
                  //      System.out.println("找到匹配的了   " + user.getId());
                        gameControll.getRooms().get(i).reconnect(j, session);
                        exits = true;
                        break;
                    }
                }
            }

            if (!exits) {
                //根据user从全部玩家中获取到piayer
                //无论如何  用户都在在线的集合中
                int index = onlineUserOperator.isExists(user);
                Player plyer = onlineUserOperator.get(user.getAccount());//再也不用重新设置player  只需要重新刷新session即可
                plyer.setName("小鱼儿");//新连接创立时创建新用户的情况
                plyer.setSession(session);
                plyer.setUser(user);//间接从httpSession中得到的user对象
                this.gameControll.addPlayer1(plyer); //添加用户到队列中
            }

            //添加进入等待游戏的队列
        } catch (Exception e) {
            e.printStackTrace();
        }

        //添加人数
        addCount();
    }

    //处理信息
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
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

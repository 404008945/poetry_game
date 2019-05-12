package com.poetry.game;

import com.poetry.entity.User;
import net.sf.json.JSONObject;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
public class Player {
    private  int id;//User  id唯一标识
    private String name;
    private int score;//玩家分数
    private User user;//与用户关联
    private  boolean isPlaying;
    private  int choice=-1;   //-1代表不做任何限制
    private  GameControll gameControll;

    public Player(){   //此时需要开启一个线程计时20秒  过20秒后 若仍未开始游戏，则退出队列
        new Thread(new Runnable() {
            @Override
            public void run() {

                System.out.println("玩家创建");
                try {
                    Thread.sleep(20000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println("发生了什么");
                if(!isPlaying)
                {
                    System.out.println("玩家消亡");
                    JSONObject json =new JSONObject();
                    json.put("timeOut","true");//告诉客户端   匹配超时
                    Player.this.sendMessage(json.toString());
                    gameControll.removePlayer(Player.this);     //退出等待队列
                }

            }
        }).start();
    }
    private WebSocketSession session;//用户根据序号拿到自己的session  可以通过玩家对象向客户端发送数据
    public int getId() {
        return id;
    }



    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public WebSocketSession getSession() {
        return session;
    }

    public void setSession(WebSocketSession session) {
        this.session = session;
    }

    public void sendMessage(String message)  {

        TextMessage msg=new TextMessage(message);
   try {
       if(session.isOpen())
       this.session.sendMessage(msg);//用户向自己的的浏览器发送消息
   }catch (IOException e)
   {
    e.printStackTrace();
   }

    }

    public boolean isPlaying() {
        return isPlaying;
    }

    public void setPlaying(boolean playing) {
        isPlaying = playing;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getChoice() {
        return choice;
    }

    public void setChoice(int choice) {
        this.choice = choice;
    }

    public GameControll getGameControll() {
        return gameControll;
    }

    public void setGameControll(GameControll gameControll) {
        this.gameControll = gameControll;
    }
}


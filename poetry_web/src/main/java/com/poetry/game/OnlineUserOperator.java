package com.poetry.game;

import com.poetry.entity.User;
import com.poetry.service.FriendService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.WebSocketSession;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

//需要做一个单例出来
@Controller
public class OnlineUserOperator {//更改集合
    @Autowired
    private FriendService friendService;
    private Map<String, Player> onlineUsers = new Hashtable<>(); //存放在线用户   用户对象中需要封装 socket的session
    @Autowired
    private GameControll gameControll;
    public List<User> getOnlineUsers() {
        List<User> users = new ArrayList<>();
        for (Map.Entry<String, Player> m : onlineUsers.entrySet()) {
            users.add(m.getValue().getUser());
        }
        return users;
    }
    public void setOnlineUsers(Map<String, Player> onlineUsers) {
        this.onlineUsers = onlineUsers;
    }
    //判断user是否在集合中
    public int isExists(User u) {//不存在则进行添加   存在则进行刷新session操作
        if (onlineUsers.containsKey(u.getAccount()))
            return 1;//找到了
        return -1;//不存在这个用户，，需要添加
    }
    public void add(Player player) {
        onlineUsers.put(player.getUser().getAccount(), player);
       // updateMyUsers(player.getUser().getAccount());//这个时候还没有报错
        //通知他的所有所有好友刷新在线用户
    }

    public Player get(String acc) {
        return onlineUsers.get(acc);
    }

    public void sendToUser(User user, String msg) {
        onlineUsers.get(user.getAccount()).sendMessage(msg);
    }

    public void sendToUser(String acc, String msg) {

        if( onlineUsers.get(acc)==null|| !onlineUsers.get(acc).getSession().isOpen())
            return;
        onlineUsers.get(acc).sendMessage(msg);
    }
    public int getOnlineCount() {
        return onlineUsers.size();
    }
    public  void  start(String from,String to){
        //p2直接进入游戏   p1收到通知
        Player p1=onlineUsers.get(from);
        Player p2=onlineUsers.get(to);
        p1.setGameControll(gameControll);
        p2.setGameControll(gameControll);
        p1.getInvite().setP2(p2);//游戏已经开始
    }
    public void updateUsers() {//清除已经离线的用户
//需要标记  标记为更新好友
        List<User> players = new ArrayList<>();
        for (Map.Entry<String, Player> m : onlineUsers.entrySet()) {
            if (!m.getValue().getSession().isOpen()) {
                players.add(m.getValue().getUser());
            }//
        }
        //导致刷新网页，状态无法保持
        for (int i = 0; i < players.size(); i++) {//不在线的用户
            onlineUsers.remove(players.get(i).getAccount());
            updateMyUsers(players.get(i).getAccount());
        }
        //根据已经掉线用户去通知他自己的好友 //让他的好友进行好友列表刷新  目前就是全部更新
        //每次更新时 向他的在线好友好友发送更新信息
    }

    public  void  removeUser(WebSocketSession session){
        String acc="";
        for (Map.Entry<String, Player> m : onlineUsers.entrySet()) {
            if(m.getValue().getSession()==session)
            {
                        acc=m.getKey();
            }
        }
        //不能立即被清除    不然导致  数据丢失延时8秒处理  利用player进行计数
        int  c=onlineUsers.get(acc).getCount();
        try {
            Thread.sleep(30000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        if(onlineUsers.get(acc).getCount()==c) {

            onlineUsers.remove(acc);//先remove在update
            updateMyUsers(acc);//通知他的好友
        }

    }
    public void updateAllUsers() {
        for (Map.Entry<String, Player> m : onlineUsers.entrySet()) {
            updateFriends(m.getKey());
        }
    }

    public  void sengMessage(String from ,String to,String content){
        Player p1=onlineUsers.get(from);
        Player p2=onlineUsers.get(to);
        JSONObject json=new JSONObject();
        json.put("op","message");

        json.put("from_name",p1.getUser().getUsername());
        json.put("content",content);

        p2.sendMessage(json.toString());

    }

    public  void invite(String from,String to){
     Player p1=onlineUsers.get(from);
        Player p2=onlineUsers.get(to);

        JSONObject json=new JSONObject();
        //p1 或者 p2
     if((p1.getInvite()!=null&&!p1.getInvite().isFlag())||p1.isPlaying()||p2.isPlaying()||(p2.getInvite()!=null&&!p2.getInvite().isFlag())||p1.isGameing()||p2.isGameing())
     {

         //正在游戏的无法进行邀请
    json.put("op","failure");
    json.put("msg","对方当前正在游戏或者您刚刚邀请了别人，暂时不能进行邀请操作");
    p1.sendMessage(json.toString());
    return;
     }
        json.put("op","invite");
        json.put("from_name",p1.getUser().getUsername());//被邀请
        json.put("from_acc",p1.getUser().getAccount());
        p2.sendMessage(json.toString());//发送消息问p2是否同意
        p1.setInvite(new Invite(p1));//p1等待p2
        //每次都新建Invite对象
    }
    //    public  List<User> getOnlineFriend(String acc){
//
//        List<User>
//
//
//    }
    public void updateFriends(String acc) {
        //生成JSON数据   需要知道每个好友的account 什么格式发送
        //目前是所有在线用户  需要整合好友
        List<User> users = friendService.getFriends(acc);
        JSONObject json = new JSONObject();
        json.put("op", "update");
        String str = "";
        for (int i = 0; i < users.size(); i++) {
            if (onlineUsers.containsKey(users.get(i).getAccount())) {
                User u = users.get(i);
                if(onlineUsers.get(u.getAccount()).isGameing())
                str += u.getUsername() + "|" + u.getAccount() + "|"+u.getImage()+"|正在游戏,";
                else{
                    str+=u.getUsername() + "|" + u.getAccount() + "|"+u.getImage()+"|邀请,";
                }
            }
        }
      ///System.out.println(users.size());
        //好友中的在线好友显示
//          for (Map.Entry<String, Player> m : onlineUsers.entrySet()) {
//
//
//          }
        if (!str.equals("")) {
            str = str.substring(0, str.length() - 1);
        }

        //对str的所有在线好友发送这个消息
        json.put("data", str);
        sendToUser(acc, json.toString());

    }
    public   void updateMyUsers(String acc){

         List<User> users=friendService.getFriends(acc);
     //上线需要通知我自己的好友
         for(int i=0;i<users.size();i++)
         {
             updateFriends(users.get(i).getAccount());
         }

         if(onlineUsers.containsKey(acc))
         {
             updateFriends(acc);
         }
    }
    //邀请好友      标记邀请成功和邀请失败，，成功则分配房间号，让房间跑起来，用户只需要进入游戏即可
}

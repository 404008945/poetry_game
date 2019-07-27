package com.poetry.game;

import com.poetry.entity.User;
import com.poetry.service.FriendService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

//需要做一个单例出来
@Controller
public class OnlineUserOperator {//更改集合
    @Autowired
    private FriendService friendService;
    private Map<String, Player> onlineUsers = new Hashtable<>(); //存放在线用户   用户对象中需要封装 socket的session

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
    }

    public Player get(String acc) {
        return onlineUsers.get(acc);
    }

    public void sendToUser(User user, String msg) {
        onlineUsers.get(user.getAccount()).sendMessage(msg);
    }

    public void sendToUser(String acc, String msg) {
        System.out.println(msg + "hello");
        onlineUsers.get(acc).sendMessage(msg);
    }

    public int getOnlineCount() {
        return onlineUsers.size();
    }

    public void updateUsers() {//清除已经离线的用户
//需要标记  标记为更新好友
        List<User> players = new ArrayList<>();
        for (Map.Entry<String, Player> m : onlineUsers.entrySet()) {
            if (!m.getValue().getSession().isOpen()) {
                players.add(m.getValue().getUser());
            }
        }
        for (int i = 0; i < players.size(); i++) {
            onlineUsers.remove(players.get(i).getAccount());
        }
        System.out.println("当前集合size" + players.size());
        updateAllUsers();
        //根据已经掉线用户去通知他自己的好友 //让他的好友进行好友列表刷新  目前就是全部更新
        //每次更新时 向他的在线好友好友发送更新信息
    }

    public void updateAllUsers() {
        for (Map.Entry<String, Player> m : onlineUsers.entrySet()) {
            updateFriends(m.getKey());
        }
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
                str += u.getUsername() + "|" + u.getAccount() + ",";
            }
        }
        //好友中的在线好友显示
//          for (Map.Entry<String, Player> m : onlineUsers.entrySet()) {
//
//
//          }
        if (!str.equals("")) {
            str = str.substring(0, str.length() - 1);
        }
        System.out.println(str);
        json.put("data", str);
        sendToUser(acc, json.toString());
    }
}

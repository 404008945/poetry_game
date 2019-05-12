package com.poetry.game;

import com.poetry.dao.UserDao;
import com.poetry.service.QuestionService;
import com.poetry.service.UserService;
import com.poetry.service.impl.QuestionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Controller
@Scope("singleton")
public class GameControll {//这是一个单例类
    @Autowired
    private QuestionService questionService;
    @Autowired
    private UserService userService;
    private List<Room> rooms;
    private LinkedList<Player> players1;   //诗词竞赛玩家排队队列
    private LinkedList<Player> players2;   //飞花令玩家排队队列
    public  GameControll(){
        System.out.println("执行了");
        players1=new LinkedList<Player>();
        players2=new LinkedList<Player>();
        rooms =new ArrayList<Room>();
    }
    public void sendMessageToALLUser(){
    System.out.println("发送数据"+players1.size());
        for(int i=0;i<players1.size();i++)
        {
            System.out.println( players1.get(i).getSession());
            players1.get(i).sendMessage("{'data':'helloWorld'}");  //向用户发送消息

        }

    }
    public void addPlayer1(Player player){
        //检测用户是否在队列中，如果在，刷新session即可
        for (Player p:players1) {
            if(p.getUser().getId()==player.getUser().getId())
            {
                p.setSession(player.getSession());
                return ;
            }
        }
        player.setGameControll(this);
        players1.offer(player);//用户来到匹配页面就加入
      while(players1.size()>=2)
      {//新建房间
          Player p1=players1.poll();
          Player p2=players1.poll();
          p1.setPlaying(true);//已经开始游戏设计标记
          p2.setPlaying(true);
          rooms.add(new Room(p1,p2,0,rooms.size(),questionService.selectByRandom(),this,userService));//加入房间通知用户匹配成功
        }
      if(players1.size()==1)
      {
          players1.get(0).sendMessage("{'matching':'true'}");
      }

        sendMessageToALLUser();

    }
    public void claearRoom(int roomIdx){
     this.getRooms().set(roomIdx,null);
        int n=getRooms().size()-1;
        while (n>=0&&this.getRooms().get(n)==null)//删除尾部连续的null 节省空间
        {
            this.getRooms().remove(n);
            n--;
        }
    }

    public void removePlayer(Player player){

        if(players1.contains(player))
        {
            players1.remove(player);
        }
    }
    public List<Room> getRooms() {
        return rooms;
    }

    public void setRooms(List<Room> rooms) {
        this.rooms = rooms;
    }

    public LinkedList<Player> getPlayers1() {
        return players1;
    }

    public void setPlayers1(LinkedList<Player> players1) {
        this.players1 = players1;
    }

    public LinkedList<Player> getPlayers2() {
        return players2;
    }

    public void setPlayers2(LinkedList<Player> players2) {
        this.players2 = players2;
    }


    public QuestionService getQuestionService() {
        return questionService;
    }
    public void setQuestionService(QuestionService questionService) {
        this.questionService = questionService;
    }
    public UserService getUserDao() {
        return userService;
    }
    public void setUserDao(UserService userDao) {
        this.userService = userDao;
    }
}

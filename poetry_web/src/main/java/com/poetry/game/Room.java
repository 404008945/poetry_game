package com.poetry.game;

import com.poetry.entity.Question;
import com.poetry.service.UserService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketSession;

import java.util.Date;
import java.util.List;
//注册成Bean
public class Room {//生成房间时把问题也加载进去
    //四题分发完毕后  游戏结束
    private UserService userService;
    private int id;
    private  GameControll gameControll;
    private List<Question> questions;    //一个房间有10道题目
    private Player players[]=new Player[2];
    //一个房间有两个player   玩家队列玩家>=2拿出两个玩家加入房间  通过idx访问
  /*  int  gameType;   //0为诗词上下句， 1为飞花令*/
   private  int questionNum;//问题序号  共有4题   类型已经约定  前两题诗词上下句  后两题诗词填空
    //暂时只测试第一题
   private   int  winNum;//获胜玩家
     private  int roomIdx;
     private Date date;   //发题时间
    private  int count;
    public  Room(){//无惨 注册bean

    }
    public void sendGame1Problem(){
        players[0].setChoice(-1);
        players[1].setChoice(-1);;
        questionNum++;
        if(questionNum>10)//一共有10题
        {
            int p0=0,p1=0;
            if(players[0].getScore()>players[1].getScore()) {
                winNum = 0;
                p0=1;
            }
            else if(players[0].getScore()<players[1].getScore())
            {
                winNum = 1;
                p1=1;
            }
            else
            {
                winNum=-1;
            }
            /*
            结算后写入数据库
             */
            players[0].getUser().setTotalNumber(players[0].getUser().getTotalNumber()+1);
            players[0].getUser().setWinNumber( players[0].getUser().getWinNumber()+p0);
            players[1].getUser().setTotalNumber(players[1].getUser().getTotalNumber()+1);
            players[1].getUser().setWinNumber( players[1].getUser().getWinNumber()+p1);
            userService.updateByPrimaryKey(players[0].getUser());
            userService.updateByPrimaryKey(players[1].getUser());
           sendWin();
            //清除掉房间
        this.gameControll.claearRoom(roomIdx);
            return ;//结束此函数同时还要销毁自身

        }
      new Thread(new Runnable() {
            @Override
            public void run() {
                int qNum=questionNum;
                try {
                    Thread.sleep(32000);
                    System.out.println(qNum);
                   System.out.println(questionNum);
                    if(qNum==questionNum)
                    {
                        sendGame1Problem();
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();

        count=0;
        date=new Date();
        JSONObject jsonObject=creatJson();

        for(int i=0;i<2;i++)
        {
                jsonObject.put("playerIdx",i);
                players[i].sendMessage(jsonObject.toString());//发送之前转json
        }
    }
  public JSONObject creatJson(){
        JSONObject jsonObject=new JSONObject();//注入题目   根据questionNum
        Question question= questions.get(questionNum-1);

        jsonObject.put("title",this.questionNum+"、"+question.getTitle());
        jsonObject.put("A",question.getOptiona());
        jsonObject.put("B", question.getOptionb());
        jsonObject.put("C",question.getOptionc());
        jsonObject.put("correct",question.getCorrect());
        jsonObject.put("zzz","true");
        jsonObject.put("questionNum",questionNum);
        jsonObject.put("roomIdx",roomIdx);
return jsonObject;

    }
  public Room(Player p1, Player p2, int gameType,int roomIdx,List<Question> questions,GameControll gameControll,UserService userService){//创建房间对象  装载玩家，并且触发发题  因为以后没每次用户的提交都会触发判题与发题
      players[0]=p1;
      players[1]=p2;
      this.roomIdx=roomIdx;
      this.questions=questions;
      this.gameControll=gameControll;
      this.userService=userService;
//      p1.sendMessage("{'abc':'true'}");
//      p2.sendMessage("{'abc':'true'}");
      sendUserInfo(0);
      sendUserInfo(1);//对相应的用户发送对手的信息
     /* this.gameType=gameType;*/
      sendGame1Problem();
    }
    public void receiveMessage(JSONObject jsonObject){
        count++;
        Date date1=new Date();
       int  times=(int)((date1.getTime()-date.getTime())/1000);
        System.out.println(times);
        int idx=jsonObject.getInt("playerIdx");
        if(jsonObject.getBoolean("correct"))
        {
            int score= (30-times)*3;
            System.out.println(score);
            this.players[idx].setScore(this.players[idx].getScore()+score);
            sendScore();
        }

        this.players[idx].setChoice(jsonObject.getInt("choice"));
    if(count==2)
    {
        sendGame1Problem();
    }

    }
    public  void sendWin(){
        JSONObject json =new JSONObject();
        json.put("score0",players[0].getScore());
        json.put("score1",players[1].getScore());
        json.put("winNum",winNum);
        json.put("over","true");
        players[0].sendMessage(json.toString());
        players[1].sendMessage(json.toString());
    }
    public void sendScore(){
        JSONObject json=new JSONObject();

        json.put("score0",this.getPlayers()[0].getScore());
        json.put("score1",this.getPlayers()[1].getScore());
        json.put("score","true");

        this.getPlayers()[0].sendMessage(json.toString());
        this.getPlayers()[1].sendMessage(json.toString());
    }
    public  void  reconnect(int playerIdx, WebSocketSession session){
        System.out.println(session+"测试成功");
        this.players[playerIdx].setSession(session);//更新session  并且发送更新时间的数据  然后发送题目
        //向客户机发送数据  当前题目，当前题号，当前题目剩余时间  并带有标记位表明是断线重连的情况
        Date date1=new Date();
         int times=30-(int)((date1.getTime()-date.getTime())/1000);
    //    count=0;
        JSONObject jsonObject=creatJson();  //已经带有 题目的json数据
        jsonObject.put("reconnect","true");//标记重开
        jsonObject.put("time",times);
        jsonObject.put("playerIdx",playerIdx);//自己的playerIdx   只需要知道自己的即可
        jsonObject.put("choice",players[playerIdx].getChoice());//-1代表当前你题目没有做选择
        jsonObject.put("isCorrect",players[playerIdx].getChoice()==(questions.get(questionNum-1).getCorrect().charAt(0)-'A'+1));//判断对错
       // this.players[playerIdx].sendMessage();
        sendUserInfoReConnect(0);
        sendUserInfoReConnect(1);
        this.players[playerIdx].sendMessage(jsonObject.toString());
        sendScore();

    }

    public  JSONObject CreateUserInfo(int index){
        JSONObject jsonObject=new JSONObject();
        int pIndex=(index+1)%2;
        jsonObject.put("userImg",players[pIndex].getUser().getImage());
        jsonObject.put("userName",players[pIndex].getUser().getUsername());
        return jsonObject;//携带头像
    }
    public  void sendUserInfoReConnect(int index)
    {
        JSONObject jsonObject=CreateUserInfo(index);
        jsonObject.put("reconnectUserInfo","true");
        players[index].sendMessage(jsonObject.toString());
    }
    public  void sendUserInfo(int index){//发送对手的信息
        JSONObject jsonObject=CreateUserInfo(index);
        //int pIndex=(index+1)%2;
        jsonObject.put("abc","true");
//        jsonObject.put("userImg",players[pIndex].getUser().getImage());
//        jsonObject.put("userName",players[pIndex].getUser().getUsername());
        players[index].sendMessage(jsonObject.toString());//向隔壁用户发送消息
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Player[] getPlayers() {
        return players;
    }

    public void setPlayers(Player[] players) {
        this.players = players;
    }


    public int getQuestionNum() {
        return questionNum;
    }

    public void setQuestionNum(int questionNum) {
        this.questionNum = questionNum;
    }

    public int getWinNum() {
        return winNum;
    }

    public void setWinNum(int winNum) {
        this.winNum = winNum;
    }

    public int getRoomIdx() {
        return roomIdx;
    }

    public void setRoomIdx(int roomIdx) {
        this.roomIdx = roomIdx;
    }
    //问题在于如何触发房间 发题


    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}

package com.poetry.game;

import net.sf.json.JSONObject;


public class Invite {
    //第一个人先进来 然后等待第二个人
    private Player p1;  //第一个进入房间的
    private Player p2;// 被邀请进
    boolean flag = true;//当标记为false时不可邀请
    public Invite(Player p) {
        this.p1 = p;
        flag=false;
        //10秒邀请时间，过了这个时间邀请失效

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Thread.sleep(12000);//等待后判断邀请是否成功
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                //邀请失败  对方没有回应

                if (p2 == null) {
                    //通知用户邀请失败
                    JSONObject json=new JSONObject();
                    json.put("op","failure");
                    json.put("msg","您的邀请没能得到回应");
                    p1.sendMessage(json.toString());
                    destory();
                }
            }
        }).start();
    }
    public  void setP2(Player p2){
        this.p2=p2;//可以开始游戏了  开始游戏需要获得GaamController
        //开始游戏
        //甚至不需要返回房间号
        JSONObject json=new JSONObject();
        json.put("op","start");//跳到游戏界面即可
        p1.sendMessage(json.toString());
        p2.sendMessage(json.toString());
        try {//等待3秒用户进入房间
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        //难道创建了两个房间
        p1.getGameControll().creatRoom(p1,p2);//开始游戏
     //此时不可再进行邀请用户
        //通知两个用户对局开始
    }
    public  void destory(){
        p1=null;
        p2=null;
        flag=true;//又可以再次邀请
    }

    public Player getP1() {
        return p1;
    }

    public void setP1(Player p1) {
        this.p1 = p1;
    }

    public Player getP2() {
        return p2;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }
}
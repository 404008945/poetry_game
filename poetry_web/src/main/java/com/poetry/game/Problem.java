package com.poetry.game;

public class Problem {
    private String title;
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    private String upPoetry;//上句

    private String  downPoetry;  //下句
    //判断对错

    public boolean isCorrect(String ans){
        return downPoetry.equals(ans);
    }




    public String getUpPoetry() {
        return upPoetry;
    }

    public void setUpPoetry(String upPoetry) {
        this.upPoetry = upPoetry;
    }

    public String getDownPoetry() {
        return downPoetry;
    }

    public void setDownPoetry(String downPoetry) {
        this.downPoetry = downPoetry;
    }

}

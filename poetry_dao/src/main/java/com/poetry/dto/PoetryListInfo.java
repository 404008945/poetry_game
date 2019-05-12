package com.poetry.dto;

import com.poetry.entity.Poetry;
//进入诗词列表需要的字段
public class PoetryListInfo {
    //古诗
    private Poetry poetry;
    //点赞量
    private Integer likesNum;
    //评论量
    private Integer commentsNum;
    //图片
    private String color;
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Poetry getPoetry() {
        return poetry;
    }

    public void setPoetry(Poetry poetry) {
        this.poetry = poetry;
    }

    public Integer getLikesNum() {
        return likesNum;
    }

    public void setLikesNum(Integer likesNum) {
        this.likesNum = likesNum;
    }

    public Integer getCommentsNum() {
        return commentsNum;
    }

    public void setCommentsNum(Integer commentsNum) {
        this.commentsNum = commentsNum;
    }

    @Override
    public String toString() {
        return "PoetryListInfo{" +
                "poetry=" + poetry +
                ", likesNum=" + likesNum +
                ", commentsNum=" + commentsNum +
                ", color='" + color + '\'' +
                '}';
    }
}

package com.poetry.entity;

import java.util.Date;

public class Comment {
    private Integer id;

    private String content;

    private Integer poetryId;

    //评论获得的赞
    private Integer likes;

    //评论用户id
    private Integer userId;

    //评论发表时间
    private Date time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getPoetryId() {
        return poetryId;
    }

    public void setPoetryId(Integer poetryId) {
        this.poetryId = poetryId;
    }

    public Integer getLikes() {
        return likes;
    }

    public void setLikes(Integer likes) {
        this.likes = likes;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", poetryId=" + poetryId +
                ", likes=" + likes +
                ", userId=" + userId +
                ", time=" + time +
                '}';
    }
}
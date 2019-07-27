package com.poetry.dto;

import com.poetry.entity.User;

import java.util.Date;

//封装请求消息
public class RequestDto {
    private User user;
    private Date time;
    private String message;
    private Integer id;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "RequestDto{" +
                "user=" + user +
                ", time=" + time +
                ", message='" + message + '\'' +
                ", id=" + id +
                '}';
    }
}

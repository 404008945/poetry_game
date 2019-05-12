package com.poetry.service;

import com.poetry.entity.Message;

import java.util.List;

public interface MessageService {
    int removeByPrimaryKey(Integer id);

    int add(Message record);

    List<Message> getByUserIdY(Integer id);

    List<Message> getByUserIdN(Integer id);

    int getUnreadNum(Integer id);

    int setRead(Integer id);
}
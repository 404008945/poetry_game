package com.poetry.service.impl;

import com.poetry.dao.MessageDao;
import com.poetry.entity.Message;
import com.poetry.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDao messageDao;

    public int removeByPrimaryKey(Integer id) {
        return messageDao.deleteByPrimaryKey(id);
    }

    public int add(Message record) {
        record.setRead(0);
        return messageDao.insert(record);
    }

    public List<Message> getByUserIdY(Integer id) {
        return messageDao.selectByUserIdY(id);
    }

    public List<Message> getByUserIdN(Integer id) {
        return messageDao.selectByUserIdN(id);
    }

    public int getUnreadNum(Integer id) {
        return messageDao.selectUnreadNum(id);
    }

    public int setRead(Integer id) {
        return messageDao.setRead(id);
    }
}

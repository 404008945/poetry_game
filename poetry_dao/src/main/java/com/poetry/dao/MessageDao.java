package com.poetry.dao;

import com.poetry.entity.Message;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    //查找某个人的未读消息
    List<Message> selectByUserIdN(Integer id);

    //获取未读消息数
    int selectUnreadNum(Integer id);

    //查找某个人的已读消息
    List<Message> selectByUserIdY(Integer id);

    //设置消息已读
    int setRead(Integer id);
}
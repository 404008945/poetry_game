package com.poetry.dao;

import com.poetry.entity.Friend;
import com.poetry.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FriendDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Friend record);

    Friend selectByPrimaryKey(Integer id);

    List<Friend> selectAll();

    int updateByPrimaryKey(Friend record);

    //获取一个用户的所有好友
    List<String> selectFriends(@Param("account") String account);

    //获取一个用户被请求且尚未处理的账户名
    List<Friend> selectRequest(@Param("account") String account);

    //获取请求消息数
    int selectRequestCount(@Param("account") String account);

    //判断account1和account2是不是好友关系
    int judgeFriends(@Param("account1") String account1, @Param("account2") String account2);
}
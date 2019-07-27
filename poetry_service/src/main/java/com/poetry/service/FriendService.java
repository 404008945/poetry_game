package com.poetry.service;

import com.poetry.dto.RequestDto;
import com.poetry.entity.Friend;
import com.poetry.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

public interface FriendService {
    int removeByPrimaryKey(Integer id);

    //添加好友
    int add(String fromUser, String toUser,String message);

    Friend getByPrimaryKey(Integer id);

    List<Friend> getAll();

    int editByPrimaryKey(Friend record);

    //获取一个用户的所有好友
    List<User> getFriends(@Param("account") String account);

    //获取一个用户被请求且尚未处理的账户名
    List<RequestDto> getRequest(@Param("account") String account);

    int getRequestCount(@Param("account") String account);

    boolean judgeFriends(@Param("account1") String account1, @Param("account2") String account2);
}
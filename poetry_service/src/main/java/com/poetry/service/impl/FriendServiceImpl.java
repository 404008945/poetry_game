package com.poetry.service.impl;

import com.poetry.dao.FriendDao;
import com.poetry.dao.UserDao;
import com.poetry.dto.RequestDto;
import com.poetry.entity.Friend;
import com.poetry.entity.User;
import com.poetry.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class FriendServiceImpl implements FriendService {
    @Autowired
    private FriendDao friendDao;
    @Autowired
    private UserDao userDao;

    public int removeByPrimaryKey(Integer id) {
        return friendDao.deleteByPrimaryKey(id);
    }

    public int add(String fromUser, String toUser, String message) {
        //添加好友
        Friend friend = new Friend();
        friend.setFromUser(fromUser);
        friend.setToUser(toUser);
        //尚未审核
        friend.setCheck(false);
        friend.setDate(new Date());
        friend.setMessage(message);
        return friendDao.insert(friend);
    }

    public Friend getByPrimaryKey(Integer id) {
        return friendDao.selectByPrimaryKey(id);
    }

    public List<Friend> getAll() {
        return friendDao.selectAll();
    }

    public int editByPrimaryKey(Friend record) {
        return friendDao.updateByPrimaryKey(record);
    }

    public List<User> getFriends(String account) {
        //用于存放一个用户的所有好友
        List<User> users = new ArrayList<User>();
        List<String> list = friendDao.selectFriends(account);
        list.stream().forEach(i -> {
            User user = userDao.selectByAccount(i);
            //将密码设置为空
            user.setPassword("");
            users.add(user);
        });
        return users;
    }

    @Override
    public List<RequestDto> getRequest(String account) {
        List<Friend> friends = friendDao.selectRequest(account);
        List<RequestDto> requestDtos = new ArrayList<>();
        friends.stream().forEach(i -> {
            User user = userDao.selectByAccount(i.getFromUser());
            RequestDto requestDto = new RequestDto();
            requestDto.setUser(user);
            requestDto.setTime(i.getDate());
            requestDto.setMessage(i.getMessage());
            requestDto.setId(i.getId());
            requestDtos.add(requestDto);
        });
        return requestDtos;
    }

    @Override
    public int getRequestCount(String account) {
        return friendDao.selectRequestCount(account);
    }

    @Override
    public boolean judgeFriends(String account1, String account2) {
        return friendDao.judgeFriends(account1, account2) > 0;
    }

}

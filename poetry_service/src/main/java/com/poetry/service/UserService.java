package com.poetry.service;


import com.github.pagehelper.PageInfo;
import com.poetry.entity.Poetry;
import com.poetry.entity.User;

import java.util.List;

public interface UserService {
    int removeByPrimaryKey(Integer id);

    int insert(User record);

    User getByPrimaryKey(Integer id);

    PageInfo getAll(int pageNumber, int pageSize);

    int editByPrimaryKey(User record);

    User getByAccount(String account);

    User getByEmail(String email);

    //增加浏览量
    void addViews(Integer id);

    int updateByPrimaryKey(User record);
    User getByQqOpenid(String openid);

    User findByAccountAndPassword(String account, String password);

    void update(User user);

    User findByAccount(String account);

    void save(User user1);
}
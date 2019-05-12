package com.poetry.service;


import com.github.pagehelper.PageInfo;
import com.poetry.entity.Poetry;
import com.poetry.entity.UserPoetry;

import java.util.List;

public interface UserPoetryService {
    int removeByPrimaryKey(Integer id);

    int add(UserPoetry record);

    UserPoetry getByPrimaryKey(Integer id);

    //按照发布时间从数据库取数据
    PageInfo getAllByTime(int pageNum, int pageSize);

    //按照热度从数据库取数据
    PageInfo getAllByLikes(int pageNum, int pageSize);

    int editByPrimaryKey(UserPoetry record);

    PageInfo getByUserId(Integer userId, int pageNum, int pageSize);

    void addLikes(Integer id);

    void addViews(Integer id);

    void subLikes(Integer id);

    //不分页
    List<UserPoetry> getByUserId(Integer userId);

    //获取用户作品的总点赞量
    int getAllLikesByUserId(Integer id);

    //获取用户作品的总浏览量
    int getAllViewsByUserId(Integer id);

    List<UserPoetry> getByUserLike(Integer id);
}
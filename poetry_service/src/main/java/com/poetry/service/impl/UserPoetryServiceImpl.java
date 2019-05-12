package com.poetry.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.poetry.dao.UserPoetryDao;
import com.poetry.entity.Poetry;
import com.poetry.entity.UserPoetry;
import com.poetry.service.UserPoetryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserPoetryServiceImpl implements UserPoetryService {

    @Autowired
    private UserPoetryDao userPoetryDao;

    public int removeByPrimaryKey(Integer id) {
        return userPoetryDao.deleteByPrimaryKey(id);
    }

    public int add(UserPoetry record) {
        record.setLikes(0);
        record.setViews(1);
        record.setTime(new Date());
        return userPoetryDao.insert(record);
    }

    public UserPoetry getByPrimaryKey(Integer id) {
        return userPoetryDao.selectByPrimaryKey(id);
    }

    public PageInfo getAllByTime(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<UserPoetry> userPoetry = userPoetryDao.selectAllByTime();
        PageInfo pageInfo = new PageInfo(userPoetry);
        return pageInfo;
    }

    public PageInfo getAllByLikes(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<UserPoetry> userPoetry = userPoetryDao.selectAllByLikes();
        PageInfo pageInfo = new PageInfo(userPoetry);
        return pageInfo;
    }

    public int editByPrimaryKey(UserPoetry record) {
        return userPoetryDao.updateByPrimaryKey(record);
    }

    public PageInfo getByUserId(Integer id, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<UserPoetry> list = userPoetryDao.selectByUserId(id);
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    public void addLikes(Integer id) {
        userPoetryDao.addLikes(id);
    }

    public void addViews(Integer id) {
        userPoetryDao.addViews(id);
    }

    public void subLikes(Integer id) {
        userPoetryDao.subLikes(id);
    }

    public List<UserPoetry> getByUserId(Integer userId) {
        return userPoetryDao.selectByUserId(userId);
    }


    //获取一个用户获得的所有赞
    public int getAllViewsByUserId(Integer id) {
        int views = 0;
        List<UserPoetry> list = getByUserId(id);
        for (UserPoetry userPoetry : list) {
            views = views + userPoetry.getViews();
        }
        return views;
    }

    //获得所有的赞通过用户id
    public int getAllLikesByUserId(Integer id) {
        int likes = 0;
        List<UserPoetry> list = getByUserId(id);
        for (UserPoetry userPoetry : list) {
            likes = likes + userPoetry.getLikes();
        }
        return likes;
    }

    //获取用户点赞过的所有作品
    public List<UserPoetry> getByUserLike(Integer id) {
        return userPoetryDao.selectByUserLike(id);
    }

}

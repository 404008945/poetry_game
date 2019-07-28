package com.poetry.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.poetry.dao.UserDao;
import com.poetry.entity.Poetry;
import com.poetry.entity.User;
import com.poetry.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    public int removeByPrimaryKey(Integer id) {
        return userDao.deleteByPrimaryKey(id);
    }

    public int insert(User record) {
        //初始化操作
        record.setTotalNumber(0);
        record.setWinNumber(0);
        record.setViews(0);
        record.setType(0);
        return userDao.insert(record);
    }

    public User getByPrimaryKey(Integer id) {
        return userDao.selectByPrimaryKey(id);
    }

    public PageInfo getAll(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<User> users = userDao.selectAll();
        PageInfo pageInfo = new PageInfo(users);
        return pageInfo;
    }

    public int editByPrimaryKey(User record) {
        return userDao.updateByPrimaryKey(record);
    }

    public User getByAccount(String account) {
        return userDao.selectByAccount(account);
    }

    public User getByEmail(String email) {
        return userDao.selectByEmail(email);
    }

    public void addViews(Integer id) {
        userDao.addViews(id);
    }

    public int updateByPrimaryKey(User record) {
        return userDao.updateByPrimaryKey(record);
    }

    public User getByQqOpenid(String openid) {
        return userDao.getByOpenId(openid);
    }

    public User findByAccountAndPassword(String account, String password) {
        return userDao.findByAccountAndPassword(account, password);
    }

    public void update(User user) {
        userDao.update(user);
    }

    public User findByAccount(String account) {
        return userDao.findByAccount(account);
    }

    public void save(User user1) {
        userDao.save(user1);
    }
}

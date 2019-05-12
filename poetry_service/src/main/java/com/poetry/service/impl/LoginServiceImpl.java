package com.poetry.service.impl;

import com.poetry.dao.UserDao;
import com.poetry.entity.User;
import com.poetry.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private UserDao userDao;

    //登录
    public User login(String account, String password) {
        User user = userDao.selectByAccount(account);
        if(user!=null&&password!=null&&user.getPassword().equals(password))
        {
            return user;
        }
        return null;
    }

    //账户是否被注册过
    public boolean isRegister(String account)
    {
        User user = userDao.selectByAccount(account);
        if(user!=null)
        {
            //被注册过
            return true;
        }
        return false;
    }
}

package com.poetry.dao;
import com.poetry.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

    //根据用户名获取User
    User selectByAccount(String account);

    //根据电子邮箱获取User
    User selectByEmail(String email);

    //增加用户总浏览量
    void addViews(Integer id);

}
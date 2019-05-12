package com.poetry.dao;


import com.poetry.entity.Poetry;
import com.poetry.entity.UserPoetry;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserPoetryDao {
    int deleteByPrimaryKey(Integer id);

    int insert(UserPoetry record);

    UserPoetry selectByPrimaryKey(Integer id);

    List<UserPoetry> selectAllByTime();

    int updateByPrimaryKey(UserPoetry record);

    //查询某个用户的所有诗词
    List<UserPoetry> selectByUserId(Integer id);

    //点赞更新,每点一次,则likes+1
    void addLikes(Integer id);

    //取消点赞
    void subLikes(Integer id);

    //浏览量更新,每看一次,则views+1
    void addViews(Integer id);

    List<UserPoetry> selectByUserLike(Integer id);

    List<UserPoetry> selectAllByLikes();
}
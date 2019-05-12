package com.poetry.dao;


import com.poetry.entity.Comment;

import java.util.List;

public interface CommentDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    Comment selectByPrimaryKey(Integer id);

    List<Comment> selectAll();

    int updateByPrimaryKey(Comment record);

    //获取一首诗的所有评论
    List<Comment> selectByPoetryId(Integer poetryId);

    //点赞更新,每点一次,则likes+1
    void addLikes(Integer id);
}
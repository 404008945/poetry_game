package com.poetry.service;


import com.poetry.entity.Comment;

import java.util.List;

public interface CommentService {
    int removeByPrimaryKey(Integer id);

    int add(Comment record);

    Comment getByPrimaryKey(Integer id);

    List<Comment> getAll();

    int editByPrimaryKey(Comment record);

    //获取一首诗的所有评论
    List<Comment> getByPoetryId(Integer poetryId);

    //点赞更新,每点一次,则likes+1
    void addLikes(Integer id);
}
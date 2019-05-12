package com.poetry.service;

import com.poetry.entity.CommentForPoetry;

public interface CommentForPoetryService {

    int deleteByPrimaryKey(Integer id);

    int insert(CommentForPoetry record);

    int insertSelective(CommentForPoetry record);

    CommentForPoetry selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CommentForPoetry record);

    int updateByPrimaryKey(CommentForPoetry record);
    int getCommentsNum(Integer poetryId);
}

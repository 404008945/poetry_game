package com.poetry.dao;

import com.poetry.entity.CommentForPoetry;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentForPoetryDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CommentForPoetry record);

    int insertSelective(CommentForPoetry record);

    CommentForPoetry selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CommentForPoetry record);

    int updateByPrimaryKey(CommentForPoetry record);
    int selectCommentsNum(Integer poetryId);

}
package com.poetry.service;

import com.poetry.entity.LikesForPoetry;
import org.apache.ibatis.annotations.Param;

public interface LikesForPoetryService {

    int deleteByPrimaryKey(Integer id);

    int insert(LikesForPoetry record);

    int insertSelective(LikesForPoetry record);

    LikesForPoetry selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LikesForPoetry record);

    int updateByPrimaryKey(LikesForPoetry record);
    LikesForPoetry selectByInfo(Integer uid, Integer pid);
    int getLikesNum(Integer poetryId);

}

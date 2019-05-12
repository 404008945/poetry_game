package com.poetry.dao;

import com.poetry.entity.LikesForPoetry;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikesForPoetryDao {

    int deleteByPrimaryKey(Integer id);

    int insert(LikesForPoetry record);

    int insertSelective(LikesForPoetry record);

    LikesForPoetry selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LikesForPoetry record);

    int updateByPrimaryKey(LikesForPoetry record);

    LikesForPoetry selectByInfo(@Param("uid") Integer uid, @Param("pid") Integer pid);

    int selectLikesNum(Integer poetryId);




}
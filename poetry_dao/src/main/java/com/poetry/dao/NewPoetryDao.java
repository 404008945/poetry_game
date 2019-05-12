package com.poetry.dao;

import com.poetry.entity.NewPoetry;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface NewPoetryDao {
    int deleteByPrimaryKey(Integer id);

    int insert(NewPoetry record);

    NewPoetry selectByPrimaryKey(Integer id);

    List<NewPoetry> selectAll();

    int updateByPrimaryKey(NewPoetry record);

    //随机产生一首诗
    NewPoetry selectOne();
}
package com.poetry.dao;


import com.poetry.entity.HotSearch;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface HotSearchDao {
    int deleteByPrimaryKey(Integer id);

    int insert(HotSearch record);

    HotSearch selectByPrimaryKey(Integer id);

    List<HotSearch> select();

    //每被搜索一次更新一次
    int updateByPrimaryKey(Integer id);

    //通过关键词查询
    HotSearch selectByWords(String words);
}
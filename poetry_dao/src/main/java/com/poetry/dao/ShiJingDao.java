package com.poetry.dao;

import com.poetry.entity.ShiJing;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShiJingDao {
    //通过id查询诗经
    ShiJing selectById(Integer id);

    //通过总篇查询诗经
    List<ShiJing> selectByChapter(String chapter);

    //通过题目查询诗经
    ShiJing selectByTitle(String title);

    //随机取出诗经
    List<ShiJing> selectByRandom();
}

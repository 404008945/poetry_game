package com.poetry.service;

import com.poetry.entity.ShiJing;

import java.util.List;

public interface ShiJingService {
    //通过id查询诗经
    ShiJing getById(Integer id);

    //通过总篇查询诗经
    List<ShiJing> getByChapter(String chapter);

    //通过题目查询诗经
    ShiJing getByTitle(String title);

    //随机获取诗经
    List<ShiJing> getByRandom();
}

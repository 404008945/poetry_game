package com.poetry.service;


import com.poetry.entity.HotSearch;

import java.util.List;

public interface HotSearchService {
    int removeByPrimaryKey(Integer id);

    int add(HotSearch record);

    HotSearch getByPrimaryKey(Integer id);

    List<HotSearch> get();

    int editByPrimaryKey(String words, Integer type);
}
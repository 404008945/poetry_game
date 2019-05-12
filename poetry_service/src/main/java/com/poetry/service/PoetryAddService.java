package com.poetry.service;

import com.github.pagehelper.PageInfo;
import com.poetry.entity.PoetryAdd;

public interface PoetryAddService {
    void add(PoetryAdd poetryAdd);

    PageInfo getAll(int pageNumber, int pageSize);

    void remove(Integer id);
}

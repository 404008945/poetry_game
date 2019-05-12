package com.poetry.service;

import com.github.pagehelper.PageInfo;
import com.poetry.entity.Poems;

import java.util.List;

public interface PoemsService {
    Poems getById(Integer id);

    PageInfo getByTitle(String title, int pageNum, int pageSize);

    PageInfo getByAuthor(String author, int pageNumber, int pageSize);

    List<Poems> getPoemsRandom();

    PageInfo getByContent(String content, int pageNumber, int pageSize);
}

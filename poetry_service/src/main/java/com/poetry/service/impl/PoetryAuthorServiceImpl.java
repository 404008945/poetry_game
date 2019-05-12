package com.poetry.service.impl;

import com.poetry.dao.PoetryAuthorDao;
import com.poetry.entity.PoetryAuthor;
import com.poetry.service.PoetryAuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PoetryAuthorServiceImpl implements PoetryAuthorService {

    @Autowired
    private PoetryAuthorDao poetryAuthorDao;

    public PoetryAuthor getById(Integer id) {
        return poetryAuthorDao.selectById(id);
    }
}

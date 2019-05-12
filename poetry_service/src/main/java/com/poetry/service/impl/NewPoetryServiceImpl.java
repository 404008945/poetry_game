package com.poetry.service.impl;

import com.poetry.dao.NewPoetryDao;
import com.poetry.entity.NewPoetry;
import com.poetry.service.NewPoetryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewPoetryServiceImpl implements NewPoetryService {

    @Autowired
    private NewPoetryDao poetryDao;

    public int removeByPrimaryKey(Integer id) {
        return poetryDao.deleteByPrimaryKey(id);
    }

    public int add(NewPoetry record) {
        return poetryDao.insert(record);
    }

    public NewPoetry getByPrimaryKey(Integer id) {
        return poetryDao.selectByPrimaryKey(id);
    }

    public List<NewPoetry> getAll() {
        return poetryDao.selectAll();
    }

    public int editByPrimaryKey(NewPoetry record) {
        return poetryDao.updateByPrimaryKey(record);
    }

    public NewPoetry getOne() {
        return poetryDao.selectOne();
    }
}

package com.poetry.service;

import com.poetry.entity.NewPoetry;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NewPoetryService {
    int removeByPrimaryKey(Integer id);

    int add(NewPoetry record);

    NewPoetry getByPrimaryKey(Integer id);

    List<NewPoetry> getAll();

    int editByPrimaryKey(NewPoetry record);

    //随机产生一首诗
    NewPoetry getOne();
}
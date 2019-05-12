package com.poetry.service;


import com.poetry.entity.Info;
import com.poetry.entity.Poetry;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfoService {
    int removeByPrimaryKey(Integer id);

    int add(Info record);

    Info getByPrimaryKey(Integer id);

    List<Info> getAll();

    int editByPrimaryKey(Info record);


    List<Info> selectByType(String type);
}
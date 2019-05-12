package com.poetry.service;
import com.poetry.entity.Poetry;
import com.poetry.entity.Poetry1;

import java.util.List;

public interface Poetry1Service {
    Poetry1 getById(Integer id);

    List<String> getHeadPoetry(String head, Integer type);
}

package com.poetry.service;

import com.poetry.entity.LunYu;

import java.util.List;

public interface LunYuService {
    LunYu getById(Integer id);

    //随机返回论语
    List<LunYu> getByRandom();
}

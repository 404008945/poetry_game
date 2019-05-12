package com.poetry.service.impl;

import com.poetry.dao.LunYuDao;
import com.poetry.entity.LunYu;
import com.poetry.service.LunYuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LunYuServiceImpl implements LunYuService {

    @Autowired
    private LunYuDao lunYuDao;

    public LunYu getById(Integer id) {
        return lunYuDao.selectById(id);
    }

    public List<LunYu> getByRandom() {
        return lunYuDao.selectByRandom();
    }
}

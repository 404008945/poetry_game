package com.poetry.service.impl;

import com.poetry.dao.ShiJingDao;
import com.poetry.entity.ShiJing;
import com.poetry.service.ShiJingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShiJingServiceImpl implements ShiJingService {

    @Autowired
    private ShiJingDao shiJingDao;

    public ShiJing getById(Integer id) {
        return shiJingDao.selectById(id);
    }

    public List<ShiJing> getByChapter(String chapter) {
        return shiJingDao.selectByChapter(chapter);
    }

    public ShiJing getByTitle(String title) {
        return shiJingDao.selectByTitle(title);
    }

    public List<ShiJing> getByRandom() {
        return shiJingDao.selectByRandom();
    }
}

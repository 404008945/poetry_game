package com.poetry.service.impl;

import com.poetry.dao.InfoDao;
import com.poetry.entity.Info;
import com.poetry.entity.Poetry;
import com.poetry.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InfoServiceImpl implements InfoService {

    @Autowired
    private InfoDao infoDao;

    public int removeByPrimaryKey(Integer id) {
        return infoDao.deleteByPrimaryKey(id);
    }

    public int add(Info record) {
        return infoDao.insert(record);
    }

    public Info getByPrimaryKey(Integer id) {
        return infoDao.selectByPrimaryKey(id);
    }

    public List<Info> getAll() {
        return infoDao.selectAll();
    }

    public int editByPrimaryKey(Info record) {
        return infoDao.updateByPrimaryKey(record);
    }

    public List<Info> selectByType(String type) {
        return infoDao.selectByType(type);
    }
}

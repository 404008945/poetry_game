package com.poetry.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.poetry.dao.PoemsDao;
import com.poetry.entity.Poems;
import com.poetry.service.PoemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PoemsServiceImpl implements PoemsService {

    @Autowired
    private PoemsDao poemsDao;

    public Poems getById(Integer id) {
        return poemsDao.selectById(id);
    }

    public PageInfo getByTitle(String title, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Poems> poetry = poemsDao.selectByTitle(title);
        PageInfo pageInfo = new PageInfo(poetry);
        return pageInfo;
    }

    public PageInfo getByAuthor(String author, int pageNumber, int pageSize) {
        PageHelper.startPage(1, pageSize);
        List<Poems> poems = poemsDao.selectByAuthor(author);
        PageInfo<Poems> poemsPageInfo = new PageInfo<Poems>(poems);
        return poemsPageInfo;
    }

    public List<Poems> getPoemsRandom() {
        return poemsDao.selectByRandom();
    }

    public PageInfo getByContent(String content, int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<Poems> poems = poemsDao.selectByContent(content);
        PageInfo pageInfo = new PageInfo(poems);
        return pageInfo;
    }
}

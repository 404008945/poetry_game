package com.poetry.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.poetry.dao.PoetryAddDao;
import com.poetry.dao.PoetryDao;
import com.poetry.entity.PoetryAdd;
import com.poetry.entity.PoetryAuthor;
import com.poetry.entity.User;
import com.poetry.service.PoetryAddService;
import com.poetry.service.PoetryAuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PoetryAddServiceImpl implements PoetryAddService {
    @Autowired
    private PoetryAddDao poetryAddDao;

    public void add(PoetryAdd poetryAdd) {
        poetryAddDao.insert(poetryAdd);
    }

    public PageInfo getAll(int pageNumber,int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        List<PoetryAdd> poetryAdds = poetryAddDao.selectAll();
        PageInfo pageInfo=new PageInfo(poetryAdds);
        return pageInfo;
    }

    public void remove(Integer id) {
        poetryAddDao.delete(id);
    }
}

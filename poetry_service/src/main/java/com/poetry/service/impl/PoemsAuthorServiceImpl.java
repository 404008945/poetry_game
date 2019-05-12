package com.poetry.service.impl;
import com.poetry.dao.PoemsAuthorDao;
import com.poetry.entity.PoemsAuthor;
import com.poetry.service.PoemsAuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PoemsAuthorServiceImpl implements PoemsAuthorService {

    @Autowired
    private PoemsAuthorDao poemsAuthorDao;

    public PoemsAuthor getById(Integer id) {
        return poemsAuthorDao.selectById(id);
    }
}

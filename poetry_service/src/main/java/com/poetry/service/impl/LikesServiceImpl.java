package com.poetry.service.impl;

import com.poetry.dao.LikesDao;
import com.poetry.entity.Likes;
import com.poetry.service.LikesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LikesServiceImpl implements LikesService {

    @Autowired
    private LikesDao likesDao;

    public int remove(Integer userId, Integer poetryId) {
        return likesDao.delete(userId,poetryId);
    }

    public int add(Likes record) {
        return likesDao.insert(record);
    }

    public List<Likes> getByUserId(Integer id) {
        return likesDao.selectByUserId(id);
    }

    public List<Likes> getByPoetryId(Integer id) {
        return likesDao.selectByPoetryId(id);
    }
}

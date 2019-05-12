package com.poetry.service.impl;

import com.poetry.dao.LikesForPoetryDao;
import com.poetry.entity.LikesForPoetry;
import com.poetry.service.LikesForPoetryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikesForPoetryServiceImpl  implements LikesForPoetryService {
    @Autowired
    private LikesForPoetryDao likesForPoetryDao;


    public int deleteByPrimaryKey(Integer id) {
        return likesForPoetryDao.deleteByPrimaryKey(id);
    }

    public int insert(LikesForPoetry record) {
        return likesForPoetryDao.insert(record);
    }

    public int insertSelective(LikesForPoetry record) {
        return likesForPoetryDao.insertSelective(record);
    }

    public LikesForPoetry selectByPrimaryKey(Integer id) {
        return likesForPoetryDao.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(LikesForPoetry record) {
        return likesForPoetryDao.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(LikesForPoetry record) {
        return likesForPoetryDao.updateByPrimaryKey(record);
    }

    public LikesForPoetry selectByInfo(Integer uid, Integer pid) {
        return likesForPoetryDao.selectByInfo(uid,pid);
    }
    public int getLikesNum(Integer poetryId) {
        return likesForPoetryDao.selectLikesNum(poetryId);
    }

}

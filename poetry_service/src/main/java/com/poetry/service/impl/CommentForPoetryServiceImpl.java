package com.poetry.service.impl;

import com.poetry.dao.CommentForPoetryDao;
import com.poetry.entity.CommentForPoetry;
import com.poetry.service.CommentForPoetryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentForPoetryServiceImpl  implements CommentForPoetryService {

    @Autowired
    private CommentForPoetryDao commentForPoetryDao;

    public int deleteByPrimaryKey(Integer id) {
        return commentForPoetryDao.deleteByPrimaryKey(id);
    }

    public int insert(CommentForPoetry record) {
        return commentForPoetryDao.insert(record);
    }

    public int insertSelective(CommentForPoetry record) {
        return commentForPoetryDao.insertSelective(record);
    }

    public CommentForPoetry selectByPrimaryKey(Integer id) {
        return commentForPoetryDao.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(CommentForPoetry record) {
        return commentForPoetryDao.updateByPrimaryKeySelective(record);
    }
    public int getCommentsNum(Integer poetryId) {
        return commentForPoetryDao.selectCommentsNum(poetryId);
    }

    public int updateByPrimaryKey(CommentForPoetry record) {
        return commentForPoetryDao.updateByPrimaryKey(record);
    }
}

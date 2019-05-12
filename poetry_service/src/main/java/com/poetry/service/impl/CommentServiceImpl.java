package com.poetry.service.impl;

import com.poetry.dao.CommentDao;
import com.poetry.entity.Comment;
import com.poetry.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;
    public int removeByPrimaryKey(Integer id) {
        return commentDao.deleteByPrimaryKey(id);
    }

    public int add(Comment record) {
        record.setLikes(0);
        record.setTime(new Date());
        return commentDao.insert(record);
    }

    public Comment getByPrimaryKey(Integer id) {
        return commentDao.selectByPrimaryKey(id);
    }

    public List<Comment> getAll() {
        return commentDao.selectAll();
    }

    public int editByPrimaryKey(Comment record) {
        return commentDao.updateByPrimaryKey(record);
    }

    public List<Comment> getByPoetryId(Integer poetryId) {
        return commentDao.selectByPoetryId(poetryId);
    }

    public void addLikes(Integer id) {
        commentDao.addLikes(id);
    }
}

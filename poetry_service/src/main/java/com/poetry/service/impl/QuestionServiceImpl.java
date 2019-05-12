package com.poetry.service.impl;

import com.poetry.dao.QuestionDao;
import com.poetry.entity.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionServiceImpl implements com.poetry.service.QuestionService {
    @Autowired
    private QuestionDao questionDao;
   public int deleteByPrimaryKey(Integer id){
        return questionDao.deleteByPrimaryKey(id);
    }

    public int insert(Question record){
        return  questionDao.insert(record);

    }

    public   int insertSelective(Question record)
    {
        return questionDao.insertSelective(record);
    }

    public   Question selectByPrimaryKey(Integer id){
        return  questionDao.selectByPrimaryKey(id);
    }

    public  int updateByPrimaryKeySelective(Question record)
    {
        return questionDao.updateByPrimaryKey(record);
    }

    public  int updateByPrimaryKey(Question record)
    {
        return questionDao.updateByPrimaryKeySelective(record);
    }
    public List<Question> selectByRandom()
    {
        return questionDao.selectByRandom();
    }
}

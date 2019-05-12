package com.poetry.service;

import com.poetry.entity.Question;

import java.util.List;

public interface QuestionService {
    public int deleteByPrimaryKey(Integer id);

    public int insert(Question record);

    public   int insertSelective(Question record);

    public   Question selectByPrimaryKey(Integer id);

    public  int updateByPrimaryKeySelective(Question record);

    public  int updateByPrimaryKey(Question record);
    public List<Question> selectByRandom();
}

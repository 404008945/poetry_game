package com.poetry.dao;

import com.poetry.entity.Question;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Question record);

    int insertSelective(Question record);

    Question selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKey(Question record);

    List<Question> selectByRandom();
}
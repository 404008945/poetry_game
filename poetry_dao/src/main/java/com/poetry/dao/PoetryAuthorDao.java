package com.poetry.dao;

import com.poetry.entity.PoetryAuthor;
import org.springframework.stereotype.Repository;

@Repository
public interface PoetryAuthorDao {
    PoetryAuthor selectById(Integer id);
}

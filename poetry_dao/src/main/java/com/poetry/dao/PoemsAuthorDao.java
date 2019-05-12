package com.poetry.dao;

import com.poetry.entity.PoemsAuthor;
import org.springframework.stereotype.Repository;

@Repository
public interface PoemsAuthorDao {
    PoemsAuthor selectById(Integer id);
}

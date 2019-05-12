package com.poetry.service;

import com.poetry.entity.PoemsAuthor;
import org.springframework.stereotype.Repository;

@Repository
public interface PoemsAuthorService {
    PoemsAuthor getById(Integer id);
}

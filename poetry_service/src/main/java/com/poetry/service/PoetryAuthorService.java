package com.poetry.service;

import com.poetry.entity.PoetryAuthor;
import org.springframework.stereotype.Repository;

@Repository
public interface PoetryAuthorService {
    PoetryAuthor getById(Integer id);
}

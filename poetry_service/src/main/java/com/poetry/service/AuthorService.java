package com.poetry.service;

import com.poetry.entity.Author;

import java.util.List;

public interface AuthorService {
    //获取所有作者
    List<Author> getAllAuthor();

    //获取所有朝代，便于用户选择
    List<String> getAllDynasty();

    Author getById(Integer id);

    Author getByName(String name);

    int add(Author author);
}
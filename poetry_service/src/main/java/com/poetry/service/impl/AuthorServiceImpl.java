package com.poetry.service.impl;

import com.poetry.dao.AuthorDao;
import com.poetry.entity.Author;
import com.poetry.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuthorServiceImpl implements AuthorService {

    @Autowired
    private AuthorDao authorDao;

    public List<Author> getAllAuthor() {
        return authorDao.selectAll();
    }

    public List<String> getAllDynasty() {
        return authorDao.selectAllDynasty();
    }

    public Author getById(Integer id) {
        return authorDao.selectById(id);
    }

    public Author getByName(String name) {
        return authorDao.selectByName(name);
    }

    public int add(Author author) {
        return authorDao.insert(author);
    }
}

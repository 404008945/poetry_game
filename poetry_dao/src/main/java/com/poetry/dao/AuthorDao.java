package com.poetry.dao;

import com.poetry.entity.Author;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AuthorDao {
    //获取某个作者
    Author selectById(Integer id);

    //获取某个作者
    Author selectByName(String name);

    //添加作者
    int insert(Author author);

    //获取所有作者
    List<Author> selectAll();

    //获取所有朝代，便于用户选择
    List<String> selectAllDynasty();
}
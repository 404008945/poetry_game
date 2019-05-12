package com.poetry.dao;

import com.poetry.entity.PoetryAdd;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PoetryAddDao {

    //添加反馈
    void insert(PoetryAdd poetryAdd);

    //查看所有反馈
    List<PoetryAdd> selectAll();

    void delete(Integer id);
}

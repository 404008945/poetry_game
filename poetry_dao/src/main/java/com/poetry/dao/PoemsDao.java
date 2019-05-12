package com.poetry.dao;

import com.poetry.entity.Poems;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PoemsDao {
    //通过Id查询宋词
    Poems selectById(Integer id);

    //通过题目查询宋词
    List<Poems> selectByTitle(String title);

    //通过作者查询宋词
    List<Poems> selectByAuthor(String author);

    //随机查询六首宋词
    List<Poems> selectByRandom();

    //模糊查询
    List<Poems> selectByContent(@Param("content") String content);
}

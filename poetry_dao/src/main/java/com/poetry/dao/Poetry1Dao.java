package com.poetry.dao;

import com.poetry.entity.HeadPoetry;
import com.poetry.entity.Poetry1;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Poetry1Dao {
    //通过Id查询唐宋诗
    Poetry1 selectById(Integer id);

    //根据诗词类型和字符查找
    Poetry1 selectByChar(@Param("headPoetry") HeadPoetry headPoetry);

    void updateFind(@Param("id") Integer id, @Param("num") Integer num);
}

package com.poetry.dao;


import com.poetry.entity.Info;
import com.poetry.entity.Poetry;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface InfoDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Info record);

    Info selectByPrimaryKey(Integer id);

    List<Info> selectAll();

    int updateByPrimaryKey(Info record);
    List<Info> selectByType(@Param("type") String type);
}
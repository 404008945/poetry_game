package com.poetry.dao;

import com.poetry.entity.LunYu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LunYuDao {
    //通过Id查询论语
    LunYu selectById(Integer id);

    //随机返回论语
    List<LunYu> selectByRandom();
}

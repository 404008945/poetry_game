package com.poetry.dao;

import com.poetry.dto.RecommendDto;
import com.poetry.entity.HeadPoetry;
import com.poetry.entity.Poetry;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PoetryDao {
    //通过Id查询唐宋诗
    Poetry selectById(Integer id);

    //通过题目查询唐宋词
    List<Poetry> selectByTitle(String title);

    //通过作者查询唐宋词
    List<Poetry> selectByAuthor(String author);

    //通过朝代查询诗
    List<Poetry> selectByDynasty(String dynasty);

    //随机产生一首诗
    Poetry selectOne();

    List<Poetry> selectByContent(@Param("content") String content);

    //根据诗词类型和字符查找
    Poetry selectByChar(@Param("headPoetry") HeadPoetry headPoetry);

    Poetry   selectByInfoId(@Param("infoId") Integer infoId);
    //每日推荐
    Poetry selectByRecommend(@Param("recommend") RecommendDto recommend);

    //添加诗词
    int insert(Poetry poetry);

}

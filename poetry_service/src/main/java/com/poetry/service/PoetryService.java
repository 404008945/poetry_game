package com.poetry.service;

import com.github.pagehelper.PageInfo;

import com.poetry.dto.RecommendDto;
import com.poetry.entity.Poetry;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PoetryService {
    Poetry getById(Integer id);

    PageInfo getByTitle(String title, int pageNum, int pageSize);

    PageInfo getByAuthor(String author, int pageNumber, int pageSize);

    PageInfo getByDynasty(String dynasty, int pageNumber, int pageSize);

    Poetry getOne();

    PageInfo getByContent(String content, int pageNumber, int pageSize);

    Poetry getByChar(Integer type, Character character);

    List<String> getHeadPoetry(String head, Integer type);

    Poetry   selectByInfoId(@Param("infoId") Integer infoId);
    Poetry getByRecommend(RecommendDto recommend);

    int add(Poetry poetry);

}

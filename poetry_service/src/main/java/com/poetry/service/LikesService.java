package com.poetry.service;



import com.poetry.entity.Likes;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LikesService {
    //通过用户id和某首诗的id删除赞
    int remove(@Param("userId") Integer userId, @Param("poetryId") Integer poetryId);

    int add(Likes record);

    //获取用户点过的所有赞
    List<Likes> getByUserId(Integer id);

    //获取某首诗点过的所有赞
    List<Likes> getByPoetryId(Integer id);
}
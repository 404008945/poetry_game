package com.poetry.dao;



import com.poetry.entity.Likes;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LikesDao {
    //通过用户id和某首诗的id删除赞
    int delete(@Param("userId") Integer userId, @Param("poetryId") Integer poetryId);

    int insert(Likes record);

    //获取用户点过的所有赞
    List<Likes> selectByUserId(@Param("userId") Integer userId);

    //获取某首诗点过的所有赞
    List<Likes> selectByPoetryId(@Param("poetryId") Integer poetry_Id);
}
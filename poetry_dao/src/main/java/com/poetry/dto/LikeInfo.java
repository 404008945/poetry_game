package com.poetry.dto;

import com.github.pagehelper.PageInfo;

import java.util.List;

public class LikeInfo {
    //相似字符
    List<String> likeString;
    public List<String> getLikeString() {
        return likeString;
    }

    public void setLikeString(List<String> likeString) {
        this.likeString = likeString;
    }
}

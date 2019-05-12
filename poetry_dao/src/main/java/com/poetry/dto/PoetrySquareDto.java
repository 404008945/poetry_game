package com.poetry.dto;

import com.github.pagehelper.PageInfo;
import com.poetry.entity.UserPoetry;

import java.util.List;

public class PoetrySquareDto {
    //作者名称
    private String userNames;

    //诗词片段
    private String poetryPart;

    private UserPoetry userPoetry;

    //颜色
    private String colors;

    public String getUserNames() {
        return userNames;
    }

    public void setUserNames(String userNames) {
        this.userNames = userNames;
    }

    public String getPoetryPart() {
        return poetryPart;
    }

    public void setPoetryPart(String poetryPart) {
        this.poetryPart = poetryPart;
    }

    public UserPoetry getUserPoetry() {
        return userPoetry;
    }

    public void setUserPoetry(UserPoetry userPoetry) {
        this.userPoetry = userPoetry;
    }

    public String getColors() {
        return colors;
    }

    public void setColors(String colors) {
        this.colors = colors;
    }

    @Override
    public String toString() {
        return "PoetrySquareDto{" +
                "userNames='" + userNames + '\'' +
                ", poetryPart='" + poetryPart + '\'' +
                ", userPoetry=" + userPoetry +
                ", colors='" + colors + '\'' +
                '}';
    }
}

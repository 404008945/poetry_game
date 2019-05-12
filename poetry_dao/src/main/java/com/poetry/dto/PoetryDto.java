package com.poetry.dto;

import java.util.Arrays;

public class PoetryDto {
    //古诗数组
    private String[] poetryArray;
    //作者简介
    String authorInfo;
    //古诗题目
    String title;
    //朝代
    String dynasty;
    //作者
    String author;
    //总篇
    String chapter;
    //分篇
    String section;

    public String[] getPoetryArray() {
        return poetryArray;
    }

    public void setPoetryArray(String[] poetryArray) {
        this.poetryArray = poetryArray;
    }

    public String getAuthorInfo() {
        return authorInfo;
    }

    public void setAuthorInfo(String authorInfo) {
        this.authorInfo = authorInfo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDynasty() {
        return dynasty;
    }

    public void setDynasty(String dynasty) {
        this.dynasty = dynasty;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getChapter() {
        return chapter;
    }

    public void setChapter(String chapter) {
        this.chapter = chapter;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    @Override
    public String toString() {
        return "PoetryDto{" +
                "poetryArray=" + Arrays.toString(poetryArray) +
                ", authorInfo='" + authorInfo + '\'' +
                ", title='" + title + '\'' +
                ", dynasty='" + dynasty + '\'' +
                ", author='" + author + '\'' +
                ", chapter='" + chapter + '\'' +
                ", section='" + section + '\'' +
                '}';
    }
}

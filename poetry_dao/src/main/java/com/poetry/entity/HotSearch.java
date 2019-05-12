package com.poetry.entity;

public class HotSearch {
    private Integer id;

    private String words;

    private Integer count;

    //搜索方式
    private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWords() {
        return words;
    }

    public void setWords(String words) {
        this.words = words;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "HotSearch{" +
                "id=" + id +
                ", words='" + words + '\'' +
                ", count=" + count +
                ", type=" + type +
                '}';
    }
}
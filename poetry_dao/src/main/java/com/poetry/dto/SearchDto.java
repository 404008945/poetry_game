package com.poetry.dto;

public class SearchDto {

    //搜索类型
    private int searchType;
    //搜索内容
    private String content;

    public int getSearchType() {
        return searchType;
    }

    public void setSearchType(int searchType) {
        this.searchType = searchType;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "SearchDto{" +
                "searchType=" + searchType +
                ", content='" + content + '\'' +
                '}';
    }
}

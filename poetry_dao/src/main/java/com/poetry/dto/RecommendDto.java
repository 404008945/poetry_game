package com.poetry.dto;

public class RecommendDto {
    //作者id
    Integer authorId;
    //朝代
    String dynasty;
    //类型
    String type;
    //哪一种选择
    Integer choose;

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getDynasty() {
        return dynasty;
    }

    public void setDynasty(String dynasty) {
        this.dynasty = dynasty;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getChoose() {
        return choose;
    }

    public void setChoose(Integer choose) {
        this.choose = choose;
    }

    @Override
    public String toString() {
        return "RecommendDto{" +
                "authorId=" + authorId +
                ", dynasty='" + dynasty + '\'' +
                ", type='" + type + '\'' +
                ", choose=" + choose +
                '}';
    }
}

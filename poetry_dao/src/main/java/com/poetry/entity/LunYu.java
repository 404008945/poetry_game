package com.poetry.entity;

public class LunYu {
    private Integer id;

    private String chapter;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getChapter() {
        return chapter;
    }

    public void setChapter(String chapter) {
        this.chapter = chapter;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "LunYu{" +
                "id=" + id +
                ", chapter='" + chapter + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
package com.poetry.entity;

import java.util.List;

public class Poetry {
    private Integer id;

    private String title;

    private String content;

    private  Integer infoId;

    private Integer authorId;

    private String yunlvRule;

    private String author;

    private  String dynasty;

    private  Integer likes;

    private List<CommentForPoetry> commentForPoetry;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getInfoId() {
        return infoId;
    }

    public void setInfoId(Integer infoId) {
        this.infoId = infoId;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getYunlvRule() {
        return yunlvRule;
    }

    public void setYunlvRule(String yunlvRule) {
        this.yunlvRule = yunlvRule;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDynasty() {
        return dynasty;
    }

    public void setDynasty(String dynasty) {
        this.dynasty = dynasty;
    }

    public Integer getLikes() {
        return likes;
    }

    public void setLikes(Integer likes) {
        this.likes = likes;
    }


    public List<CommentForPoetry> getCommentForPoetry() {
        return commentForPoetry;
    }

    public void setCommentForPoetry(List<CommentForPoetry> commentForPoetry) {
        this.commentForPoetry = commentForPoetry;
    }


    @Override
    public String toString() {
        return "Poetry{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", infoId=" + infoId +
                ", authorId=" + authorId +
                ", yunlvRule='" + yunlvRule + '\'' +
                ", author='" + author + '\'' +
                ", dynasty='" + dynasty + '\'' +
                ", likes=" + likes +
                ", commentForPoetry=" + commentForPoetry +
                '}';
    }

    @Override
    public int hashCode() {
        return this.id;
    }

    @Override
    public boolean equals(Object obj) {
        return this.id==((Poetry)obj).getId();
    }
}
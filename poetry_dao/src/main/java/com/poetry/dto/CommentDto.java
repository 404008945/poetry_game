package com.poetry.dto;

import com.poetry.entity.Comment;
import com.poetry.entity.User;

public class CommentDto {
    //评论
    Comment comment;
    //用户信息
    User user;

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "CommentDto{" +
                "comment=" + comment +
                ", user=" + user +
                '}';
    }
}

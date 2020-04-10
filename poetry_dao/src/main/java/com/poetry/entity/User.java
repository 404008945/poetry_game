package com.poetry.entity;

import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class User {
    private Integer id;
    //昵称
    @NotNull(message = "昵称不能为空")
    private String username;

    @NotNull(message = "密码不能为空")
    @Size(min = 6, max = 20, message = "密码长度必须在6-10之间")
    private String password;

    //账户
    @Size(min = 6, max = 20, message = "账户长度必须在8-15之间")
    private String account;

    private Integer totalNumber;

    private Integer winNumber;

    private Integer likeAuthorId;

    private String likeDynasty;

    private String likeType;

    private String image;

    //某用户的总访问量
    private Integer views;

    @Email
    private String email;

    private String qqOpenid;//qq登录的OPENID

    private  Integer highestScore;

    //0为普通账户
    //1为管理员账户
    private Integer type;

    public Integer getId() {
        return id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(Integer totalNumber) {
        this.totalNumber = totalNumber;
    }

    public Integer getWinNumber() {
        return winNumber;
    }

    public void setWinNumber(Integer winNumber) {
        this.winNumber = winNumber;
    }

    public Integer getLikeAuthorId() {
        return likeAuthorId;
    }

    public void setLikeAuthorId(Integer likeAuthorId) {
        this.likeAuthorId = likeAuthorId;
    }

    public String getLikeDynasty() {
        return likeDynasty;
    }

    public void setLikeDynasty(String likeDynasty) {
        this.likeDynasty = likeDynasty;
    }

    public String getLikeType() {
        return likeType;
    }

    public void setLikeType(String likeType) {
        this.likeType = likeType;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getQqOpenid() {
        return qqOpenid;
    }

    public void setQqOpenid(String qqOpenid) {
        this.qqOpenid = qqOpenid;
    }

    public Integer getHighestScore() {
        return highestScore;
    }

    public void setHighestScore(Integer highestScore) {
        this.highestScore = highestScore;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", account='" + account + '\'' +
                ", totalNumber=" + totalNumber +
                ", winNumber=" + winNumber +
                ", likeAuthorId=" + likeAuthorId +
                ", likeDynasty='" + likeDynasty + '\'' +
                ", likeType='" + likeType + '\'' +
                ", image='" + image + '\'' +
                ", views=" + views +
                ", email='" + email + '\'' +
                ", qqOpenid='" + qqOpenid + '\'' +
                ", highestScore=" + highestScore +
                ", type=" + type +
                '}';
    }
}
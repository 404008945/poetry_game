package com.poetry.entity;

public class Info {
    private Integer id;
    private String translate;
    private String enjoy;
    private String note;
    private String background;
    private String likes;
    private String type;

    @Override
    public String toString() {
        return "Info{" +
                "id=" + id +
                ", translate='" + translate + '\'' +
                ", enjoy='" + enjoy + '\'' +
                ", note='" + note + '\'' +
                ", background='" + background + '\'' +
                ", likes='" + likes + '\'' +
                ", type='" + type + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTranslate() {
        return translate;
    }

    public void setTranslate(String translate) {
        this.translate = translate;
    }

    public String getEnjoy() {
        return enjoy;
    }

    public void setEnjoy(String enjoy) {
        this.enjoy = enjoy;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    public String getLikes() {
        return likes;
    }

    public void setLikes(String likes) {
        this.likes = likes;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int hashCode() {
        return this.id;
    }

    public boolean equals(Object obj) {
        return this.id==((Info)obj).getId();
    }
}

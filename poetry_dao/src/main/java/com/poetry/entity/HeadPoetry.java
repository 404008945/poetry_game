package com.poetry.entity;

public class HeadPoetry {
    Integer type;
    Character character;

    public HeadPoetry()
    {

    }


    public HeadPoetry(Integer type, Character character) {
        this.type = type;
        this.character = character;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Character getCharacter() {
        return character;
    }

    public void setCharacter(Character character) {
        this.character = character;
    }

    @Override
    public String toString() {
        return "HeadPoetry{" +
                "type=" + type +
                ", character=" + character +
                '}';
    }
}

package com.poetry.service;

import com.poetry.entity.User;

public interface LoginService {
    User login(String account, String password);

    public boolean isRegister(String account);
}

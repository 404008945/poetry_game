package com.poetry.controller;

import com.poetry.entity.User;
import com.poetry.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    private String calendarPage() {
        return "calendar";
    }


}

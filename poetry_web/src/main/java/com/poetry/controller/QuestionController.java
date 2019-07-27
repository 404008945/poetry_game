package com.poetry.controller;

import com.poetry.entity.User;
import com.poetry.service.*;
import com.poetry.service.impl.QuestionServiceImpl;
import com.poetry.websocket.MySocketHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/question")
public class QuestionController {
    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private MySocketHandler mySocketHandler;
    @Autowired
    private FriendService friendService;

    @RequestMapping("/page")
    public String test() {
        return "hello";
    }

    @RequestMapping("/startPage")
    public String startPage(Model model) {
        int count = mySocketHandler.getCount();
        model.addAttribute("count", count);
        return "mainStart";
    }

    @RequestMapping("/play")
    public String play() {
        return "index";
    }

    @ModelAttribute  //所有controller执行前都要执行他
    public void dealCookie(HttpServletRequest req, HttpServletResponse resp) {
        Cookie[] cookies = req.getCookies();
        String acc = "";
        String psw = "";
        if (cookies != null) {

            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals("account")) {
                    //  Long lastAccessTime =Long.parseLong(tcookie.geValue());
                    acc = cookie.getValue();
                } else if (cookie.getName().equals("password")) {
                    psw = cookie.getValue();
                }
            }
            if (acc != null && !acc.equals("") && psw != null && !psw.equals("")) {
                User user = userService.getByAccount(acc);
                if (user.getPassword().equals(psw)) {
                    int count1 = messageService.getUnreadNum(user.getId());
                    int count2 = friendService.getRequestCount(user.getAccount());
                    req.getSession().setAttribute("messageNum", count1 + count2);
                    req.getSession().setAttribute("user", user);
                }
            }
        }
    }
}

package com.poetry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/im")
public class IMController {
    @RequestMapping("/page")
    public String im()
    {
        return "imPage";
    }
}

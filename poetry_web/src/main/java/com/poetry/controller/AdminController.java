package com.poetry.controller;

import com.github.pagehelper.PageInfo;
import com.poetry.entity.Author;
import com.poetry.entity.Info;
import com.poetry.entity.Poetry;
import com.poetry.entity.User;
import com.poetry.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

//后台管理控制器
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private PoetryAddService poetryAddService;

    @Autowired
    private PoetryService poetryService;

    @Autowired
    private InfoService infoService;

    @Autowired
    private AuthorService authorService;

    @Autowired
    private FriendService friendService;

    //跳到后台管理界面
    @RequestMapping("/main")
    public String index() {
        return "redirect:/admin/userPage/1";
    }

    //跳到诗词完善
    @RequestMapping("/poetryAdd/{page}")
    public String poetryAdd(@PathVariable("page") Integer page, Model model) {
        PageInfo pageInfo = poetryAddService.getAll(page, 3);
        model.addAttribute("pageInfo", pageInfo);
        return "admin_poetry";
    }

    //删除反馈
    @RequestMapping("/poetryAdd/remove/{id}")
    public String poetryAddRemove(@PathVariable("id") Integer id) {
        poetryAddService.remove(id);
        return "redirect:/admin/poetryAdd/1";
    }

    //跳到添加古诗界面
    @RequestMapping("/poetryAdd/addPage")
    public String poetryAddInsertPage() {
        return "poetry_add_2";
    }

    @RequestMapping("/poetryAdd/add")
    public String poetryAddInsert(HttpServletRequest request, Model model) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String author = request.getParameter("author");
        String background = request.getParameter("background");
        String enjoy = request.getParameter("enjoy");
        String note = request.getParameter("note");
        String translate = request.getParameter("translate");
        String type = request.getParameter("type");
        String dynasty = request.getParameter("dynasty");
        String intro = request.getParameter("intro");
        //添加作者
        Author author1 = new Author();
        author1.setDynasty(dynasty);
        author1.setIntro(intro);
        author1.setName(author);
        authorService.add(author1);
        //添加详情
        Info info = new Info();
        info.setBackground(background);
        info.setEnjoy(enjoy);
        info.setTranslate(translate);
        info.setNote(note);
        info.setType(type);
        infoService.add(info);
        //添加诗词
        Poetry poetry = new Poetry();
        poetry.setAuthor(author);
        poetry.setTitle(title);
        poetry.setContent(content);
        poetry.setDynasty(dynasty);
        poetry.setAuthorId(author1.getId());
        poetry.setInfoId(info.getId());
        poetryService.add(poetry);
        return "redirect:/admin/poetryAdd/1";
    }

    //用户管理界面
    @RequestMapping("/userPage/{page}")
    public String userPage(@PathVariable("page") Integer page, Model model) {
        PageInfo pageInfo = userService.getAll(page, 20);
        model.addAttribute("pageInfo", pageInfo);
        return "admin_user";
    }

    //删除用户
    @RequestMapping("/removeUser/{id}")
    public String removeUser(@PathVariable("id") Integer id, Model model) {
        userService.removeByPrimaryKey(id);
        return "redirect:/admin/userPage/1";
    }

    //用户编辑界面
    @RequestMapping("/editUserPage/{id}")
    public String editUserPage(@PathVariable("id") Integer id, Model model) {
        User user = userService.getByPrimaryKey(id);
        model.addAttribute("user", user);
        return "admin_edit_user";
    }

    @RequestMapping("/editUser/{id}")
    public String editUser(@PathVariable("id") Integer id, User user, Model model) {
        user.setId(id);
        userService.editByPrimaryKey(user);
        return "redirect:/admin/userPage/1";
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
                    acc = cookie.getValue();
                } else if (cookie.getName().equals("password")) {
                    psw = cookie.getValue();
                }
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

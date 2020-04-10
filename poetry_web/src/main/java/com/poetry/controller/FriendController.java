package com.poetry.controller;

import com.poetry.entity.Friend;
import com.poetry.entity.User;
import com.poetry.service.FriendService;
import com.poetry.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

@Controller
@RequestMapping("/friend")
public class FriendController {
    @Autowired
    private UserService userService;

    @Autowired
    private FriendService friendService;

    //跳转到用户搜索界面
    @RequestMapping("/searchPage")
    public String searchPage() {
        return "friend_search";
    }

    @RequestMapping("/search")
    public String search(HttpServletRequest request, Model model) {
        String account = request.getParameter("account");
        User login = (User) request.getSession().getAttribute("user");
        User user = userService.getByAccount(account);
        if (user != null) {
            //有搜索结果，返回结果列表页
            model.addAttribute("user", user);
            //判断是不是好友关系
            boolean isFriends = friendService.judgeFriends(login.getAccount(), user.getAccount());
            if (isFriends) {
                model.addAttribute("msg", "你们已经是好友啦");
            } else {
                if (login.getAccount().equals(user.getAccount())) {
                    //添加好友是自己
                    model.addAttribute("msg", "你和自己是最好的朋友");
                }
            }
            return "friend_search_list";
        } else {
            //搜索结果为空，携带消息返回搜索页
            request.setAttribute("msg", "未找到相关用户，请检查账号是否完整");
            return "friend_search";
        }
    }

    //添加好友
    @RequestMapping("/add")
    public String add(HttpServletRequest request, Model model) {
        String account = request.getParameter("account");
        String message = request.getParameter("message");
        if (account != null) {
            //向目标用户发送消息
            User user = (User) request.getSession().getAttribute("user");
            String fromUser = user.getAccount();
            friendService.add(fromUser, account, message);
            model.addAttribute("msg", "添加好友消息已发送~");
        }
        //判断请求路径
        String referer = request.getHeader("Referer");
        //1.http://localhost:8010/user/poetryDetail/34
        //2.http://localhost:8010/friend/search?account=world
        //第一种情况，从诗词详情界面添加好友
        if (referer.contains("poetryDetail")) {
            //获取诗词编号
            String[] split = referer.split("/");
            return "forward:/user/poetryDetail/" + split[split.length - 1];
        }
        //第二种情况，从好友搜索添加好友
        return "friend_search";
    }

    //好友请求信息处理结果
    @RequestMapping("/requestResult")
    public String requestResult(Model model, HttpServletRequest request) {
        String result = request.getParameter("result");
        int messageId = Integer.valueOf(request.getParameter("messageId"));

        if (result.equals("1")) {
            //将check字段设置为1
            Friend friend = friendService.getByPrimaryKey(messageId);

            friend.setCheck(true);
            friendService.editByPrimaryKey(friend);
            //跳转到主页，顺便显示好友
        } else {
            //删除该条记录
            friendService.removeByPrimaryKey(messageId);
            //跳转到主页，顺便显示好友
        }
        return "redirect:/user/message";
    }
}

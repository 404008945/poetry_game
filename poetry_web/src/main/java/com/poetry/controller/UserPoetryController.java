package com.poetry.controller;

import com.github.pagehelper.PageInfo;
import com.poetry.dto.CommentDto;
import com.poetry.dto.PoetryDto;
import com.poetry.dto.PoetrySquareDto;
import com.poetry.dto.RequestDto;
import com.poetry.entity.*;
import com.poetry.service.*;
import com.poetry.utils.PoetryUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserPoetryController {

    @Autowired
    private UserPoetryService userPoetryService;

    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private PoetryService poetryService;

    @Autowired
    private LikesService likesService;

    @Autowired
    private MessageService messageService;

    //藏头诗相关
    @Autowired
    private Poetry1Service poetry1Service;

    @Autowired
    private FriendService friendService;

    //跳转写诗界面
    @RequestMapping("/writePage")
    public String writePage() {
        return "publish";
    }

    //写诗
    @RequestMapping("/write")
    public String write(UserPoetry userPoetry, HttpServletRequest request) {
        //保存诗词
        User user = (User) request.getSession().getAttribute("user");
        //设置该诗的作者id
        userPoetry.setUserId(user.getId());
        userPoetry.setUsername(user.getUsername());
        userPoetryService.add(userPoetry);
        //跳转诗词广场
        return "redirect:/user/poetrySquare/1?type=0";
    }

    //进入诗词广场
    @RequestMapping("/poetrySquare/{page}")
    public String listPage(@PathVariable("page") Integer page, Model model, HttpServletRequest request) {
        String type = request.getParameter("type");
        if (type != null) {
            //第一次分类搜索
            request.getSession().setAttribute("type", type);
        } else {
            type = (String) request.getSession().getAttribute("type");
        }
        //用来保存每首诗的前几句
        List<PoetrySquareDto> poetrySquareDtos = new ArrayList<>();
        PoetrySquareDto poetrySquareDto;
        List<String> strings = new ArrayList<>();
        List<String> userNames = new ArrayList<>();
        PageInfo pageInfo = null;
        if (type.equals("0")) {
            //按时间搜索
            pageInfo = userPoetryService.getAllByTime(page, 6);
        } else if (type.equals("1")) {
            //按热度搜索
            pageInfo = userPoetryService.getAllByLikes(page, 6);
        }
        List<UserPoetry> userPoetryList = pageInfo.getList();
        int a = 0;
        for (UserPoetry userPoetry : userPoetryList) {
            String content = userPoetry.getContent();
            poetrySquareDto = new PoetrySquareDto();
            if (content.length() < 13) {
                poetrySquareDto.setPoetryPart(content.substring(0, content.length() / 2) + "......");
            } else {
                poetrySquareDto.setPoetryPart(content.substring(0, 10) + "......");
            }
            poetrySquareDto.setColors(PoetryUtils.getColors()[a++]);
            poetrySquareDto.setUserNames(userService.getByPrimaryKey(userPoetry.getUserId()).getUsername());
            poetrySquareDto.setUserPoetry(userPoetry);
            poetrySquareDtos.add(poetrySquareDto);
        }
        model.addAttribute("poetrySquareDtos", poetrySquareDtos);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("title", "诗词广场");
        model.addAttribute("content", "春风十里不如你,三里桃花不及卿。");
        return "poetry_square";
    }

    //进入用户诗词详情
    @RequestMapping("/poetryDetail/{id}")
    public String poetryDetail(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
        //获取诗
        PoetryDto poetryDto = new PoetryDto();
        UserPoetry userPoetry = userPoetryService.getByPrimaryKey(id);
        Integer userId = userPoetry.getUserId();
        model.addAttribute("userId", userId);
        //该诗的作者
        User author = userService.getByPrimaryKey(userPoetry.getUserId());
        User user = (User) request.getSession().getAttribute("user");
        //判段用户是否点赞过
        if (user != null) {
            boolean flag = false;
            List<Likes> likes = likesService.getByUserId(user.getId());
            for (Likes likes1 : likes) {
                if (likes1.getPoetryId() == id) {
                    //点赞过
                    flag = true;
                }
            }
            model.addAttribute("flag", flag);
        }
        //作者的总浏览量加1
        userService.addViews(author.getId());
        //浏览量加1(除作者外)
        if (user == null) {
            userPoetryService.addViews(id);
        } else if (user.getId() != userPoetry.getUserId()) {
            userPoetryService.addViews(id);
        }
        poetryDto.setTitle(userPoetry.getTitle());
        poetryDto.setAuthor(author.getUsername());
        poetryDto.setPoetryArray(PoetryUtils.getPoetryArray(userPoetry.getContent()));
        model.addAttribute("poetryDto", poetryDto);
        //将该诗的id传入
        model.addAttribute("poetryId", id);

        //获取该诗的评论
        List<Comment> comments = commentService.getByPoetryId(id);
        List<CommentDto> commentDto = new ArrayList<>();
        CommentDto dto;
        Comment comment;
        for (int i = 0; i < comments.size(); i++) {
            comment = comments.get(i);
            dto = new CommentDto();
            dto.setComment(comment);
            dto.setUser(userService.getByPrimaryKey(comment.getUserId()));
            commentDto.add(dto);
        }
        model.addAttribute("commentDto", commentDto);

        //判断用户是不是和诗的作者是好友
        if (user != null) {
            boolean flag = friendService.judgeFriends(user.getAccount(), author.getAccount());
            model.addAttribute("isFriend", flag);
        }
        model.addAttribute("account1", author.getAccount());
        return "user_poetry_detail";
    }

    //评论
    @RequestMapping("/comment/{id}")
    public String comment(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
        //提交评论
        String content = request.getParameter("comment");
        //获取当前用户
        User user = (User) request.getSession().getAttribute("user");
        Comment comment = new Comment();
        comment.setContent(content);
        comment.setPoetryId(id);
        comment.setUserId(user.getId());
        commentService.add(comment);
        //每增加一条评论,则添加一条消息
        Message message = new Message();
        UserPoetry poetry = userPoetryService.getByPrimaryKey(id);
        //获取评论用户的用户名
        String username = user.getUsername();
        //获取该诗的作者id
        Integer userId = poetry.getUserId();
        message.setFromId(user.getId());
        message.setToId(userId);
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        Date date = new Date();
        String time = format.format(date);
        //拼接消息字符串
        String info = "在" + time + " [" + username + "] " + "评论了你的作品《" + poetry.getTitle() + "》，" + "评论内容是:" + content;
        message.setInfo(info);
        message.setTime(date);
        if (message.getFromId() != message.getToId()) {
            //只有别人评论才添加
            messageService.add(message);
        }
        return "redirect:/user/poetryDetail/" + id;
    }

    //删除评论
    @RequestMapping("/comment/delete/{id}")
    public String deleteComment(@PathVariable("id") Integer id) {
        Comment comment = commentService.getByPrimaryKey(id);
        commentService.removeByPrimaryKey(id);
        return "redirect:/user/poetryDetail/" + comment.getPoetryId();
    }

    //删除不合法诗词
    @RequestMapping("/poetry/delete/{id}")
    public String deletePoetry(@PathVariable("id") Integer id) {
        userPoetryService.removeByPrimaryKey(id);
        return "forward:/user/poetrySquare/1?type=0";
    }


    //显示某个人的诗词
    @RequestMapping("/poetry/{id}/{page}")
    public String poetryList(@PathVariable("id") Integer id,
                             @PathVariable("page") Integer page, Model model) {
        //用来保存每首诗的前几句
        List<PoetrySquareDto> poetrySquareDtos = new ArrayList<>();
        User user = userService.getByPrimaryKey(id);
        PoetrySquareDto poetrySquareDto;
        List<String> strings = new ArrayList<>();
        List<String> userNames = new ArrayList<>();
        PageInfo pageInfo = userPoetryService.getByUserId(id, page, 6);
        List<UserPoetry> userPoetryList = pageInfo.getList();
        int a = 0;
        for (UserPoetry userPoetry : userPoetryList) {
            String content = userPoetry.getContent();
            poetrySquareDto = new PoetrySquareDto();
            if (content.length() < 13) {
                poetrySquareDto.setPoetryPart(content.substring(0, content.length() / 2) + "......");
            } else {
                poetrySquareDto.setPoetryPart(content.substring(0, 10) + "......");
            }
            poetrySquareDto.setColors(PoetryUtils.getColors()[a++]);
            poetrySquareDto.setUserNames(userService.getByPrimaryKey(userPoetry.getUserId()).getUsername());
            poetrySquareDto.setUserPoetry(userPoetry);
            poetrySquareDtos.add(poetrySquareDto);
        }
        model.addAttribute("poetrySquareDtos", poetrySquareDtos);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("title", "欢迎来到&nbsp;&lt;" + user.getUsername() + "&gt;&nbsp;的诗词世界");
        model.addAttribute("content", "春风十里不如你,三里桃花不及卿。");
        model.addAttribute("userId", id);
        return "user_poetry_list";
    }

    //跳转到藏头诗生成界面
    @RequestMapping("/headPoetryPage")
    public String headPoetryPage(Model model) {
        model.addAttribute("title", "趣玩——藏头诗");
        model.addAttribute("content", "藏头诗，又名“藏头格”，是杂体诗中的一种，每句的第一个字连起来读，可以传达作者的某种特有的思想。");
        return "head_poetry";
    }

    //藏头诗生成
    @RequestMapping("/headPoetry/make")
    public String makePoetry(String title, Integer type, Model model) {
        //去掉标点符号
        title = title.replace("，", "");
        title = title.replace("。", "");
        title = title.replace("？", "");
        title = title.replace("！", "");
        title = title.replace(" ", "");
        List<String> list = poetry1Service.getHeadPoetry(title, type);
        if (list == null) {
            model.addAttribute("error", "匹配失败,换些字再试试吧。");
            return "forward:/user/headPoetryPage";
        }
        model.addAttribute("poetryArray", list);
        return "head_poetry_detail";
    }

    @RequestMapping("/likes")
    public void likes(@RequestParam("poetryId") Integer id, @RequestParam("likes") Boolean likes, HttpServletRequest request) {
        //用户必须登录才能点赞
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {

            if (likes) {
                //添加赞
                Likes likes1 = new Likes();
                likes1.setUserId(user.getId());
                likes1.setPoetryId(id);
                likesService.add(likes1);
                userPoetryService.addLikes(id);
                //添加消息
                Message message = new Message();
                message.setFromId(user.getId());
                Integer poetryUserId = userPoetryService.getByPrimaryKey(id).getUserId();
                String title = userPoetryService.getByPrimaryKey(id).getTitle();
                message.setToId(poetryUserId);
                String username = user.getUsername();
                SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
                Date date = new Date();
                String time = format.format(date);
                String info = "在" + time + " [" + username + "] " + "认为你的作品《" + title + "》" + "很赞！";
                message.setInfo(info);
                message.setTime(date);
                if (message.getFromId() != message.getToId()) {
                    //只有别人点赞才添加
                    messageService.add(message);
                }
            } else {
                //取消赞
                likesService.remove(user.getId(), id);
                userPoetryService.subLikes(id);
            }
        }
    }

    //进入查看消息界面
    @RequestMapping("/message")
    public String message(Model model, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        //未读消息
        List<Message> messagesN = messageService.getByUserIdN(user.getId());
        model.addAttribute("messagesN", messagesN);
        //已读消息
        List<Message> messagesY = messageService.getByUserIdY(user.getId());
        model.addAttribute("messagesY", messagesY);
        messageService.setRead(user.getId());

        //添加验证消息
        List<RequestDto> requestDtos = friendService.getRequest(user.getAccount());
        model.addAttribute("requestMessage", requestDtos);
        return "message";
    }

    //删除历史消息
    @RequestMapping("/removeMessage")
    public String removeMessage(HttpServletRequest request) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        messageService.removeByPrimaryKey(id);
        return "redirect:/user/message";
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

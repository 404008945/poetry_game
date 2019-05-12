package com.poetry.controller;

import com.poetry.entity.CommentForPoetry;
import com.poetry.entity.LikesForPoetry;
import com.poetry.entity.User;
import com.poetry.service.CommentForPoetryService;
import com.poetry.service.LikesForPoetryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentForPoetryService commentForPoetryService;//对评论做插入操作

    @Autowired
    private LikesForPoetryService likesForPoetryService;


    @RequestMapping(value="/submit",method= RequestMethod.POST)
    public String comment( CommentForPoetry commentForPoetry){//自动注入评论对象
        //需要诗的id用户的id
        System.out.println(commentForPoetry.getContent());
        commentForPoetry.setTime(new Date());
        commentForPoetryService.insert(commentForPoetry);

        return "redirect:/enjoy/detail_poetry/"+commentForPoetry.getPoetryId();
    }

    @RequestMapping(value="/dofavor",method= RequestMethod.POST )
    public  void favor(@RequestParam("pid") Integer  pid,@RequestParam("like")Boolean like, HttpServletRequest request)//拿到连个id建立关系即可
    {

        System.out.println(pid+"   "+like);
        int uid = ((User) request.getSession().getAttribute("user")).getId();
        if(like) {
            LikesForPoetry likes = new LikesForPoetry();
            likes.setPoetryId(pid);
            likes.setUserId(uid);
            this.likesForPoetryService.insert(likes);
        }else
        {
            likesForPoetryService.deleteByPrimaryKey(likesForPoetryService.selectByInfo(uid,pid).getId());
        }



    }
}

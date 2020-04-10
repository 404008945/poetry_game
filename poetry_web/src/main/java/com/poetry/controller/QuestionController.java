package com.poetry.controller;

import com.poetry.entity.Question;
import com.poetry.entity.User;
import com.poetry.game.OnlineUserOperator;
import com.poetry.service.*;
import com.poetry.service.impl.QuestionServiceImpl;
import com.poetry.websocket.MySocketHandler;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

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
    private OnlineUserOperator onlineUserOperator;
    @Autowired
    private FriendService friendService;

    @RequestMapping("/page")
    public String test() {
        return "hello";
    }

    @RequestMapping("/startPage")
    public String startPage(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        User user1 = userService.getByAccount(user.getAccount());
        session.setAttribute("user", user1);
        int count = onlineUserOperator.getOnlineCount();
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
    @GetMapping("/singleplayer")
    public  String  single(Model model){
        System.out.println(userService.findByAccount("404008941"));
        List<Question> questions=questionService.selectByRandom();
      for(int i=0;i<questions.size();i++)
      {
          questions.get(i).setTitle(i+1+"、"+questions.get(i).getTitle());
          questions.get(i).setOptiona("A:"+questions.get(i).getOptiona());
          questions.get(i).setOptionb("B:"+questions.get(i).getOptionb());
          questions.get(i).setOptionc("C:"+questions.get(i).getOptionc());
      }
        model.addAttribute("questions",questions);
        return "singleplay";
    }


    @ResponseBody
    @GetMapping("/updateScore")
    public String  updateHighestScore(Integer score,HttpServletRequest request){

        User user=(User)request.getSession().getAttribute("user");
        user.setHighestScore(score);
        userService.updateByPrimaryKey(user);
        //更新分数
        JSONObject jsonObject=new JSONObject();

        jsonObject.put("success","success");

        return jsonObject.toString();
    }

}

package com.poetry.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.poetry.entity.*;
import com.poetry.global.ConstantValue;
import com.poetry.service.*;
import com.poetry.utils.QQConnectUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

//登录注册功能处理
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private UserPoetryService userPoetryService;

    @Autowired
    private LikesService likesService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private AuthorService authorService;

    @Autowired
    private FriendService friendService;

    private String openId = null;

    //进入登录界面
    @RequestMapping("/loginPage")
    public String loginPage(Model model, HttpServletRequest request, HttpServletResponse response) {
      /*  Cookie[] cookies = request.getCookies();
        User user = new User();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("account")) {
                user.setAccount(cookie.getValue());
            } else if (cookie.getName().equals("password")) {
                user.setPassword(cookie.getValue());
            }
        }
        model.addAttribute("user", user);*/
        return "login";
    }

    //防止csrf攻击
    @GetMapping("/login/qq")
    public String qqConnect(HttpSession session) {
        String state = UUID.randomUUID().toString().replaceAll("-", "");
        String url = "https://graph.qq.com/oauth2.0/show?which=Login&display=pc&response_type=code&client_id=101741032&redirect_uri=http://onuoo.cn:8080/login&state=";
        session.setAttribute("qqState", state);
        return "redirect:" + url + state;
    }

    @GetMapping("/login")
    public String loginPage(String code, String state, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        System.out.println("获取到到code" + code);
        System.out.println("获取到state" + state);
        String state2 = (String) session.getAttribute("qqState");
      /*  if (state2 == null) {//说明没去腾讯登录
            return "redirect:/login/qq";
        } else if (!state2.equals(state)) {
            return "redirect:/login/qq";
        } else {*/
        String token = QQConnectUtil.getAccessToken(code);
        String openid = QQConnectUtil.getOpenid(token);
        openId = openid;
        JsonNode info = QQConnectUtil.getUserInfo(openid, token);
        //如果是老用户则直接通过OpenId查询用户信息，登录
        //1.如果OPENID不存在，则证明是新用户，让其绑定已有账户，或者新注册一个
        //2.在或者：必须先注册好账号，在个人中心绑定qq
        //新用户只用填写用户名，其他信息都在个人中心修改
        User user = userService.getByQqOpenid(openid);
        if (user == null) {//新用户
            session.setAttribute("qqInfo", info);
            session.setAttribute("nickname", info.get("nickname").asText());
            session.setAttribute("figureurl_qq_1", info.get("figureurl_qq_1").asText());
            return "redirect:/bind";
        } else {//老用户
            User u = userService.getByAccount(user.getAccount());
            session.setAttribute("user", u);
            return "redirect:/enjoy/index";
        }
    }


    @PostMapping("/loginAccount")
    public String loginAccount(HttpSession session, String account, String password, Model model) {
        System.out.println("......." + account);
        User user = userService.findByAccountAndPassword(account, password);
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/enjoy/index";
        } else {
            model.addAttribute("loginErr", "用户名或密码错误");
            return "login";
        }
    }

    @GetMapping("/bind")
    public String bind() {
        return "bind";
    }


    //绑定qq
    @PostMapping("/bind/qq/user")
    public String bindUser(String account, String password, HttpSession session, Model model) {
        JsonNode qqInfo = (JsonNode) session.getAttribute("qqInfo");
        System.out.println(account);
        System.out.println(password);
        if (qqInfo == null) {
            model.addAttribute("qqError", "QQ登录信息不存在");
            return "bind";
        } else {
            User user = userService.findByAccountAndPassword(account, password);
            if (user == null) {
                model.addAttribute("loginError", "用户名或密码不正确");
                return "bind";
            } else {
                System.out.println(openId);
                user.setQqOpenid(openId);
                userService.update(user);
                User u = userService.getByQqOpenid(openId);
                session.setAttribute("user", u);
                return "redirect:/enjoy/index";
            }
        }
    }

    //注册qq
    @PostMapping("/bind/qq/create")
    public String bindCreate(String account, String password, HttpSession session, Model model) {
        JsonNode qqInfo = (JsonNode) session.getAttribute("qqInfo");
        System.out.println(account);
        System.out.println(password);
        if (qqInfo == null) {
            return "bind";
        } else {
            User user = userService.findByAccount(account);
            if (user != null) {
                return "bind";
            }
            User user1 = new User();
            user1.setAccount(account);
            user1.setPassword(password);
            user1.setQqOpenid(openId);
            user1.setUsername(qqInfo.get("nickname").asText());
            user1.setImage(qqInfo.get("figureurl_qq_1").asText());
            user1.setTotalNumber(0);
            user1.setWinNumber(0);
            user1.setViews(0);
            user1.setType(0);
            userService.save(user1);
            User u = userService.getByAccount(account);
            session.setAttribute("user", u);
            return "redirect:/choosePage";
        }
    }


   /* //登录
    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        User login = loginService.login(user.getAccount(), user.getPassword());
        if (login != null) {
            request.getSession().setAttribute("user", login);
            if (request.getParameter("remember") != null) {
                //记住密码
                Cookie cookie1 = new Cookie("account", user.getAccount());
                //有效期为十天
                cookie1.setMaxAge(60 * 60 * 24 * 10);
                Cookie cookie2 = new Cookie("password", user.getPassword());
                cookie2.setMaxAge(60 * 60 * 24 * 10);
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            } else {
                //清除cookie
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("account")) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    } else if (cookie.getName().equals("password")) {
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }
            String writePage = (String) request.getSession().getAttribute("writePage");
            if (writePage != null && writePage.equals("1")) {
                //跳转到写诗界面并销毁相应session属性
                request.getSession().removeAttribute("writePage");
                return "redirect:/user/writePage";
            }
            //将消息个数放到session中
            int count1 = messageService.getUnreadNum(login.getId());
            int count2 = friendService.getRequestCount(login.getAccount());
            request.getSession().setAttribute("messageNum", count1 + count2);
            return "redirect:/enjoy/index";
        }
        //把错误密码清除掉
        user.setPassword(null);
        model.addAttribute("user", user);
        model.addAttribute("error", "用户名或密码错误，请重试");
        return "login";
    }

    //跳转到注册界面
    @RequestMapping("/registerPage")
    public String registerPage(Model model) {
        return "register";
    }

    //注册
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@RequestParam("file") MultipartFile file, @Valid User user, Errors errors, Model model, HttpServletRequest request) throws IOException {
        if (errors.getErrorCount() > 0) {
            model.addAttribute("errors", errors.getFieldErrors());
            model.addAttribute("users", user);
            //重新注册
            return "register";
        } else {
            model.addAttribute("errors", null);
            if (request.getParameter("passwordAgain") != null && request.getParameter("passwordAgain").equals(user.getPassword())) {
                //处理文件上传
                //获取文件上传名字
                String filename = file.getOriginalFilename();
                //获取文件后缀
                String substring = filename.substring(filename.lastIndexOf('.'));

                String dir = request.getServletContext().getRealPath("/image");

                //随机获取一个名字
                String newFileName = String.valueOf(System.currentTimeMillis()) + substring;
                File file1 = new File(dir, newFileName);
                if (!file1.getParentFile().exists()) {
                    file1.getParentFile().mkdirs();
                }
                file.transferTo(file1);
                //处理添加用户
                user.setImage(newFileName);
                userService.insert(user);
                model.addAttribute("user", user);
                //注册完跳转到个性化界面
                request.getSession().setAttribute("userId", user.getId());
                return "redirect:/choosePage";
            } else {
                //两次密码不一样
                model.addAttribute("users", user);
                model.addAttribute("error", "两次密码不一致");
                return "register";
            }
        }
    }*/

    @RequestMapping("/choosePage")
    public String choosePage(Model model, HttpServletRequest request) {
        //选择所有的作者，诗词类型，朝代
        List<Author> authors = authorService.getAllAuthor();
        List<String> dynasty = authorService.getAllDynasty();
        List<String> category = ConstantValue.getAllCategory();
        model.addAttribute("authors", authors);
        model.addAttribute("dynasty", dynasty);
        model.addAttribute("category", category);
        return "choose";
    }

    //保存用户选择的个性化选项
    @RequestMapping("/choose_enjoy")
    public String choose(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("user");
        //诗词类型
        String type = request.getParameter("type");
        //作者id
        Integer authorId = Integer.valueOf(request.getParameter("authorId"));
        //朝代
        String dynasty = request.getParameter("dynasty");
        //更新用户信息
        user.setLikeType(type);
        user.setLikeAuthorId(authorId);
        user.setLikeDynasty(dynasty);
        userService.editByPrimaryKey(user);
        request.getSession().setAttribute("user", user);
        return "redirect:/enjoy/index";
    }

    //使用ajax判断账户名是否已经被注册
    @RequestMapping("/accountTest")
    public void accountTest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        String account = request.getParameter("account");
        boolean isRegister = loginService.isRegister(account);
        if (isRegister) {
            //被注册过
            writer.print("false");
        } else {
            writer.print("true");
        }
    }

    //跳转到忘记密码页面
    @RequestMapping("/forgetPage")
    public String forgetPage() {
        return "forget";
    }

    //处理忘记密码
    @RequestMapping("/forget")
    public String forget(Model model, HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        User user = userService.getByEmail(email);
        if (user == null) {
            //邮箱输入错误
            model.addAttribute("error", "请输入注册账号时的邮箱");
            return "forget";
        } else {
            //实例化一个发送邮件的对象
            SendMail mySendMail = new SendMail();
            //发送邮件
            mySendMail.sendMail(email, "极简诗社提醒，您的密码为：" + user.getPassword());
            return "redirect:/loginPage";
        }
    }

    //转到个人信息展示界面
    @RequestMapping("/userInfo")
    public String userInfoPage(HttpServletRequest request, Model model) {
        double win;
        int likesNum;
        String winStr;
        User u = (User) request.getSession().getAttribute("user");
        User user = userService.getByAccount(u.getAccount());
        System.out.println(user);
        user.setViews(userPoetryService.getAllViewsByUserId(user.getId()));
        model.addAttribute("user", user);
        //计算胜率
        Integer totalNumber = user.getTotalNumber();
        Integer winNumber = user.getWinNumber();
        if (totalNumber == 0) {
            winStr = "0.00%";
        } else {
            win = (winNumber * 1.0) / (totalNumber * 1.0);
            win = win * 100;
            DecimalFormat df = new DecimalFormat("#.00");
            winStr = df.format(win) + "%";
        }
        model.addAttribute("win", winStr);
        //计算作品总点赞量
        likesNum = userPoetryService.getAllLikesByUserId(user.getId());
        model.addAttribute("likesNum", likesNum);
        //用户喜欢的作者
        String authorName = authorService.getById(user.getLikeAuthorId()).getName();
        model.addAttribute("authorName", authorName);
        return "info";
    }

    //转到修改信息界面
    @RequestMapping("/updateInfoPage")
    public String updateInfoPage(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user", user);
        return "update_info";
    }

    //修改信息
    @RequestMapping("/update/{id}")
    public String updateInfo(@PathVariable("id") Integer id, @Valid User user, Errors errors, HttpServletRequest request, Model model) {
        user.setId(id);
        //修改密码，必须两次密码输入的都正确
        if (errors.getErrorCount() > 0) {
            model.addAttribute("errors", errors.getFieldErrors());
            model.addAttribute("user", user);
            //重新修改
            return "update_info";
        } else if (request.getParameter("passwordAgain") != null && user.getPassword().equals(request.getParameter("passwordAgain"))) {
            //可以修改
            user.setId(id);
            userService.editByPrimaryKey(user);
            //更新session中的user
            User userNew = userService.getByPrimaryKey(id);
            request.getSession().setAttribute("user", userNew);
            model.addAttribute("success", "恭喜，信息修改成功");
            return "forward:/userInfo";
        } else {
            user.setPassword(null);
            model.addAttribute("user", user);
            model.addAttribute("error", "两次密码输入不一致,请重新输入");
            return "update_info";
        }
    }

    //退出登录
    @RequestMapping("/logout")
    public String logOut(HttpServletRequest request, HttpServletResponse response) {
        //清空session记录
        request.getSession().invalidate();
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("account")) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            } else if (cookie.getName().equals("password")) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        return "redirect:/loginPage";
    }

    //转到个人空间
    @RequestMapping("/zone")
    public String zone(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("user");
        List<UserPoetry> likePoetry = userPoetryService.getByUserLike(user.getId());
        List<UserPoetry> poetry = userPoetryService.getByUserId(user.getId());
        //自己写的诗
        model.addAttribute("poetry", poetry);
        //点赞的诗
        model.addAttribute("likes", likePoetry);
        return "likes";
    }

    //删除用户诗词
    @RequestMapping("/poetry/delete/{id}")
    public String deletePoetry(@PathVariable("id") Integer id) {
        userPoetryService.removeByPrimaryKey(id);
        return "redirect:/zone";
    }

    //跳转到修改用户诗词界面
    @RequestMapping("/poetry/editPage/{id}")
    public String editPoetryPage(@PathVariable("id") Integer id, Model model) {
        UserPoetry poetry = userPoetryService.getByPrimaryKey(id);
        model.addAttribute("poetry", poetry);
        return "edit_poetry";
    }

    //修改用户诗词
    @RequestMapping("/poetry/edit/{id}")
    public String editPoetry(@PathVariable("id") Integer id, UserPoetry poetry, Model model) {
        poetry.setId(id);
        poetry.setTime(new Date());
        userPoetryService.editByPrimaryKey(poetry);
        return "redirect:/zone";
    }

    //快速注册
    @RequestMapping("/fastReg")
    public String fastReg(Model model) {
        return "fast_reg";
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

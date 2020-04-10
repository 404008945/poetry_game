package com.poetry.controller;

import com.github.pagehelper.PageInfo;
import com.poetry.dto.*;
import com.poetry.entity.*;
import com.poetry.global.ConstantValue;
import com.poetry.service.*;
import com.poetry.utils.PoetryUtils;
import com.poetry.utils.PreDayPoetryUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/enjoy")
public class PoetryController {
    @Autowired
    private PoetryService poetryService;

    @Autowired
    private AuthorService authorService;

    @Autowired
    private InfoService infoService;

    @Autowired
    private PoemsService poemsService;

    @Autowired
    private PoetryAuthorService poetryAuthorService;

    @Autowired
    private PoemsAuthorService poemsAuthorService;

    @Autowired
    private ShiJingService shiJingService;

    @Autowired
    private LunYuService lunYuService;

    @Autowired
    private HotSearchService hotSearchService;

    @Autowired
    private UserService userService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private CommentForPoetryService commentForPoetryService;

    @Autowired
    private LikesForPoetryService likesForPoetryService;

    @Autowired
    private PoetryAddService poetryAddService;

    @Autowired
    private FriendService friendService;

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

    //猜你喜欢
    @RequestMapping("/recommend")
    public String recommend(Model model, HttpServletRequest request) {
        RecommendDto dto = new RecommendDto();
        User user = (User) request.getSession().getAttribute("user");
        User u = userService.getByAccount(user.getAccount());
        Integer likeAuthorId = u.getLikeAuthorId();
        String likeDynasty = u.getLikeDynasty();
        String likeType = u.getLikeType();
        Random random = new Random();
        //产生0,1,2随机数
        int i = random.nextInt(3);
        dto.setChoose(i);
        dto.setAuthorId(likeAuthorId);
        dto.setDynasty(likeDynasty);
        dto.setType(likeType);
        Poetry poetry = poetryService.getByRecommend(dto);

        return "redirect:/enjoy/detail_poetry/" + poetry.getId();
    }

    @RequestMapping("/index")
    public String mainPage(Model model) {
        Boolean type = false;
        PoetryInfo poetryInfo = PreDayPoetryUtil.getPoetry(type);
        model.addAttribute("poetryInfo", poetryInfo);
        model.addAttribute("type", type);
        return "main";
    }

    @RequestMapping("/deleteComment/{pid}/{cid}")
    public String deleteComment(@PathVariable("pid") Integer pid, @PathVariable("cid") Integer cid) {
        commentForPoetryService.deleteByPrimaryKey(cid);
        return "redirect:/enjoy/detail_poetry/" + pid;
    }

    //展示诗词细节
    @RequestMapping("/detail_poetry/{id}")
    public String poetryDetail(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
        PoetryDto dto = new PoetryDto();
        Poetry poetry = poetryService.getById(id);
        for (int i = 0; i < poetry.getCommentForPoetry().size(); i++) {
            poetry.getCommentForPoetry().get(i).setUser(userService.getByPrimaryKey(poetry.getCommentForPoetry().get(i).getUserId()));
        }
        Info info1 = infoService.getByPrimaryKey(poetry.getInfoId());
        String str[] = info1.getType().split("，");
        Set<Integer> infos = new HashSet<>();
        for (String s : str) {
            for (Info info : infoService.selectByType(s)) {
                infos.add(info.getId());
            }
        }

        List<Poetry> list = new ArrayList<>();
        for (Integer c : infos) {
            Poetry poetry1 = poetryService.getById(c);
            list.add(poetry1);
        }

        while (list.size() > 5) {
            list.remove(list.size() - 1);
        }
        model.addAttribute("recommendPoetry", list);
        Author author = authorService.getById(poetry.getAuthorId());
        Info info = infoService.getByPrimaryKey(poetry.getInfoId());
        model.addAttribute("poetry", poetry);
        model.addAttribute("type", poetry.getContent().charAt(poetry.getContent().length() - 1) == '~');
        if (poetry.getContent().charAt(poetry.getContent().length() - 1) == '~') {
            poetry.setContent(poetry.getContent().substring(0, poetry.getContent().length() - 1));
        }
        String content[] = poetry.getContent().split("\r\n");
        model.addAttribute("content", content);//数组元素
        model.addAttribute("author", author);
        info.setNote(info.getNote().replace("\r\n", "<br>"));
        info.setEnjoy(info.getEnjoy().replace("\r\n", "<br>"));
        info.setBackground(info.getBackground().replace("\r\n", "<br>"));
        info.setTranslate(info.getTranslate().replace("\r\n", "<br>"));
        model.addAttribute("info", info);
        boolean flag = false;//判断是否已经点赞
        if (request.getSession().getAttribute("user") != null) {
            int uid = ((User) request.getSession().getAttribute("user")).getId();

            if (likesForPoetryService.selectByInfo(uid, id) != null) {
                flag = true;
            }
        }
        model.addAttribute("flag", flag);
        return "poetry_detail";
    }

    //处理唐
    @RequestMapping("/tangshi_list/{page}")
    public String tangshiList(Model model, @PathVariable("page") Integer page) {
        PageInfo pageInfo = poetryService.getByDynasty("唐", page, 6);
        List<PoetryListInfo> infoList = new ArrayList<>();
        List<Poetry> list = pageInfo.getList();
        String[] colors = PoetryUtils.getColors();
        int i = 0;
        for (Poetry poetry : list) {
            PoetryListInfo info = new PoetryListInfo();
            info.setPoetry(poetry);
            info.setCommentsNum(commentForPoetryService.getCommentsNum(poetry.getId()));
            info.setLikesNum(likesForPoetryService.getLikesNum(poetry.getId()));
            info.setColor(colors[i]);
            infoList.add(info);
            i++;
        }
        model.addAttribute("infos", infoList);
        model.addAttribute("type", "唐代");
        model.addAttribute("poetryValue", ConstantValue.TANGSHI_VALUE);
        //地址拼接字段
        model.addAttribute("type1", "tangshi_list");
        model.addAttribute("pageInfo", pageInfo);
        return "poetry_list";
    }

    //处理宋
    @RequestMapping("/songshi_list/{page}")
    public String songshiList(@PathVariable("page") Integer page, Model model) {
        return common(page, "songshi_list", "宋代", ConstantValue.SONGSHI_VALUE, "宋", model);
    }

    public String common(Integer page, String type1, String type, String poetryValue, String dynasty, Model model) {
        PageInfo pageInfo = poetryService.getByDynasty(dynasty, page, 6);
        List<PoetryListInfo> infoList = new ArrayList<>();
        List<Poetry> list = pageInfo.getList();
        String[] colors = PoetryUtils.getColors();
        int i = 0;
        for (Poetry poetry : list) {
            PoetryListInfo info = new PoetryListInfo();
            info.setPoetry(poetry);
            info.setCommentsNum(commentForPoetryService.getCommentsNum(poetry.getId()));
            info.setLikesNum(likesForPoetryService.getLikesNum(poetry.getId()));
            info.setColor(colors[i]);
            infoList.add(info);
            i++;
        }
        model.addAttribute("infos", infoList);
        model.addAttribute("type", type);
        model.addAttribute("poetryValue", poetryValue);
        //地址拼接字段
        model.addAttribute("type1", type1);
        model.addAttribute("pageInfo", pageInfo);
        return "poetry_list";
    }

    //处理元
    @RequestMapping("/yuan_list/{page}")
    public String yuanList(@PathVariable("page") Integer page, Model model) {
        return common(page, "yuan_list", "元代", ConstantValue.YUAN_VALUE, "元", model);
    }

    //处理明
    @RequestMapping("/ming_list/{page}")
    public String mingList(@PathVariable("page") Integer page, Model model) {
        return common(page, "ming_list", "明代", ConstantValue.MING_VALUE, "明", model);
    }

    //处理清
    @RequestMapping("/qing_list/{page}")
    public String qingList(@PathVariable("page") Integer page, Model model) {
        return common(page, "qing_list", "清代", ConstantValue.QING_VALUE, "清", model);
    }

    //处理宋词列表
    @RequestMapping("/songci_list")
    public String songciList(Model model) {
        List<Poems> p = poemsService.getPoemsRandom();
        model.addAttribute("poetry", p);
        model.addAttribute("type", "宋词");
        model.addAttribute("poetryValue", ConstantValue.SONGCI_VALUE);
        model.addAttribute("colors", PoetryUtils.getColors());
        return "poems_list";
    }

    //宋词明细
    @RequestMapping("/detail_poems/{id}")
    public String poemDetail(@PathVariable("id") Integer id, Model model) {
        PoetryDto poetryDto = new PoetryDto();
        Poems poems = poemsService.getById(id);
        poetryDto.setAuthor(poems.getAuthor());
        poetryDto.setDynasty("宋朝");
        poetryDto.setTitle(poems.getTitle());
        PoemsAuthor poemsAuthor = poemsAuthorService.getById(poems.getAuthorId());
        if (poemsAuthor.getIntroL() != null) {
            if (poemsAuthor.getIntroL().startsWith("--") && poemsAuthor.getIntroL().length() == 2) {
                poetryDto.setAuthorInfo(null);
            } else {
                String intro = poemsAuthor.getIntroL();
                if (intro.startsWith("--")) {
                    intro = intro.substring(2);
                }
                poetryDto.setAuthorInfo(poems.getAuthor() + "，" + intro);
            }
        } else {
            poetryDto.setAuthorInfo(null);
        }
        String[] poetryArray = PoetryUtils.getPoetryArray(poems.getContent());
        poetryDto.setPoetryArray(poetryArray);
        model.addAttribute("poetryDto", poetryDto);
        return "poetry_detail";
    }

    //处理诗经列表
    @RequestMapping("/shijing_list")
    public String shijingList(Model model) {
        List<ShiJing> shiJings = shiJingService.getByRandom();
        model.addAttribute("type", "诗经");
        model.addAttribute("shijings", shiJings);
        model.addAttribute("poetryValue", ConstantValue.SHIJNG_VALUE);
        model.addAttribute("colors", PoetryUtils.getColors());
        return "shijing_list";
    }

    @RequestMapping("/detail_shijing/{id}")
    public String shijingDetail(@PathVariable("id") Integer id, Model model) {
        ShiJing shiJing = shiJingService.getById(id);
        PoetryDto poetryDto = new PoetryDto();
        poetryDto.setTitle(shiJing.getTitle());
        poetryDto.setChapter(shiJing.getChapter());
        poetryDto.setSection(shiJing.getSection());
        poetryDto.setPoetryArray(PoetryUtils.getPoetryArray(shiJing.getContent()));
        model.addAttribute("poetryDto", poetryDto);
        return "shijing_detail";
    }

    @RequestMapping("/lunyu_list")
    public String lunyuList(Model model) {
        List<LunYu> lunYus = lunYuService.getByRandom();
        model.addAttribute("lunyus", lunYus);
        model.addAttribute("type", "论语");
        model.addAttribute("poetryValue", ConstantValue.LUNYU_VALUE);
        model.addAttribute("colors", PoetryUtils.getColors());
        return "lunyu_list";
    }

    @RequestMapping("/detail_lunyu/{id}")
    public String lunyuDetail(@PathVariable("id") Integer id, Model model) {
        PoetryDto poetryDto = new PoetryDto();
        LunYu lunyu = lunYuService.getById(id);
        poetryDto.setChapter(lunyu.getChapter());
        String[] poetryArray = PoetryUtils.getPoetryArray(lunyu.getContent());
        poetryDto.setPoetryArray(poetryArray);
        model.addAttribute("poetryDto", poetryDto);
        return "lunyu_detail";
    }

    //随机一首诗词
    @RequestMapping("/random_poetry")
    public String poetryRandom(Model model) {
        Poetry poetry = poetryService.getOne();
        return "redirect:/enjoy/detail_poetry/" + poetry.getId();
    }

    //诗词搜索界面
    @RequestMapping("/searchPage")
    public String searchPage(Model model) {
        //搜索热门
        List<HotSearch> hotSearches = hotSearchService.get();
        model.addAttribute("hots", hotSearches);
        model.addAttribute("searchDto", new SearchDto());
        return "search";
    }

    //诗词搜索
    @RequestMapping("/search/{page}")
    public String search(@PathVariable("page") int page, HttpServletRequest request, Model model) {
        //查询结果是宋词还是唐宋诗
        int isP;
        SearchDto searchDto;
        //相似字符串
        List<String> likes = new ArrayList<>(10);
        boolean isPoetry = false;
        boolean isLike = false;
        //第一次重新请求
        if (request.getParameter("searchType") != null && request.getParameter("content") != null) {
            int searchType = Integer.parseInt(request.getParameter("searchType"));
            String content = request.getParameter("content");
            searchDto = new SearchDto();
            searchDto.setContent(content);
            searchDto.setSearchType(searchType);
            request.getSession().setAttribute("searchDto", searchDto);
        }
        String dataIsNull;
        PageInfo pageInfo;
        searchDto = (SearchDto) request.getSession().getAttribute("searchDto");

        //更新数据库
        hotSearchService.editByPrimaryKey(searchDto.getContent(), searchDto.getSearchType());

        if (searchDto.getSearchType() == 0) {
            //按照作者
            pageInfo = poetryService.getByAuthor(searchDto.getContent(), page, 6);
            //设置作者信息
            Author author = authorService.getByName(searchDto.getContent());
            if (author != null) {
                if (author.getName() != null) {
                    model.addAttribute("title", author.getName());
                }
                if (author.getIntro() != null) {
                    model.addAttribute("content", author.getIntro());
                }
            }
            List<Poetry> list = pageInfo.getList();
            if (list.size() == 0) {
                PageInfo pageInfo1 = poetryService.getByAuthor(searchDto.getContent(), page, 6);
                if (pageInfo1.getList().size() == 0) {
                    //无数据
                    dataIsNull = "1";
                    pageInfo = null;
                } else {
                    pageInfo = pageInfo1;
                    isPoetry = false;
                }
            } else {
                isPoetry = true;
                dataIsNull = "0";
            }
        } else if (searchDto.getSearchType() == 1) {
            //按照诗词名
            pageInfo = poetryService.getByTitle(searchDto.getContent(), page, 6);
            List<Poetry> list = pageInfo.getList();
            model.addAttribute("title", searchDto.getContent());
            if (list.size() == 0) {
                PageInfo pageInfo1 = poetryService.getByTitle(searchDto.getContent(), page, 6);
                if (pageInfo1.getList().size() == 0) {
                    //无数据
                    dataIsNull = "1";
                    pageInfo = null;
                } else {
                    pageInfo = pageInfo1;
                    isPoetry = false;
                }
            } else {
                dataIsNull = "0";
                isPoetry = true;
            }
        } else {
            //模糊搜索
            pageInfo = poetryService.getByContent(searchDto.getContent(), page, 6);
            List<Poetry> list = pageInfo.getList();
            if (list.size() == 0) {
                PageInfo pageInfo1 = poetryService.getByContent(searchDto.getContent(), page, 6);
                if (pageInfo1.getList().size() == 0) {
                    //无数据
                    dataIsNull = "1";
                    pageInfo = null;
                    isLike = false;
                } else {
                    pageInfo = pageInfo1;
                    isLike = true;
                    isPoetry = false;
                }
            } else {
                isLike = true;
                isPoetry = true;
                dataIsNull = "0";
            }
        }
        if (pageInfo == null) {
            //未查询到数据
            return "search_null";
        } else {
            model.addAttribute("pageInfo", pageInfo);
        }
        //设置高亮查询字体
        if (isLike) {
            //模糊查询
            if (isPoetry) {
                List<Poetry> list = pageInfo.getList();
                for (Poetry poetry : list) {
                    String[] poetryArray = PoetryUtils.getPoetryArray(poetry.getContent());
                    for (String like : poetryArray) {
                        if (like.contains(searchDto.getContent())) {
                            likes.add(like);
                            break;
                        }
                    }
                }
            } else {
                List<Poems> list = pageInfo.getList();
                for (Poems poems : list) {
                    String[] poemsArray = PoetryUtils.getPoetryArray(poems.getContent());
                    for (String like : poemsArray) {
                        if (like.contains(searchDto.getContent())) {
                            likes.add(like);
                            break;
                        }
                    }
                }
            }
        } else {
            likes = null;
        }
        model.addAttribute("likes", likes);
        model.addAttribute("colors", PoetryUtils.getColors());
        isP = isPoetry ? 1 : 0;
        model.addAttribute("isP", isP);
        return "search_list";
    }

    @RequestMapping("/poetryAddPage")
    public String poetryAddPage() {
        return "poetry_add";
    }

    @RequestMapping("/poetryAdd")
    public String poetryAdd(PoetryAdd poetryAdd, Model model, HttpSession session) {
        poetryAddService.add(poetryAdd);
        session.setAttribute("message", "反馈成功,感谢您的反馈");
        return "redirect:/enjoy/searchPage";
    }
}

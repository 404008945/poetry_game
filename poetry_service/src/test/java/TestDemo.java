import com.poetry.dao.FriendDao;
import com.poetry.dao.Poetry1Dao;
import com.poetry.entity.Friend;
import com.poetry.service.FriendService;
import com.poetry.service.PoetryService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-service.xml")
public class TestDemo {
    @Autowired
    private PoetryService poetryService;
    @Autowired
    private Poetry1Dao poetry1Dao;
    @Autowired
    private FriendDao friendDao;
    @Autowired
    private FriendService friendService;

    @Test
    public void test1() {
        System.out.println("hello world");
    }

    @Test
    public void test2() {
        List<String> list = poetryService.getHeadPoetry("安科勇夺一等奖", 2);
        if (list == null) {
            System.out.println("匹配失败,换换吧");
        } else {
            for (String str : list) {
                System.out.println(str);
            }
        }

    }

    @Test
    public void test3() {
        poetry1Dao.updateFind(3020, 1);
    }

    @Test
    public void test4() {
        List<String> friends = friendDao.selectFriends("1973445634");
        System.out.println(friends);
    }

    @Test
    public void test5() {
        System.out.println(friendService.getFriends("1973445634"));
    }

    @Test
    public void test6() {
        Friend friend=new Friend();
        friend.setToUser("123");
        friend.setFromUser("456");
        friendDao.insert(friend);
        System.out.println(friend.getId());
    }

    @Test
    public void test7() {
        System.out.println(friendService.getRequest("1973445634"));
    }

    @Test
    public void test8()
    {
        System.out.println(friendService.getRequestCount("123456"));
    }

    @Test
    public void test9()
    {
        System.out.println(friendService.judgeFriends("123456","hello"));
    }
}

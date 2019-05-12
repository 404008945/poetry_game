import com.poetry.dao.Poetry1Dao;
import com.poetry.entity.Poetry;
import com.poetry.global.ConstantValue;
import com.poetry.service.PoetryService;
import com.poetry.service.impl.PoetryServiceImpl;
import com.poetry.utils.PreDayPoetryUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import java.util.Arrays;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-service.xml")
public class TestDemo {
    @Autowired
    private PoetryService poetryService;
    @Autowired
    private Poetry1Dao poetry1Dao;
    @Test
    public void test()
    {
        System.out.println(PreDayPoetryUtil.getPoetry());
    }
    @Test
    public void test2()
    {
        Assert.notNull(poetryService);
        List<String> list = poetryService.getHeadPoetry("安科勇夺一等奖", 2);
        if(list==null)
        {
            System.out.println("匹配失败,换换吧");
        }else {
            for(String str:list)
            {
                System.out.println(str);
            }
        }

    }

    @Test
    public void test3()
    {
        poetry1Dao.updateFind(3020,1);
    }
}

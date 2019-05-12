package com.poetry.utils;

import com.poetry.dto.PoetryInfo;
import com.poetry.entity.Poetry;
import com.poetry.service.PoetryService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Arrays;

//每日一句
public class PreDayPoetryUtil {
    //获取每日一句
    private static PoetryService service;
    public static PoetryInfo getPoetry()
    {
        //产生随机一首诗
        ApplicationContext context=new ClassPathXmlApplicationContext("spring-service.xml");
        service=context.getBean(PoetryService.class);
        Poetry p = service.getOne();
        String content = p.getContent();
        String[] split = content.split("\r\n");
        System.out.println("数组:"+Arrays.toString(split));
        PoetryInfo poetryInfo=new PoetryInfo();
        System.out.println("内容:"+content);
        poetryInfo.setOne(split[0]);
        if(split.length==1)
        {
            poetryInfo.setTwo("");
        }else{
            poetryInfo.setTwo(split[1]);
        }
        poetryInfo.setId(p.getId());
        return poetryInfo;
    }
}

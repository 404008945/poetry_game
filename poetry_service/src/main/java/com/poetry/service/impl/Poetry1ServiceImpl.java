package com.poetry.service.impl;

import com.poetry.dao.Poetry1Dao;
import com.poetry.entity.HeadPoetry;
import com.poetry.entity.Poetry1;
import com.poetry.service.Poetry1Service;
import com.poetry.utils.PoetryUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class Poetry1ServiceImpl implements Poetry1Service {

    @Autowired
    private Poetry1Dao poetry1Dao;

    public Poetry1 getById(Integer id) {
        return poetry1Dao.selectById(id);
    }

    public List<String> getHeadPoetry(String head, Integer type) {
        //把字符串转换成字符数组
        char[] chars = head.toCharArray();
        boolean flag = true;
        List<Poetry1> poetryList = new ArrayList<Poetry1>();
        List<Integer> ids=new ArrayList<Integer>();
        for (int i = 0; i < chars.length; i++) {
            Poetry1 poetry1 = poetry1Dao.selectByChar(new HeadPoetry(type, chars[i]));
            //设置已搜索过
            if(poetry1!=null)
            {
                ids.add(poetry1.getId());
                poetry1Dao.updateFind(poetry1.getId(),1);
            }
            poetryList.add(poetry1);
        }
        //重新恢复未搜索过
        for(Integer id:ids)
        {
            poetry1Dao.updateFind(id,0);
        }
        //含有每个子的字符列表
        List<String[]> list = new ArrayList<String[]>();
        for (Poetry1 poetry : poetryList) {
            try {
                list.add(PoetryUtils.getPoetryArray1(poetry.getContent()));
            } catch (Exception e) {
                return null;
            }
        }
        List<String> headPoetry = new ArrayList<String>();
        int i = 0;
        for (String[] strings : list) {
            for (String str : strings) {
                if (str.startsWith(String.valueOf(chars[i]))) {
                    headPoetry.add(str);
                    i++;
                    break;
                }
            }
        }
        return headPoetry;
    }

}

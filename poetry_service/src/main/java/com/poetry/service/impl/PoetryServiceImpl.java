package com.poetry.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.poetry.dao.PoetryDao;
import com.poetry.dto.RecommendDto;
import com.poetry.entity.HeadPoetry;
import com.poetry.entity.Poetry;
import com.poetry.service.PoetryService;
import com.poetry.utils.PoetryUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PoetryServiceImpl implements PoetryService {

    @Autowired
    private PoetryDao poetryDao;

    public Poetry getById(Integer id) {
        return poetryDao.selectById(id);
    }

    public PageInfo getByTitle(String title,int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Poetry> poetry = poetryDao.selectByTitle(title);
        PageInfo pageInfo=new PageInfo(poetry);
        return pageInfo;
    }

    public PageInfo getByAuthor(String author,int pageNumber,int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        System.out.println(author);
        List<Poetry> poetry = poetryDao.selectByAuthor(author);
        System.out.println(poetry.size());
        PageInfo pageInfo=new PageInfo<Poetry>(poetry);
        return pageInfo;
    }


    public Poetry getOne() {
        return poetryDao.selectOne();
    }

    public PageInfo getByContent(String content, int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        List<Poetry> poetry = poetryDao.selectByContent(content);
        PageInfo pageInfo=new PageInfo(poetry);
        return pageInfo;
    }

    public Poetry getByChar(Integer type, Character character) {
        HeadPoetry headPoetry=new HeadPoetry();
        headPoetry.setType(type);
        headPoetry.setCharacter(character);
        return poetryDao.selectByChar(headPoetry);
    }

    public List<String> getHeadPoetry(String head, Integer type) {
        //把字符串转换成字符数组
        char[] chars = head.toCharArray();
        boolean flag=true;
        List<Poetry> poetryList = new ArrayList<Poetry>();
        for (int i = 0; i < chars.length; i++) {
            //poetryList.add(poetryDao.selectByChar(new HeadPoetry(type,chars[i])));
        }
        //含有每个子的字符列表
        List<String[]> list = new ArrayList<String[]>();
        for (Poetry poetry : poetryList) {
            try{
                list.add(PoetryUtils.getPoetryArray(poetry.getContent()));
            }catch (Exception e)
            {
                flag=false;
                return null;
            }
        }
        List<String> headPoetry=new ArrayList<String>();
        int i=0;
        for (String[] strings : list)
        {
            for(String str:strings)
            {
                if(str.startsWith(String.valueOf(chars[i])))
                {
                    headPoetry.add(str);
                    i++;
                    break;
                }
            }
        }
        return headPoetry;
    }


    public Poetry selectByInfoId(Integer infoId) {
        return poetryDao.selectByInfoId(infoId);
    }

    public Poetry getByRecommend(RecommendDto recommend) {
        return poetryDao.selectByRecommend(recommend);
    }

    public int add(Poetry poetry) {
        poetry.setYunlvRule("---");
        poetry.setLikes(0);
        return poetryDao.insert(poetry);
    }
    public PageInfo getByDynasty(String dynasty,int pageNumber,int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        List<Poetry> poetry = poetryDao.selectByDynasty(dynasty);
        PageInfo pageInfo=new PageInfo<Poetry>(poetry);
        return pageInfo;
    }



}

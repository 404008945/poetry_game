package com.poetry.service.impl;

import com.poetry.dao.HotSearchDao;
import com.poetry.entity.HotSearch;
import com.poetry.service.HotSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HotSearchServiceImpl implements HotSearchService {
    @Autowired
    private HotSearchDao hotSearchDao;
    public int removeByPrimaryKey(Integer id) {
        return hotSearchDao.deleteByPrimaryKey(id);
    }

    public int add(HotSearch record) {
        //搜索数初始值为1
        record.setCount(1);
        return hotSearchDao.insert(record);
    }

    public HotSearch getByPrimaryKey(Integer id) {
        return hotSearchDao.selectByPrimaryKey(id);
    }

    public List<HotSearch> get() {
        return hotSearchDao.select();
    }

    public int editByPrimaryKey(String words,Integer type) {
        HotSearch hotSearch1 = hotSearchDao.selectByWords(words);
        if(hotSearch1!=null)
        {
            //存在该搜索词,加一
            return hotSearchDao.updateByPrimaryKey(hotSearch1.getId());
        }else{
            HotSearch hotSearch=new HotSearch();
            hotSearch.setWords(words);
            hotSearch.setType(type);
            return add(hotSearch);
        }
    }
}

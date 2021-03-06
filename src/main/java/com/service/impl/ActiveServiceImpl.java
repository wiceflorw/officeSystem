package com.service.impl;

import com.entity.Active;
import com.service.ActiveService;
import java.util.List;
import com.dao.active.activeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 站在“使用中”角度设计接口
 * 活动类业务接口
 * Created by BF on 2017/4/30.
 */
@Service
public class ActiveServiceImpl implements ActiveService
{
    //注入Service依赖
    @Autowired  //@Resource
    private activeDao activeDao;
    //返回值0表示失败
    private int backnum = 0;

    private Active active;

    /**
     * 增加活动
     *
     * @param active
     * @return 返回0代表失败，返回1代表成功
     */
    public int addActive(Active active)
    {
        backnum = activeDao.addActive(active);
        return backnum;
    }

    /**
     * 删除活动
     *
     * @param activeID 以活动ID来删除
     * @return 返回0代表失败，返回1代表成功
     */
    public int delActive(String activeID)
    {
        backnum = activeDao.delActive(activeID);
        return backnum;
    }

    /**
     * 查询某个活动
     *
     * @param activeID 以活动ID来查询
     * @return 返回一个实体类
     */
    public Active checkActive(String activeID)
    {
        active = activeDao.checkActive(activeID);
        return active;
    }

    /**
     * 修改某个活动
     *
     * @param active 传入一个实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeActive(Active active)
    {
        backnum = activeDao.changeActive(active);
        return backnum;
    }

    /**
     * 查询所有现集活的活动，不需要参数
     *
     * @return 返回一个List
     */
    public List<Active> queryAll()
    {
        List<Active> list = activeDao.queryAll();
        if (list != null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }
}

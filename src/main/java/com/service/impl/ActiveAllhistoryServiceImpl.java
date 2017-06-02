package com.service.impl;

import com.entity.ActiveAllhistory;
import com.service.ActiveAllhistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.active_allhistory.activeAllhistoryDao;
import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 活动表的总表，不做删除操作，永久保存
 */
@Service
public class ActiveAllhistoryServiceImpl implements ActiveAllhistoryService
{
    //注入Service依赖
    @Autowired
    private activeAllhistoryDao activeAllhistoryDao;
    private int backnum = 0;
    /**
     * 增加活动,与ActiveDao同步
     * @param active
     * @return 返回0代表失败，返回1代表成功
     */
    public int addActiveAllhistory(ActiveAllhistory active) {
        backnum = activeAllhistoryDao.addActiveAllhistory(active);
        return backnum;
    }


    /**
     * 查询历史总活动，不需要参数
     * @return 返回一个Active型的List列表
     */
    public List<ActiveAllhistory> queryAll()
    {
        List<ActiveAllhistory> list = activeAllhistoryDao.queryAll();
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }

    /**
     * 修改某个活动,与ActiveDao同步
     * @param active 传入一个实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeActive(ActiveAllhistory active)
    {
        backnum = activeAllhistoryDao.changeActive(active);
        return backnum;
    }


}

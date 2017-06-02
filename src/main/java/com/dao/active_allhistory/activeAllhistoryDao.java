package com.dao.active_allhistory;

import com.entity.ActiveAllhistory;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 活动表的总表，不做删除操作，永久保存
 */
public interface activeAllhistoryDao
{
    /**
     * 增加活动,与ActiveDao同步
     * @param active
     * @return 返回0代表失败，返回1代表成功
     */
    public int addActiveAllhistory(ActiveAllhistory active);

    /**
     * 查询历史总活动，不需要参数
     * @return  返回一个Active型的List列表
     */
    public List<ActiveAllhistory> queryAll();

    /**
     * 修改某个活动,与ActiveDao同步
     * @param active 传入一个实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeActive(ActiveAllhistory active);


}

package com.dao.active;

import com.entity.Active;

import java.util.List;

/**
 *    活动类Active的Dao层接口
 */
public interface activeDao
{
    /**
     * 增加活动
     * @param active
     * @return 返回0代表失败，返回1代表成功
     */
    public int addActive(Active active);

    /**
     * 删除活动
     * @param activeID 以活动ID来删除
     * @return 返回0代表失败，返回1代表成功
     */
    public int delActive(String activeID);

    /**
     * 查询某个活动
     * @param activeID 以活动ID来查询
     * @return 返回一个实体类
     */
    public Active checkActive(String activeID);

    /**
     * 修改某个活动
     * @param active 传入一个实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeActive(Active active);

    /**
     * 查询所有现集活的活动，不需要参数
     * @return 返回一个List
     */
    public List<Active> queryAll();
}

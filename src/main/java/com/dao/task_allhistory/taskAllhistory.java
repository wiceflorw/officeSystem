package com.dao.task_allhistory;

import com.entity.TaskAllhistory;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 任务信息的历史总表，不做删除操作，与TaskDao同步
 */
public interface taskAllhistory
{
    /**
     * 增加一个任务信息到历史总表，与TaskDao同步
     * @param taskAllhistory
     * @return 返回0代表失败，返回1代表成功
     */
    public int addtaskAllhistory(TaskAllhistory taskAllhistory);

    /**
     * 修改一个任务信息，与TaskDao同步
     * @param taskAllhistory
     * @return 返回0代表失败，返回1代表成功
     */
    public int changetaskAllhistoyr(TaskAllhistory taskAllhistory);

    /**
     * 查询历史总表中的所有信息，不需传入参数
     * @return 返回一个TaskAllhistory类的List列表
     */
    public List<TaskAllhistory> queryAll();
}

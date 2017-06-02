package com.dao.task;

import com.entity.Task;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 任务信息taskDao接口,有历史总表
 */
public interface taskDao
{
    /**
     * 增加一个任务信息
     * @param task 传入一个任务的实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int addTask(Task task);

    /**
     * 删除一个任务信息
     * @param taskID 传入一个任务ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int delTask(String taskID);

    /**
     * 修改一个任务信息
     * @param task 传入一个任务的实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeTask(Task task);

    /**
     * 查询一个任务信息
     * @param taskID 传入一个任务ID
     * @return 返回一个任务的实体类
     */
    public Task queryTask(String taskID);

    /**
     * 查询现激活的所有任务,无需参数
     * @return 返回一个Task类型的List
     */
    public List<Task> queryAll();
}

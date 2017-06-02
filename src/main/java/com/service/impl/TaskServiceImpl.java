package com.service.impl;

import com.entity.Task;
import com.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.task.taskDao;
import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 任务信息taskDao接口,有历史总表
 */
@Service
public class TaskServiceImpl implements TaskService
{
    //注入依赖
    @Autowired
    private taskDao taskDao;
    private int backnum = 0;
    /**
     * 增加一个任务信息
     * @param task 传入一个任务的实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int addTask(Task task)
    {
        backnum = taskDao.addTask(task);
        return backnum;
    }

    /**
     * 删除一个任务信息
     * @param taskID 传入一个任务ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int delTask(String taskID)
    {
        backnum = taskDao.delTask(taskID);
        return backnum;
    }

    /**
     * 修改一个任务信息
     * @param task 传入一个任务的实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeTask(Task task)
    {
        backnum = taskDao.changeTask(task);
        return backnum;
    }

    /**
     * 查询一个任务信息
     * @param taskID 传入一个任务ID
     * @return 返回一个任务的实体类
     */
    public Task queryTask(String taskID)
    {
        Task task = taskDao.queryTask(taskID);
        return task;
    }

    /**
     * 查询现激活的所有任务,无需参数
     * @return 返回一个Task类型的List
     */
    public List<Task> queryAll()
    {
        List<Task> list = taskDao.queryAll();
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }
}

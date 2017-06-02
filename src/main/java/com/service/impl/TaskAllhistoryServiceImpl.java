package com.service.impl;

import com.entity.TaskAllhistory;
import com.service.TaskAllhistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.task_allhistory.taskAllhistory;
import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 任务信息的历史总表，不做删除操作，与TaskDao同步
 */
@Service
public class TaskAllhistoryServiceImpl implements TaskAllhistoryService
{
    //注入依赖
    @Autowired
    private taskAllhistory tack;
    private int backnum = 0;
    /**
     * 增加一个任务信息到历史总表，与TaskDao同步
     * @param taskAllhistory
     * @return 返回0代表失败，返回1代表成功
     */
    public int addtaskAllhistory(TaskAllhistory taskAllhistory)
    {
        backnum = tack.addtaskAllhistory(taskAllhistory);
        return backnum;
    }

    /**
     * 修改一个任务信息，与TaskDao同步
     * @param taskAllhistory
     * @return 返回0代表失败，返回1代表成功
     */
    public int changetaskAllhistoyr(TaskAllhistory taskAllhistory)
    {
        backnum = tack.changetaskAllhistoyr(taskAllhistory);
        return backnum;
    }

    /**
     * 查询历史总表中的所有信息，不需传入参数
     * @return 返回一个TaskAllhistory类的List列表
     */
    public List<TaskAllhistory> queryAll()
    {
        List<TaskAllhistory> list = tack.queryAll();
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }
}

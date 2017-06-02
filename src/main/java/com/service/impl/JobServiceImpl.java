package com.service.impl;

import com.dao.job.jobDao;
import com.entity.Job;
import com.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 职位jobDao接口
 */
@Service
public class JobServiceImpl implements JobService
{
    //注入依赖
    @Autowired
    private jobDao jobDao;

    private int backnum = 0;
    /**
     * 增加新的职位
     * @param job 传入一个职位的实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int addJob(Job job)
    {
        backnum = jobDao.addJob(job);
        return backnum;
    }

    /**
     * 删除一个职位
     * @param jobID 传入一个职位的ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int delJob(String jobID)
    {
        backnum = jobDao.delJob(jobID);
        return backnum;
    }

    /**
     * 修改一个职位
     * @param job 传入一个职位的实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeJob(Job job)
    {
        backnum = jobDao.changeJob(job);
        return backnum;
    }

    /**
     * 查询一个职位
     * @param jobID 传入一个职位的ID
     * @return 返回一个职位的实体类
     */
    public Job queryJob(String jobID)
    {
        Job job = jobDao.queryJob(jobID);
        return job;
    }

    /**
     * 查询所有工作，含一个参数，表示哪个部门，当没有传入时候表示高级用户查看所有职位
     * @return 返回一个Job类型的List
     */
    public List<Job> queryAll()
    {
        List<Job> list = jobDao.queryAll();
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }
}

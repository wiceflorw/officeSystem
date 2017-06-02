package com.service;

import com.entity.Job;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 职位jobDao接口
 */
public interface JobService
{
    /**
     * 增加新的职位
     * @param job 传入一个职位的实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int addJob(Job job);

    /**
     * 删除一个职位
     * @param jobID 传入一个职位的ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int delJob(String jobID);

    /**
     * 修改一个职位
     * @param job 传入一个职位的实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeJob(Job job);

    /**
     * 查询一个职位
     * @param jobID 传入一个职位的ID
     * @return 返回一个职位的实体类
     */
    public Job queryJob(String jobID);

    /**
     * 查询所有工作，含一个参数，表示哪个部门，当没有传入时候表示高级用户查看所有职位
     * @param deptID 部门ID
     * @return 返回一个Job类型的List
     */
    public List<Job> queryAll();
}

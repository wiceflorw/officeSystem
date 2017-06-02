package com.service.impl;
import com.entity.Dept;
import com.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 部门deptDao接口
 */
@Service
public class DeptServiceImpl implements DeptService
{
    //注入依赖
    @Autowired
    private com.dao.dept.deptDao deptDao;

    private int backnum = 0;
    /**
     * 增加新的部门
     * @param dept
     * @return 返回0代表失败，返回1代表成功
     */
    public int addDept(Dept dept)
    {
        backnum = deptDao.addDept(dept);
        return backnum;
    }

    /**
     * 删除部门
     * @param deptID 以部门ID来删除
     * @return 返回0代表失败，返回1代表成功
     */
    public int delDept(String deptID)
    {
        backnum = deptDao.delDept(deptID);
        return backnum;
    }

    /**
     * 查询某个部门
     * @param deptID 以部门ID来查询
     * @return 返回一个实体类
     */
    public Dept queryDept(String deptID)
    {
        Dept dept = deptDao.queryDept(deptID);
        return dept;
    }

    /**
     * 修改某个部门
     * @param dept 传入一个实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeDept(Dept dept)
    {
        backnum = deptDao.changeDept(dept);
        return backnum;
    }

    /**
     * 查询所有存在部门，不需要参数
     * @return 返回一个dept类型的List
     */
    public List<Dept> queryAll()
    {
        List<Dept> list = deptDao.queryAll();
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }
    /**
     * 通过名字查询部门，模糊查询
     * @return
     */
    public List<Dept> queryByName(String deptName) {
        List<Dept> list = deptDao.queryByName(deptName);
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }

    /**
     * 查询某部门下的职位
     * @param deptID
     * @return
     */
    public List<Dept> queryDeptWithJob(String deptID) {
        List<Dept> list = deptDao.queryDeptWithJob(deptID);
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }
}

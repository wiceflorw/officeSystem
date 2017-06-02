package com.dao.dept;
import com.entity.Dept;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 部门deptDao接口
 */
public interface deptDao
{
    /**
     * 增加新的部门
     * @param dept
     * @return  返回0代表失败，返回1代表成功
     */
    public int addDept(Dept dept);

    /**
     * 删除部门
     * @param deptID 以部门ID来删除
     * @return 返回0代表失败，返回1代表成功
     */
    public int delDept(String deptID);

    /**
     * 查询某个部门
     * @param deptID 以部门ID来查询
     * @return 返回一个实体类
     */
    public Dept queryDept(String deptID);

    /**
     * 修改某个部门
     * @param dept 传入一个实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeDept(Dept dept);

    /**
     * 查询所有存在部门，不需要参数
     * @return 返回一个dept类型的List
     */
    public List<Dept> queryAll();

    /**
     * 模糊查询部门信息
     * @param deptName
     * @return
     */
    public List<Dept> queryByName(String deptName);

    /**
     * 查询某部门下的职位
     * @param deptID
     * @return
     */
    public List<Dept> queryDeptWithJob(String deptID);
}

package com.service;

import com.entity.Employees;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 员工信息employeeDao接口
 */
public interface EmployeeService
{
    /**
     * 增加员工
     * @param employees 传入一个实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int addEmployee(Employees employees);

    /**
     * 删除员工
     * @param employeeID 传入员工ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int delEmployee(String employeeID);

    /**
     * 修改员工信息
     * @param employees 传入一个员工类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeEmployee(Employees employees);

    /**
     * 查询员工信息
     * @param employeeID 传入员工ID
     * @return 返回一个员工实体类
     */
    public Employees queryEmployee(String employeeID);

    /**
     * 查询所有员工信息，需要一个参数，判断是哪个部门的
     * @return 返回一个List类型的列表
     */
    public List<Employees> queryAll();

    /**
     * 修改密码
     * @param employeeID 传入员工ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int changpsw(String employeeID,String oldpsw,String newpsw);
}

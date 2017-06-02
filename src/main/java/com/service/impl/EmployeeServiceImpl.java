package com.service.impl;

import com.dao.employees.employeeDao;
import com.entity.Employees;
import com.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 员工信息employeeDao接口
 */
@Service
public class EmployeeServiceImpl implements EmployeeService
{
    //注入依赖
    @Autowired
    private employeeDao employeeDao;
    private int backnum = 0;
    /**
     * 增加员工
     * @param employees 传入一个实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int addEmployee(Employees employees)
    {
        backnum = employeeDao.addEmployee(employees);
        return backnum;
    }

    /**
     * 删除员工
     * @param employeeID 传入员工ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int delEmployee(String employeeID)
    {
        backnum = employeeDao.delEmployee(employeeID);
        return backnum;
    }

    /**
     * 修改员工信息
     * @param employees 传入一个员工类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeEmployee(Employees employees)
    {
        backnum = employeeDao.changeEmployee(employees);
        return backnum;
    }

    /**
     * 查询员工信息
     * @param employeeID 传入员工ID
     * @return 返回一个员工实体类
     */
    public Employees queryEmployee(String employeeID)
    {
        Employees employees = employeeDao.queryEmployee(employeeID);
        return employees;
    }

    /**
     * 查询所有员工信息，需要一个参数，判断是哪个部门的
     * @return 返回一个List类型的列表
     */
    public List<Employees> queryAll()
    {
        List<Employees> list = employeeDao.queryAll();
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }

    /**
     * 修改密码
     * @param employeeID 传入员工ID
     * @param oldpsw 传入旧的密码
     * @param newpsw 传入新的密码
     * @return 返回0代表失败，返回1代表成功,返回2表示旧密码错误
     */
    public int changpsw(String employeeID,String oldpsw,String newpsw)
    {

        String old = employeeDao.queryEmployee(employeeID).getPwd();

        /**
         * 判断输入的旧密码是否相等，不相等返回2
         */
        if (old.equals(oldpsw))
        {
            System.out.println("验证通过，允许修改");
            backnum = employeeDao.changepsw(employeeID, newpsw);
        }
        /**
         * 用户输入的旧密码与验证密码不相同，驳回修改
         */
        else
        {
            System.out.println("验证失败，修改驳回");
            backnum = 2;
        }
        return backnum;
    }
}

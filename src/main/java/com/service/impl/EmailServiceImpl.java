package com.service.impl;

import com.dao.email.emailDao;
import com.entity.Email;
import com.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by BF on 2017/5/24.
 * 邮件信息的实现类
 */
@Service
public class EmailServiceImpl implements EmailService
{
    //注入依赖
    @Autowired
    private emailDao emailDao;
    private int backnum = 0;

    /**
     * 增加邮件
     * @param email 传入一个实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int addEmail(Email email)
    {
        backnum = emailDao.addEmail(email);
        return backnum;
    }
    /**
     * 删除邮件
     * @param emailID 传入员工ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int delEmail(int emailID)
    {
        backnum = emailDao.delEamail(emailID);
        return backnum;
    }
    /**
     * 查询邮件
     * @param emailID 传入员工ID
     * @return 返回一个员工实体类
     */
    public Email searchEmail(int emailID)
    {
        Email email = emailDao.searchEmail(emailID);
        return email;
    }
    /**
     * 查询所有邮件
     * @return 返回一个List类型的列表
     */
    public List<Email> searchall()
    {
        List<Email> list = emailDao.searchall();
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }
}

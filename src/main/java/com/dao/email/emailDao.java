package com.dao.email;

import com.entity.Email;

import java.util.List;

/**
 * 邮件类的Dao接口
 */
public interface emailDao
{
    /**
     * 增加邮件
     * @param email
     * @return 返回0代表失败，返回1代表成功
     */
    public int addEmail(Email email);

    /**
     * 删除邮件
     * @param emailID 以活动ID来删除
     * @return 返回0代表失败，返回1代表成功
     */
    public int delEamail(int emailID);

     /**
     * 查询邮件
     * @param emailID 以邮件ID来查询
     * @return 返回一个实体类
     */
    public Email searchEmail(int emailID);

    /**
     * 查询所有邮件，不需要参数
     * @return 返回一个List
     */
    public List<Email> searchall();
}

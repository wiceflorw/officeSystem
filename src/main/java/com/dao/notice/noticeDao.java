package com.dao.notice;

import com.entity.Notice;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 公告noticeDao接口，有历史总表
 */
public interface noticeDao
{
    /**
     * 增加一个公告信息
     * @param notice 传入一个公告实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int addNotice(Notice notice);

    /**
     * 删除一个公告信息
     * @param noticeID 传入一个公告ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int delNotice(String noticeID);

    /**
     * 修改一个公告信息
     * @param notice 传入一个公告实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeNotice(Notice notice);

    /**
     * 查询一个公告信息
     * @param noticeID 传入一个公告ID
     * @return 返回一个公告实体类
     */
    public Notice queryNotice(String noticeID);

    /**
     * 查询现有所有激活的公告，无参数
     * @return 返回一个Notice类型的List
     */
    public List<Notice> queryAll();
}

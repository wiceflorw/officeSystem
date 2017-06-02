package com.service.impl;

import com.dao.notice.noticeDao;
import com.entity.Notice;
import com.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 公告noticeDao接口，有历史总表
 */
@Service
public class NoticeServiceImpl implements NoticeService
{
    //注入依赖
    @Autowired
    private noticeDao noticeDao;

    private int backnum = 0;
    /**
     * 增加一个公告信息
     * @param notice 传入一个公告实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int addNotice(Notice notice)
    {
        backnum = noticeDao.addNotice(notice);
        return backnum;
    }

    /**
     * 删除一个公告信息
     * @param noticeID 传入一个公告ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int delNotice(String noticeID)
    {
        backnum = noticeDao.delNotice(noticeID);
        return backnum;
    }

    /**
     * 修改一个公告信息
     * @param notice 传入一个公告实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeNotice(Notice notice)
    {
        backnum = noticeDao.changeNotice(notice);
        return backnum;
    }

    /**
     * 查询一个公告信息
     * @param noticeID 传入一个公告ID
     * @return 返回一个公告实体类
     */
    public Notice queryNotice(String noticeID)
    {
        Notice n = noticeDao.queryNotice(noticeID);
        return n;
    }

    /**
     * 查询现有所有激活的公告，无参数
     * @return 返回一个Notice类型的List
     */
    public List<Notice> queryAll()
    {
        List<Notice> list = noticeDao.queryAll();
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }
}

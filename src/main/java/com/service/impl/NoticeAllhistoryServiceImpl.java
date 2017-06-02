package com.service.impl;

import com.entity.NoticeAllhistory;
import com.service.NoticeAllhistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.notice_allhistory.noticeAllhistory;
import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 公告信息的历史总表，不做删除操作
 */
@Service
public class NoticeAllhistoryServiceImpl implements NoticeAllhistoryService
{
    //注入依赖
    @Autowired
    private noticeAllhistory notic;

    private int backnum = 0;
    /**
     * 增加一个公告信息,与noticeDao同步
     * @param noticeAllhistory 传入一个公告实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int addNotice(NoticeAllhistory noticeAllhistory)
    {
        backnum = notic.addNotice(noticeAllhistory);
        return backnum;
    }

    /**
     * 修改一个公告信息,与noticeDao同步
     * @param noticeAllhistory 传入一个公告实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeNotice(NoticeAllhistory noticeAllhistory)
    {
        backnum = notic.changeNotice(noticeAllhistory);
        return backnum;
    }

    /**
     * 查询所有公告信息，不需要参数
     * @return 返回一个公告实体类的列表
     */
    public List<NoticeAllhistory> queryNotice()
    {
        List<NoticeAllhistory> list = notic.queryNotice();
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }

    /**
     * 修改公告是否通过审核以及是否过时
     * @param noticeAllhistory
     * @return
     */
    public int modiftystatus(NoticeAllhistory noticeAllhistory)
    {
        backnum = notic.modiftystatus(noticeAllhistory);
        return backnum;
    }

    /**
     * 查询公告信息 主要用来设置审核是否通过与公告是否过时
     * @param noteID
     * @return
     */
    public NoticeAllhistory querryone(String noteID)
    {
        NoticeAllhistory noticeAllhistory = notic.querryone(noteID);
        return noticeAllhistory;
    }
}

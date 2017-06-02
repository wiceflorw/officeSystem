package com.dao.notice_allhistory;
import com.entity.NoticeAllhistory;
import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 公告信息的历史总表，不做删除操作
 */
public interface noticeAllhistory
{

    /**
     * 增加一个公告信息,与noticeDao同步
     * @param noticeAllhistory 传入一个公告实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int addNotice(NoticeAllhistory noticeAllhistory);

    /**
     * 修改一个公告信息,与noticeDao同步
     * @param noticeAllhistory 传入一个公告实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeNotice(NoticeAllhistory noticeAllhistory);

    /**
     * 查询所有公告信息，不需要参数
     * @return 返回一个公告实体类的列表
     */
    public List<NoticeAllhistory> queryNotice();

    /**
     * 修改公告的属性 1为审核通过激活，0为审核没通过，3为过时公告
     * @param noticeAllhistory
     * @return
     */
    public int modiftystatus(NoticeAllhistory noticeAllhistory);

    /**
     * 查询单个活动信息 用来审核以及设置过时
     * @param noteID
     * @return
     */
    public NoticeAllhistory querryone(String noteID);
}

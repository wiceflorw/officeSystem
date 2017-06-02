package controller;
import com.dao.notice_allhistory.noticeAllhistory;
import com.entity.Notice;
import com.entity.NoticeAllhistory;
import com.service.NoticeAllhistoryService;
import com.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by BF on 2017/5/18.
 * NotcieController
 */
@Controller
@RequestMapping(value = "notice")
public class NoticeController
{
    /**
     * 依赖注入
     * NoticeService 全部激活的公告
     * NoticeAllhistoryService 所有公告  包含发布却未激活的和已经过期了的
     */
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private NoticeAllhistoryService noticeAllhistoryService;

    /**
     * 查询所有公告
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "allrunnotice",method = RequestMethod.GET)
    public String list(Model model, HttpServletRequest request)
    {
        List<NoticeAllhistory> list = noticeAllhistoryService.queryNotice();
        model.addAttribute("list",list);
        return "static/notice/noticefirst";
    }

    /**
     * 查询一个公告  来显示信息
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "onenotice",method = RequestMethod.GET)
    public String onenotice(Model model,HttpServletRequest request)
    {
        NoticeAllhistory notice = noticeAllhistoryService.querryone(request.getParameter("noticeID"));
        System.out.println(notice);
        model.addAttribute("notice",notice);
        return "static/notice/noticeinfo";
    }

    /**
     * 新增一个公告信息
     * @param request
     * @return
     */
    @RequestMapping(value = "addnote",method = RequestMethod.POST)
    @ResponseBody
    public int addnote(HttpServletRequest request)
    {
        Notice notice = new Notice();
        NoticeAllhistory noticeAllhistory = new NoticeAllhistory();

        String noteID = request.getParameter("noteID");
        String noteName = request.getParameter("noteName");
        String notetime = request.getParameter("notetime");
        String empyID = request.getParameter("empyID");
        String global = request.getParameter("global");
        String noteinfo = request.getParameter("noteinfo");
        /**
         * 往公告表中插入数据
         */
        notice.setNoteID(noteID);
        notice.setNoteName(noteName);
        notice.setNoteTime(notetime);
        notice.setEmployeeID(empyID);
        notice.setWhetherGlobal(Integer.parseInt(global));
        notice.setNoteInfo(noteinfo);

        /**
         * 往历史表中插入信息
         */
        noticeAllhistory.setNoteID(noteID);
        noticeAllhistory.setNoteName(noteName);
        noticeAllhistory.setNoteTime(notetime);
        noticeAllhistory.setEmployeeID(empyID);
        noticeAllhistory.setWhetherGlobal(Integer.parseInt(global));
        noticeAllhistory.setNoteInfo(noteinfo);
        //默认设置未激活，要管理员审核
        noticeAllhistory.setStatus(0);
        int back = 0;
        int back1 = noticeService.addNotice(notice);
        int back2 = noticeAllhistoryService.addNotice(noticeAllhistory);
        System.out.println(back1+"888"+back2);
        if (back1==back2&back1==1)
        {
            back = 1;
        }
        return  back;
    }

    /**
     * 进行审核操作的读取
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "allhisnote",method = RequestMethod.GET)
    public String allhisnote(Model model,HttpServletRequest request)
    {
        List<NoticeAllhistory> list = noticeAllhistoryService.queryNotice();
        model.addAttribute("list",list);
        return "static/notice/auditingnote";
    }

    /**
     * 返回单个审核通过信息
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "completenote",method = RequestMethod.GET)
    public String completenote(Model model,HttpServletRequest request)
    {
        NoticeAllhistory notice = noticeAllhistoryService.querryone(request.getParameter("noticeID"));
        model.addAttribute("notice",notice);
        return "static/notice/auditing/completenote";
    }

    /**
     * 查询一个审核未通过的信息
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "throughnote",method = RequestMethod.GET)
    public String throughnote(Model model,HttpServletRequest request)
    {
        NoticeAllhistory notice = noticeAllhistoryService.querryone(request.getParameter("noticeID"));
        model.addAttribute("notice",notice);
        return "static/notice/auditing/throughnote";
    }

    /**
     * 查询一个已失效公告
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "timeout",method = RequestMethod.GET)
    public String timeout(Model model,HttpServletRequest request)
    {
        NoticeAllhistory notice = noticeAllhistoryService.querryone(request.getParameter("noticeID"));
        model.addAttribute("notice",notice);
        return "static/notice/auditing/timenote";
    }
    /**
     * 将公告设置成审核未通过状态
     * @param request
     * @return
     */
    @RequestMapping(value = "nothrough",method = RequestMethod.POST)
    @ResponseBody
    public int nothrough(HttpServletRequest request)
    {
        NoticeAllhistory noticeAllhistory = new NoticeAllhistory();
        noticeAllhistory.setNoteID(request.getParameter("noteID"));
        noticeAllhistory.setStatus(0);
        int back = 0;
        back = noticeAllhistoryService.modiftystatus(noticeAllhistory);
        return back;
    }
    /**
     * 将公告设置成审核通过状态
     * @param request
     * @return
     */
    @RequestMapping(value = "through",method = RequestMethod.POST)
    @ResponseBody
    public int through(HttpServletRequest request)
    {
        int back = 0;
        NoticeAllhistory noticeAllhistory = new NoticeAllhistory();
        noticeAllhistory.setNoteID(request.getParameter("noteID"));
        noticeAllhistory.setStatus(1);
        back = noticeAllhistoryService.modiftystatus(noticeAllhistory);
        return back;
    }
     /**
     * 将公告设置成审核通过状态
     * @param request
     * @return
     */
    @RequestMapping(value = "timeout",method = RequestMethod.POST)
    @ResponseBody
    public int timeout(HttpServletRequest request)
    {
        int back = 0;
        NoticeAllhistory noticeAllhistory = new NoticeAllhistory();
        noticeAllhistory.setNoteID(request.getParameter("noteID"));
        noticeAllhistory.setStatus(3);
        back = noticeAllhistoryService.modiftystatus(noticeAllhistory);
        return back;
    }
}

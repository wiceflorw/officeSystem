package controller;

import com.entity.Dept;
import com.entity.Employees;
import com.entity.Job;
import com.service.DeptService;
import com.service.JobService;
import com.service.impl.DeptServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Administrator on 2017/6/1.
 */
@Controller
@RequestMapping(value = "/dept")
public class DeptController {
    /**
     * 管理部门的依赖
     */
    @Autowired
    private DeptService deptService;
    @Autowired
    private JobService jobService;

    /**
     * 部门管理页面的操作，先打印当前存在所有的部门
     */
    @RequestMapping(value = "info", method = RequestMethod.GET)
    public String getDeptInformation(Model model)
    {

        List<Dept> list = deptService.queryAll();
        /*
        for(Dept dept : list)
        {
            System.out.println(dept.getDeptID());
            System.out.println(dept.getDeptName());
            System.out.println(dept.getDeptText());
        }
        */
        model.addAttribute("deptList",list);
        return "static/dept/allDept";
    }

    /**
     * 模糊查询一个部门
     */
    @RequestMapping(value = "checkdeptbyname", method = RequestMethod.GET)
    public String getLimtDeptInformation(Model model, HttpServletRequest request)
    {
        String deptName = request.getParameter("name");
        System.out.println(deptName);
        List<Dept> list = deptService.queryByName(deptName);
        model.addAttribute("deptList",list);
        return "static/dept/allDept";
    }

    /**
     * 编辑部门信息阶段，先打印部门信息
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "modifydepshow",method = RequestMethod.GET)
    public String modifydepshow(Model model, HttpServletRequest request)
    {
        String id = request.getParameter("depID");
        Dept dept = deptService.queryDept(id);
        model.addAttribute(dept);
        return "static/dept/modifyinfo";
    }

    /**
     * 修改部门信息
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "modifydep",method = RequestMethod.POST)
    @ResponseBody
    public int modifydep(HttpServletRequest request, Model model)
    {
        Dept dept = new Dept();
        dept.setDeptID(request.getParameter("deptID"));
        dept.setDeptName(request.getParameter("deptName"));
        dept.setDeptText(request.getParameter("deptText"));
        int back = deptService.changeDept(dept);
        return back;
    }

    /**
     * 删除部门
     * @param response
     * @param request
     * @return
     */
    @RequestMapping(value = "delectdept",method = RequestMethod.POST)
    @ResponseBody
    public int delect(HttpServletResponse response, HttpServletRequest request)
    {
        String id = request.getParameter("id");
        int back = deptService.delDept(id);
        return back;
    }

    /**
     * 添加新部门
     * @param request
     * @return
     */
    @RequestMapping(value = "adddept", method = RequestMethod.POST)
    @ResponseBody
    public int addept(HttpServletRequest request)
    {
        Dept dept = new Dept();
        dept.setDeptID(request.getParameter("deptID"));
        dept.setDeptName(request.getParameter("deptName"));
        dept.setDeptText(request.getParameter("deptText"));
        int back = deptService.addDept(dept);
        return back;
    }

    /**
     * 根据部门ID查询所有部门职位
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "managejob", method = RequestMethod.GET)
    public String checkJobByDept(HttpServletRequest request, Model model)
    {
        String deptID = request.getParameter("deptID");
        List<Dept> list = deptService.queryDeptWithJob(deptID);
        model.addAttribute("deptList",list);
        return "/static/dept/jobOfTheDept";
    }
    /**
     * 修改职位信息之先打印原来的职位信息
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "getjob",method = RequestMethod.GET)
    public String getJob(HttpServletRequest request, Model model)
    {
        String jobID = request.getParameter("jobID");
        Job job = jobService.queryJob(jobID);
        System.out.println("sdf   "+job.getJobName());
        model.addAttribute(job);
        return "/static/dept/modifyjob";
    }

    /**
     * 修改职位信息
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "changejob",method = RequestMethod.POST)
    @ResponseBody
    public int modifyJob(HttpServletRequest request, Model model)
    {
        Job job = new Job();
        job.setDeptID(request.getParameter("deptID"));
        job.setJobID(request.getParameter("jobID"));
        job.setJobName(request.getParameter("jobName"));
        job.setJobText(request.getParameter("jobText"));
        int back = jobService.changeJob(job);
        return back;
    }

    /**
     * 删除职位
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "deljob",method = RequestMethod.POST)
    @ResponseBody
    public int deleteJob(HttpServletRequest request, Model model)
    {
        String jobID = request.getParameter("id");
        int back = jobService.delJob(jobID);
        return back;
    }

    /**
     * 准备添加职位
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "readyaddjob",method = RequestMethod.GET)
    public String addJob(HttpServletRequest request, Model model)
    {
        String deptID = request.getParameter("deptID");
        System.out.println(deptID);
        model.addAttribute("id",deptID);
        return "/static/dept/newjob";
    }

    /**
     * 添加某部门下的新的职位
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "addjob",method = RequestMethod.POST)
    @ResponseBody
    public int addJob2(HttpServletRequest request, Model model)
    {
        Job job = new Job();
        job.setDeptID(request.getParameter("deptID"));
        job.setJobID(request.getParameter("jobID"));
        job.setJobName(request.getParameter("jobName"));
        job.setJobText(request.getParameter("jobText"));
        int back = jobService.addJob(job);
        //System.out.println("oooooooooooooooooooo"+back);
        return back;
    }
    @RequestMapping(value = "manageemp",method = RequestMethod.GET)
    public String limtForDeptIDAndJobID(HttpServletRequest request, Model model)
    {
        String deptID = request.getParameter("deptID");
        String jobID = request.getParameter("jobID");
        return "/static/dept/newjob";
    }




}

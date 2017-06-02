package controller;

import com.entity.Employees;
import com.entity.Task;
import com.service.EmployeeService;
import com.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by BF on 2017/5/4.
 * 管理个人 MyselfController
 */
@Controller
@RequestMapping(value = "/system")
public class MyselfController
{
    /**
     * 管理自我的依赖
     */
    @Autowired
    private EmployeeService employeeService;

    /**
     * 管理任务得依赖
     */
    @Autowired
    private TaskService taskService;

    /**
     * 页面查询操作，显示个人信息
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "info", method = RequestMethod.GET)
    public String information(Model model,HttpServletRequest request)
    {
        HttpSession session = request.getSession();

        Employees employees = (Employees) session.getAttribute("em");
        model.addAttribute(employees);
        System.out.println(employees.toString());
        return "static/system/my_info";
    }

    /**
     * 修改密码，必须加@ResponseBody 否则无法用return返回
     *
     * @return
     */
    @RequestMapping(value = "/changepsw", method = RequestMethod.POST)
    @ResponseBody
    public int changepsw(HttpServletResponse response, HttpServletRequest request) throws IOException
    {
        String id = request.getParameter("id");
        String oldpsw = request.getParameter("oldpsw");
        String newpsw = request.getParameter("newpsw");

        int back = employeeService.changpsw(id, oldpsw, newpsw);
        System.out.println(back);
        return back;
    }

    /**
     * 修改个人信息页面
     *
     * @param request 获得from表单中的参数
     * @param model   返回视图
     * @return
     */
    @RequestMapping(value = "/upade", method = RequestMethod.POST)
    public String updateemplyee(HttpServletRequest request, Model model)
    {
        /**
         * 获取表单参数
         * 将其放入实体类中
         * 另外一种方法是from表单传回一个实体类
         */
        Employees employees = new Employees();
        employees.setEmployeeID(request.getParameter("idnum"));
        employees.setEmployeeName(request.getParameter("name"));
        employees.setSex(request.getParameter("sle1"));
        employees.setLearn(request.getParameter("sle2"));
        employees.setBirthday(request.getParameter("birthdate"));
        employees.setAddress(request.getParameter("address"));
        employees.setMobile(request.getParameter("phone"));
        employees.setEmail(request.getParameter("email"));
        employees.setCode(request.getParameter("code"));
        employees.setDeptID(request.getParameter("dept"));
        employees.setJobID(request.getParameter("job"));
        String level = request.getParameter("level");
        int a = Integer.parseInt(level);
        //employees.setUserLevel(Integer.parseInt(request.getParameter("level")));
        employees.setUserLevel(a);
        employees.setOnLine(request.getParameter("online"));
        employees.setWorkState(request.getParameter("workState"));
        employees.setPwd(request.getParameter("psw"));

        System.out.println(employees.toString());
        //进行用户信息的修改
        int b = employeeService.changeEmployee(employees);
        //查询新的用户信息
        Employees e2 = employeeService.queryEmployee(employees.getEmployeeID());
        System.out.println(e2);
        model.addAttribute(e2);

        return "static/system/my_info";
    }

    /**
     * 查询所有任务信息
     *
     * @param model 将数据添加到model中，前台用el表达式读取出来
     * @return
     */
    @RequestMapping(value = "taskinfo", method = RequestMethod.GET)
    public String alltask(Model model)
    {
        List<Task> taskList = taskService.queryAll();
        for (Task task : taskList)
        {
            System.out.println(task.toString());
        }
        model.addAttribute(taskList);
        return "static/system/task";
    }

    /**
     * \
     * 用post方法查询一个任务信息，并已视图方式放回
     *
     * @param model
     * @param request 获取POST方法中传过来的ID
     * @return
     */
    @RequestMapping(value = "taskone", method = RequestMethod.GET)
    public String onetask(Model model, HttpServletRequest request)
    {
        String taskID = request.getParameter("taskID");
        System.out.println(taskID);
        Task task = taskService.queryTask(taskID);
        System.out.println(task.toString());
        model.addAttribute(task);
        return "static/system/taskinfo";
    }

    /**
     * 修改任务信息的查询操作
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "modifytaskshow", method = RequestMethod.GET)
    public String modifytaskshow(Model model, HttpServletRequest request)
    {
        String taskID = request.getParameter("taskID");
        System.out.println(taskID);
        Task task = taskService.queryTask(taskID);
        System.out.println(task.toString());
        model.addAttribute(task);
        return "static/system/modifytask";
    }

    @RequestMapping(value = "modifytask", method = RequestMethod.POST)
    @ResponseBody
    public int modifytask(HttpServletRequest request)
    {
        Task task = new Task();
        task.setTaskID(request.getParameter("taskID"));
        task.setTaskName(request.getParameter("taskName"));
        task.setTaskInfo(request.getParameter("taskInfo"));
        task.setGetTime(request.getParameter("nowTime"));
        task.setTaskState(request.getParameter("taskState"));
        task.setEmployeeID(request.getParameter("employeeID"));
        task.setDoID(request.getParameter("doID"));

        int back = taskService.changeTask(task);
        System.out.println(back);
        return back;
    }

    /**
     * 新增一个任务信息 返回1代表成功
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "addtask", method = RequestMethod.POST)
    @ResponseBody
    public int newtask(HttpServletRequest request)
    {
        Task task = new Task();
        task.setTaskID(request.getParameter("taskID"));
        task.setTaskName(request.getParameter("taskName"));
        task.setTaskInfo(request.getParameter("taskInfo"));
        task.setGetTime(request.getParameter("nowTime"));
        task.setTaskState(request.getParameter("taskState"));
        task.setEmployeeID(request.getParameter("employeeID"));
        task.setDoID(request.getParameter("doID"));

        int back = taskService.addTask(task);
        System.out.println(back);
        return back;
    }

    /**
     * 判断任务编号是否存在
     * @param request
     * @return
     */
    @RequestMapping(value = "queryrepeat", method = RequestMethod.POST)
    @ResponseBody
    public int repeat(HttpServletRequest request)
    {
        String taskID = request.getParameter("taskID");
        int back = 1;
        /**
         * 当ID不在存在时查找会出错，添加异常处理可以忽略他，最终都会return
         */
        try
        {
            Task task = taskService.queryTask(taskID);
            if (task.toString()!=null)
            {
                back = 0;
            }
        }
        catch (Exception e)
        {

        }
        finally
        {
            return back;
        }
    }
}

package controller;
import com.entity.Employees;
import com.service.EmployeeService;
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
 * Created by BF on 2017/5/3.
 * Employee Controller
 */
@Controller
@RequestMapping(value = "user")
public class UserController
{
    /**
     * 注入依赖
     */
    @Autowired
    private EmployeeService employeeService;

    /**
     * 查询全部用户
     * @param model 返回页面容器
     * @param request
     * @return
     */
    @RequestMapping(value = "alluser",method = RequestMethod.GET)
    public String list(Model model,HttpServletRequest request)
    {
        List<Employees> list = employeeService.queryAll();
        model.addAttribute("list",list);
        return "static/user/changlvke";
    }

    /**
     * 查询单个用户，以json格式返回数据
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "queryuser",method = RequestMethod.POST)
    @ResponseBody
    public Employees query(HttpServletRequest request, HttpServletResponse response)
    {
        String count = request.getParameter("level");
        String user = request.getParameter("name");
        Employees employees = employeeService.queryEmployee(user);
        return employees;
    }

    /**
     * 删除一个用户
     * @param response
     * @param request
     * @return 返回1表示成功，0表示失败
     */
    @RequestMapping(value = "delectuser",method = RequestMethod.POST)
    @ResponseBody
    public int delect(HttpServletResponse response,HttpServletRequest request)
    {
        String id = request.getParameter("id");
        int back = employeeService.delEmployee(id);
        return back;
    }

    @RequestMapping(value = "modifyempshow",method = RequestMethod.GET)
    public String modifyempshow(Model model,HttpServletRequest request)
    {
        String id = request.getParameter("empID");
        Employees employees = employeeService.queryEmployee(id);
        model.addAttribute(employees);
        return "static/user/modifyinfo";
    }

    /**
     * 修改用户信息
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "modifyemp",method = RequestMethod.POST)
    @ResponseBody
    public int modifyemp(HttpServletRequest request,Model model)
    {
        Employees employees = new Employees();
        employees.setEmployeeID(request.getParameter("empID"));
        employees.setEmployeeName(request.getParameter("empName"));
        employees.setSex(request.getParameter("empSex"));
        employees.setBirthday(request.getParameter("empBirth"));
        employees.setAddress(request.getParameter("empAddress"));
        employees.setCode(request.getParameter("empCode"));
        employees.setLearn(request.getParameter("empLearn"));
        employees.setMobile(request.getParameter("empPhone"));
        employees.setEmail(request.getParameter("empEmail"));
        employees.setDeptID(request.getParameter("empDept"));
        employees.setJobID(request.getParameter("empJob"));
        employees.setPwd(request.getParameter("empPsw"));
        employees.setUserLevel(Integer.parseInt(request.getParameter("empLevel")));

        int back = employeeService.changeEmployee(employees);

        return back;
    }

    /**
     * 新增用户信息
     * @param request
     * @return
     */
    @RequestMapping(value = "addemp", method = RequestMethod.POST)
    @ResponseBody
    public int addemp(HttpServletRequest request)
    {
        Employees employees = new Employees();
        employees.setEmployeeID(request.getParameter("empID"));
        employees.setEmployeeName(request.getParameter("empName"));
        employees.setSex(request.getParameter("empSex"));
        employees.setBirthday(request.getParameter("empBirth"));
        employees.setAddress(request.getParameter("empAddress"));
        employees.setCode(request.getParameter("empCode"));
        employees.setLearn(request.getParameter("empLearn"));
        employees.setMobile(request.getParameter("empPhone"));
        employees.setEmail(request.getParameter("empEmail"));
        employees.setDeptID(request.getParameter("empDept"));
        employees.setJobID(request.getParameter("empJob"));
        employees.setPwd(request.getParameter("empPsw"));
        employees.setUserLevel(Integer.parseInt(request.getParameter("empLevel")));
        employees.setOnLine("离线");
        employees.setWorkState("未工作");

        int back = employeeService.addEmployee(employees);

        return back;
    }

}

package controller;

import com.entity.Employees;
import com.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by BF on 2017/5/31.
 */
@Controller
@RequestMapping(value = "login")
public class LoginController
{
    /**
     * 注入依赖
     */
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "confim")
    @ResponseBody
    public Employees login(HttpServletRequest request,HttpServletResponse response)
    {

        String count = request.getParameter("count");
        String pwd = request.getParameter("pwd");
        Employees em;
        em = employeeService.queryEmployee(count);

        if (em==null)
        {
            System.out.println("账号不存在");
        }

        HttpSession session = request.getSession();
        session.setAttribute("em",em);
        return em;

    }

}

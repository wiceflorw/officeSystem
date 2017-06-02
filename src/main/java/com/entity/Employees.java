package com.entity;

/**
 * Created by BF on 2017/4/27.
 */
public class Employees
{
    private String employeeID;
    private String employeeName;
    private String sex;
    private String birthday;
    private String address;
    private String code;
    private String learn;
    private String mobile;
    private String email;
    private String jobID;
    private String deptID;
    private String workState;
    private String photo;
    private String pwd;
    private int userLevel;
    private String onLine;

    private Job job;
    private Dept dept;

    public Job getJob()
    {
        return job;
    }

    public void setJob(Job job)
    {
        this.job = job;
    }

    public Dept getDept()
    {
        return dept;
    }

    public void setDept(Dept dept)
    {
        this.dept = dept;
    }

    public String getEmployeeID()
    {
        return employeeID;
    }

    public void setEmployeeID(String employeeID)
    {
        this.employeeID = employeeID;
    }

    public String getEmployeeName()
    {
        return employeeName;
    }

    public void setEmployeeName(String employeeName)
    {
        this.employeeName = employeeName;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getBirthday()
    {
        return birthday;
    }

    public void setBirthday(String birthday)
    {
        this.birthday = birthday;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getCode()
    {
        return code;
    }

    public void setCode(String code)
    {
        this.code = code;
    }

    public String getLearn()
    {
        return learn;
    }

    public void setLearn(String learn)
    {
        this.learn = learn;
    }

    public String getMobile()
    {
        return mobile;
    }

    public void setMobile(String mobile)
    {
        this.mobile = mobile;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getJobID()
    {
        return jobID;
    }

    public void setJobID(String jobID)
    {
        this.jobID = jobID;
    }

    public String getDeptID()
    {
        return deptID;
    }

    public void setDeptID(String deptID)
    {
        this.deptID = deptID;
    }

    public String getWorkState()
    {
        return workState;
    }

    public void setWorkState(String workState)
    {
        this.workState = workState;
    }

    public String getPhoto()
    {
        return photo;
    }

    public void setPhoto(String photo)
    {
        this.photo = photo;
    }

    public String getPwd()
    {
        return pwd;
    }

    public void setPwd(String pwd)
    {
        this.pwd = pwd;
    }

    public int getUserLevel()
    {
        return userLevel;
    }

    public void setUserLevel(int userLevel)
    {
        this.userLevel = userLevel;
    }

    public String getOnLine()
    {
        return onLine;
    }

    public void setOnLine(String onLine)
    {
        this.onLine = onLine;
    }

    @Override
    public String toString()
    {
        return "Employees{" +
                "employeeID='" + employeeID + '\'' +
                ", employeeName='" + employeeName + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday='" + birthday + '\'' +
                ", address='" + address + '\'' +
                ", code='" + code + '\'' +
                ", learn='" + learn + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", jobID='" + jobID + '\'' +
                ", deptID='" + deptID + '\'' +
                ", workState='" + workState + '\'' +
                ", photo='" + photo + '\'' +
                ", pwd='" + pwd + '\'' +
                ", userLevel=" + userLevel +
                ", onLine='" + onLine + '\'' +
                ", job=" + job +
                ", dept=" + dept +
                '}';
    }
}

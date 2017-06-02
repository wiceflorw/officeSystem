package com.entity;

public class Dept
{
    private String deptID;
    private String deptName;
    private String deptText;

    private Employees employees;
    private Job job;

    public String getDeptID()
    {
        return deptID;
    }

    public void setDeptID(String deptID)
    {
        this.deptID = deptID;
    }

    public String getDeptName()
    {
        return deptName;
    }

    public void setDeptName(String deptName)
    {
        this.deptName = deptName;
    }

    public String getDeptText()
    {
        return deptText;
    }

    public void setDeptText(String deptText)
    {
        this.deptText = deptText;
    }

    public Employees getEmployees() {
        return employees;
    }

    public void setEmployees(Employees employees) {
        this.employees = employees;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    @Override
    public String toString()
    {
        return "Dept{" +
                "deptId='" + deptID + '\'' +
                ", deptName='" + deptName + '\'' +
                ", deptText='" + deptText + '\'' +
                '}';
    }
}

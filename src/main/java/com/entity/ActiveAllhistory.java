package com.entity;

public class ActiveAllhistory
{
    private String activeID;
    private String activeName;
    private String activeInfo;
    private int activeAgreeNum;
    private int whetherGlobal;
    private String employeeID;
    private int status;


    public String getActiveID()
    {
        return activeID;
    }

    public void setActiveID(String activeID)
    {
        this.activeID = activeID;
    }

    public String getActiveName()
    {
        return activeName;
    }

    public void setActiveName(String activeName)
    {
        this.activeName = activeName;
    }

    public String getActiveInfo()
    {
        return activeInfo;
    }

    public void setActiveInfo(String activeInfo)
    {
        this.activeInfo = activeInfo;
    }

    public int getActiveAgreeNum()
    {
        return activeAgreeNum;
    }

    public void setActiveAgreeNum(int activeAgreeNum)
    {
        this.activeAgreeNum = activeAgreeNum;
    }

    public int getWhetherGlobal()
    {
        return whetherGlobal;
    }

    public void setWhetherGlobal(int whetherGlobal)
    {
        this.whetherGlobal = whetherGlobal;
    }

    public String getEmployeeID()
    {
        return employeeID;
    }

    public void setEmployeeID(String employeeID)
    {
        this.employeeID = employeeID;
    }

    public int getStatus()
    {
        return status;
    }

    public void setStatus(int status)
    {
        this.status = status;
    }

    @Override
    public String toString()
    {
        return "ActiveAllhistory{" +
                "activeId='" + activeID + '\'' +
                ", activeName='" + activeName + '\'' +
                ", activeInfo='" + activeInfo + '\'' +
                ", activeAgreeNum=" + activeAgreeNum +
                ", whetherGlobal=" + whetherGlobal +
                ", employeeId='" + employeeID + '\'' +
                ", status=" + status +
                '}';
    }
}

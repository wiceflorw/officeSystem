package com.entity;

/**
 * Created by BF on 2017/4/27.
 * 公告实体类
 */
public class Notice
{
    private String noteID;
    private String employeeID;
    private String noteName;
    private String noteInfo;
    private String noteTime;
    private int whetherGlobal;
    private Employees employees;

    public Employees getEmployees()
    {
        return employees;
    }

    public void setEmployees(Employees employees)
    {
        this.employees = employees;
    }

    public String getNoteID()
    {
        return noteID;
    }

    public void setNoteID(String noteID)
    {
        this.noteID = noteID;
    }

    public int getWhetherGlobal()
    {
        return whetherGlobal;
    }

    public void setWhetherGlobal(int whetherGlobal)
    {
        this.whetherGlobal = whetherGlobal;
    }

    public String getNoteTime()
    {
        return noteTime;
    }

    public void setNoteTime(String noteTime)
    {
        this.noteTime = noteTime;
    }

    public String getNoteInfo()
    {
        return noteInfo;
    }

    public void setNoteInfo(String noteInfo)
    {
        this.noteInfo = noteInfo;
    }

    public String getNoteName()
    {
        return noteName;
    }

    public void setNoteName(String noteName)
    {
        this.noteName = noteName;
    }

    public String getEmployeeID()
    {
        return employeeID;
    }

    public void setEmployeeID(String employeeID)
    {
        this.employeeID = employeeID;
    }

    @Override
    public String toString()
    {
        return "Notice{" +
                "noteID='" + noteID + '\'' +
                ", employeeID='" + employeeID + '\'' +
                ", noteName='" + noteName + '\'' +
                ", noteInfo='" + noteInfo + '\'' +
                ", noteTime='" + noteTime + '\'' +
                ", whetherGlobal=" + whetherGlobal +
                ", employees=" + employees +
                '}';
    }
}

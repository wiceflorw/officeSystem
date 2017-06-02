package com.entity;

/**
 * Created by BF on 2017/4/27.
 */
public class NoticeAllhistory
{
    private String noteID;
    private String employeeID;
    private String noteName;
    private String noteInfo;
    private String noteTime;
    private int whetherGlobal;
    private int status;

    public Employees getEmployees()
    {
        return employees;
    }

    public void setEmployees(Employees employees)
    {
        this.employees = employees;
    }

    private Employees employees;
    public String getNoteID()
    {
        return noteID;
    }

    public void setNoteID(String noteID)
    {
        this.noteID = noteID;
    }

    public int getStatus()
    {
        return status;
    }

    public void setStatus(int status)
    {
        this.status = status;
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
        return "NoticeAllhistory{" +
                "noteID='" + noteID + '\'' +
                ", employeeID='" + employeeID + '\'' +
                ", noteName='" + noteName + '\'' +
                ", noteInfo='" + noteInfo + '\'' +
                ", noteTime='" + noteTime + '\'' +
                ", whetherGlobal=" + whetherGlobal +
                ", status=" + status +
                '}';
    }
}

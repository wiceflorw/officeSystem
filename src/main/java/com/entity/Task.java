package com.entity;

/**
 * Created by BF on 2017/4/27.
 */
public class Task
{
    private String taskID;
    private String taskName;
    private String taskInfo;
    private String getTime;
    private String taskState;
    private String employeeID;
    private String doID;

    public String getTaskID()
    {
        return taskID;
    }

    public void setTaskID(String taskID)
    {
        this.taskID = taskID;
    }

    public String getDoID()
    {
        return doID;
    }

    public void setDoID(String doID)
    {
        this.doID = doID;
    }

    public String getEmployeeID()
    {
        return employeeID;
    }

    public void setEmployeeID(String employeeID)
    {
        this.employeeID = employeeID;
    }

    public String getTaskState()
    {
        return taskState;
    }

    public void setTaskState(String taskState)
    {
        this.taskState = taskState;
    }

    public String getGetTime()
    {
        return getTime;
    }

    public void setGetTime(String getTime)
    {
        this.getTime = getTime;
    }

    public String getTaskInfo()
    {
        return taskInfo;
    }

    public void setTaskInfo(String taskInfo)
    {
        this.taskInfo = taskInfo;
    }

    public String getTaskName()
    {
        return taskName;
    }

    public void setTaskName(String taskName)
    {
        this.taskName = taskName;
    }

    @Override
    public String toString()
    {
        return "Task{" +
                "taskID='" + taskID + '\'' +
                ", taskName='" + taskName + '\'' +
                ", taskInfo='" + taskInfo + '\'' +
                ", getTime='" + getTime + '\'' +
                ", taskState='" + taskState + '\'' +
                ", employeeID='" + employeeID + '\'' +
                ", doID='" + doID + '\'' +
                '}';
    }
}

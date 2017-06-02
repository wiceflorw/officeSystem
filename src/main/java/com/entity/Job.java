package com.entity;

public class Job
{
    private String jobID;
    private String deptID;
    private String jobName;
    private String jobText;

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

    public String getJobName()
    {
        return jobName;
    }

    public void setJobName(String jobName)
    {
        this.jobName = jobName;
    }

    public String getJobText()
    {
        return jobText;
    }

    public void setJobText(String jobText)
    {
        this.jobText = jobText;
    }

    @Override
    public String toString()
    {
        return "Job{" +
                "jobId='" + jobID + '\'' +
                ", deptId='" + deptID + '\'' +
                ", jobName='" + jobName + '\'' +
                ", jobText='" + jobText + '\'' +
                '}';
    }
}

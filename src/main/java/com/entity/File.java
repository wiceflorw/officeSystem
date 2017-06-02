package com.entity;

/**
 * Created by BF on 2017/4/27.
 */
public class File
{
    private int fileID;
    private String fileTime;
    private String fileText;
    private String fileForm;
    private String fileInt;
    private String fileName;
    private String fileRoute;

    public int getFileID()
    {
        return fileID;
    }

    public void setFileID(int fileID)
    {
        this.fileID = fileID;
    }

    public String getFileTime()
    {
        return fileTime;
    }

    public void setFileTime(String fileTime)
    {
        this.fileTime = fileTime;
    }

    public String getFileText()
    {
        return fileText;
    }

    public void setFileText(String fileText)
    {
        this.fileText = fileText;
    }

    public String getFileForm()
    {
        return fileForm;
    }

    public void setFileForm(String fileForm)
    {
        this.fileForm = fileForm;
    }

    public String getFileInt()
    {
        return fileInt;
    }

    public void setFileInt(String fileInt)
    {
        this.fileInt = fileInt;
    }

    public String getFileName()
    {
        return fileName;
    }

    public void setFileName(String fileName)
    {
        this.fileName = fileName;
    }

    public String getFileRoute()
    {
        return fileRoute;
    }

    public void setFileRoute(String fileRoute)
    {
        this.fileRoute = fileRoute;
    }

    @Override
    public String toString()
    {
        return "File{" +
                "fileID=" + fileID +
                ", fileTime='" + fileTime + '\'' +
                ", fileText='" + fileText + '\'' +
                ", fileForm='" + fileForm + '\'' +
                ", fileInt='" + fileInt + '\'' +
                ", fileName='" + fileName + '\'' +
                ", fileRoute='" + fileRoute + '\'' +
                '}';
    }
}

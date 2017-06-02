package com.entity;

/**
 * Created by BF on 2017/5/24.
 */
public class Email
{
    private String sender;
    private String addressee;
    private String senderemail;
    private String title;
    private String test;
    private String fileroad;
    private int id;

    public String getSender()
    {
        return sender;
    }

    public void setSender(String sender)
    {
        this.sender = sender;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getFileroad()
    {
        return fileroad;
    }

    public void setFileroad(String fileroad)
    {
        this.fileroad = fileroad;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getAddressee()
    {
        return addressee;
    }

    public void setAddressee(String addressee)
    {
        this.addressee = addressee;
    }

    public String getSenderemail()
    {
        return senderemail;
    }

    public void setSenderemail(String senderemail)
    {
        this.senderemail = senderemail;
    }

    public String getTest()
    {
        return test;
    }

    public void setTest(String test)
    {
        this.test = test;
    }

    @Override
    public String toString()
    {
        return "Email{" +
                "sender='" + sender + '\'' +
                ", addressee='" + addressee + '\'' +
                ", senderemail='" + senderemail + '\'' +
                ", title='" + title + '\'' +
                ", test='" + test + '\'' +
                ", fileroad='" + fileroad + '\'' +
                ", id=" + id +
                '}';
    }
}

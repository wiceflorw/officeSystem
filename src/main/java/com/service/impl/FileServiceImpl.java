package com.service.impl;

import com.dao.file.fileDao;
import com.entity.File;
import com.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 文件FileDao接口 无历史总表
 */
@Service
public class FileServiceImpl implements FileService
{
    //注入依赖
    @Autowired
    private fileDao fileDao;

    private int backnum = 0;
    /**
     * 增加新的文件
     * @param file 传入一个文件实体类
     * @return 返回0代表失败，返回1代表成功
     * 文件的ID是自增的
     */
    public int addFile(File file)
    {
        backnum = fileDao.addFile(file);
        return backnum;
    }

    /**
     * 删除文件
     * @param fileID 传入一个文件ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int delFile(int fileID)
    {
        backnum = fileDao.delFile(fileID);
        return backnum;
    }

    /**
     * 修改文件
     * @param file 传入一个文件实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeFile(File file)
    {
        backnum = fileDao.changeFile(file);
        return backnum;
    }
    /**
     * 查询文件
     * @param fileID 传入一个文件ID
     * @return 返回一个文件实体类
     */
    public File queryFile(int fileID)
    {
        File file = fileDao.queryFile(fileID);
        return file;
    }

    /**
     * 查询所有文件信息，只有高级用户才可以操作
     * @return 返回一个File类型的List
     */
    public List<File> queryAll()
    {
        List<File> list = fileDao.queryAll();
        if (list!=null && !list.isEmpty())
        {
            return list;
        }
        return null;
    }
}

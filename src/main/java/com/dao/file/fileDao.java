package com.dao.file;

import com.entity.File;

import java.util.List;

/**
 * Created by BF on 2017/4/27.
 * 文件FileDao接口 无历史总表
 */
public interface fileDao
{
    /**
     * 增加新的文件
     * @param file 传入一个文件实体类
     * @return 返回0代表失败，返回1代表成功
     * 文件的ID是自增的
     */
    public int addFile(File file);

    /**
     * 删除文件
     * @param fileID 传入一个文件ID
     * @return 返回0代表失败，返回1代表成功
     */
    public int delFile(int fileID);

    /**
     * 修改文件
     * @param file 传入一个文件实体类
     * @return 返回0代表失败，返回1代表成功
     */
    public int changeFile(File file);

    /**
     * 查询文件
     * @param fileID 传入一个文件ID
     * @return 返回一个文件实体类
     */
    public File queryFile(int fileID);

    /**
     *查询所有文件信息，只有高级用户才可以操作
     * @return 返回一个File类型的List
     */
    public List<File> queryAll();
}

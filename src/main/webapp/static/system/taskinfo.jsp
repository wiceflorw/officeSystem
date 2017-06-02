<%--
  Created by IntelliJ IDEA.
  User: BF
  Date: 2017/5/11
  Time: 9:38
  To change this template use File | Settings | File Templates.
  显示具体任务信息
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <link rel="stylesheet" type="text/css" href="../../common/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/my_info.css"/>
    <title>任务信息</title>
</head>
<body>
<div>
    <div class="kv-item clearfix">
        <label>任务编号：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <%--<c:out value="${employees.employeeName}"/>--%>
            ${task.taskID}
        </div>
    </div>

    <div class="kv-item clearfix">
        <label>任务名称：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <%--<c:out value="${employees.employeeName}"/>--%>
            ${task.taskName}
        </div>
    </div>

    <div class="kv-item clearfix">
        <label>任务介绍：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <%--<c:out value="${employees.employeeName}"/>--%>
            ${task.taskInfo}
        </div>
    </div>

    <div class="kv-item clearfix">
        <label>添加任务时间：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <%--将从数据库中读取的日期由String格式转成date格式--%>
            <fmt:parseDate value="${task.getTime}" var="date1" />
                <%--格式转换完成后用fromatDate输出--%>
            <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd HH:mm:ss" />
        </div>
    </div>

    <div class="kv-item clearfix">
        <label>任务状态：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <%--<c:out value="${employees.employeeName}"/>--%>
            ${task.taskState}
        </div>
    </div>

    <div class="kv-item clearfix">
        <label>任务添加人：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <%--<c:out value="${employees.employeeName}"/>--%>
            ${task.employeeID}
        </div>
    </div>

    <div class="kv-item clearfix">
        <label>任务执行者：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <%--<c:out value="${employees.employeeName}"/>--%>
            ${task.doID}
        </div>
    </div>
</div>
</body>
</html>

<%--
    任务信息修改jsp，其中任务编号，时间不可手工修改！

    system/modifytask
--%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: BF
  Date: 2017/5/12
  Time: 10:36
  To change this template use File | Settings | File Templates.
  修改任务信息JSP
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
    <div style="float: left">
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
                <fmt:parseDate value="${task.getTime}" var="date1"/>
                <%--格式转换完成后用fromatDate输出--%>
                <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </div>
        </div>

        <div class="kv-item clearfix">
            <label>任务状态：</label>
            <div class="kv-item-content" style="line-height:30px;">
                ${task.taskState}
            </div>
        </div>

        <div class="kv-item clearfix">
            <label>任务添加人：</label>
            <div class="kv-item-content" style="line-height:30px;">
                ${task.employeeID}
            </div>
        </div>

        <div class="kv-item clearfix">
            <label>任务执行者：</label>
            <div class="kv-item-content" style="line-height:30px;">
                ${task.doID}
            </div>
        </div>
    </div>
    <div style="float: left;margin-left: 5%">
        <div class="kv-item clearfix">
            <label>任务编号：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" value="${task.taskID}" id="taskID" disabled>
            </div>
            <div class="kv-item-tip">任务编号不可修改</div>
        </div>

        <div class="kv-item clearfix">
            <label>任务名称：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${task.taskName}" id="taskName">
            </div>
        </div>

        <div class="kv-item clearfix">
            <label>任务介绍：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${task.taskInfo}" id="taskInfo">
            </div>
        </div>

        <div class="kv-item clearfix">
            <label>修改任务时间：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <%
                    Date dt = new Date();//如果不需要格式,可直接用dt,dt就是当前系统时间
                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置显示格式
                    String nowTime = "";
                    nowTime = df.format(dt);//用DateFormat的format()方法在dt中获取并以yyyy/MM/dd HH:mm:ss格式显示
                    System.out.println(nowTime);
                %>
                <input type="text" value="<%=nowTime%>" id="nowTime" disabled>
            </div>
            <div class="kv-item-tip">任务时间由系统生成</div>
        </div>

        <div class="kv-item clearfix">
            <label>任务状态：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${task.taskState}" id="taskState">
            </div>
        </div>

        <div class="kv-item clearfix">
            <label>任务添加人：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${task.employeeID}" id="employeeID">
            </div>
        </div>

        <div class="kv-item clearfix">
            <label>任务执行者：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${task.doID}" id="doID">
            </div>
        </div>
        <button class="sapar-btn sapar-btn-recom" value="" style="margin-left: 40%" onclick="modifyinfo()">确认修改</button>
    </div>
</div>
</body>
<script type="text/javascript" src="../../js/jquery-3.1.1.js"></script>
<script type="text/javascript">
    //post方法动态存储
    function modifyinfo() {
        var taskID = $('#taskID').val();
        var taskName = $('#taskName').val();
        var taskInfo = $('#taskInfo').val();
        var nowTime = $('#nowTime').val();
        var taskState = $('#taskState').val();
        var employeeID = $('#employeeID').val();
        var doID = $('#doID').val();
        $.post(
                '${pageContext.request.contextPath}/system/modifytask',
                {
                    taskID:taskID,
                    taskName:taskName,
                    taskInfo:taskInfo,
                    nowTime:nowTime,
                    taskState:taskState,
                    employeeID:employeeID,
                    doID:doID
                },
                function (text,status) {
                    if(text==1)
                    {
                        alert("修改成功");
                    }
                    else {
                        alert("修改失败");
                    }

                }
        )
    }

</script>
</html>

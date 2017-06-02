<%--
    用户信息修改jsp，其中任务编号，时间不可手工修改！

    system/modifytask
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
    <script type="text/javascript" src="../../common/js/sapar.js"></script>
    <script type="text/javascript" src="../../common/js/WdatePicker.js"></script>
    <title>修改职位信息</title>
</head>
<body>
<div>
    <div style="margin-left: 5%;margin-top: 5%">
        <div class="kv-item clearfix">
            <label>部门ID编号：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" disabled="disabled" value="${job.deptID}" id="deptID">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>职位ID编号：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" disabled="disabled" value="${job.jobID}" id="jobID">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>职位名称：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${job.jobName}" id="jobName">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>职位介绍：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${job.jobText}" id="jobText">
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
        var deptID = $('#deptID').val();
        var jobID = $('#jobID').val();
        var jobName = $('#jobName').val();
        var jobText = $('#jobText').val();
        $.post(
                '${pageContext.request.contextPath}/dept/changejob',
                {
                    deptID: deptID,
                    jobName: jobName,
                    jobID: jobID,
                    jobText: jobText
                },
                function (text, status) {
                    if (text == 1) {
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

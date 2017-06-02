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
    <title>修改用户信息</title>
</head>
<body>
<div>
    <div style="margin-left: 5%;margin-top: 5%">
        <div class="kv-item clearfix">
            <label>用户ID编号：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.employeeID}" id="empID">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户姓名：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.employeeName}" id="empName">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户性别：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.sex}" id="empSex">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户生日：</label>
            <div class="time-select">
                <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                       placeholder="${employees.birthday}" name="birthdate" id="empBirth">
                <i class="date-icon"></i>
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户地址：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.address}" id="empAddress">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>身份证号：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.code}" id="empCode">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户学历：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.learn}" id="empLearn">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户手机：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.mobile}" id="empPhone">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户邮箱：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.email}" id="empEmail">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户部门：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.dept.deptName}" id="empDept">
            </div>
            <div class="kv-item-tip">请填写部门ID</div>
        </div>
        <div class="kv-item clearfix">
            <label>用户职位：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.job.jobName}" id="empJob">
            </div>
            <div class="kv-item-tip">请填写职位ID</div>
        </div>
        <div class="kv-item clearfix">
            <label>用户密码：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.pwd}" id="empPsw">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户级别：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${employees.userLevel}" id="empLevel">
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
        var empID = $('#empID').val();
        var empName = $('#empName').val();
        var empSex = $('#empSex').val();
        var empBirth = $('#empBirth').val();
        var empAddress = $('#empAddress').val();
        var empCode = $('#empCode').val();
        var empLearn = $('#empLearn').val();
        var empPhone = $('#empPhone').val();
        var empEmail = $('#empEmail').val();
        var empDept = $('#empDept').val();
        var empJob = $('#empJob').val();
        var empPsw = $('#empPsw').val();
        var empLevel = $('#empLevel').val();
        $.post(
                '${pageContext.request.contextPath}/user/modifyemp',
                {
                    empID: empID,
                    empName: empName,
                    empSex: empSex,
                    empBirth: empBirth,
                    empAddress: empAddress,
                    empCode: empCode,
                    empLearn: empLearn,
                    empPhone: empPhone,
                    empEmail: empEmail,
                    empDept: empDept,
                    empJob: empJob,
                    empPsw: empPsw,
                    empLevel: empLevel
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

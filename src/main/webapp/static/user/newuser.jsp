<%--
  Created by IntelliJ IDEA.
  User: BF
  Date: 2017/5/15
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <link rel="stylesheet" type="text/css" href="../../common/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/my_info.css"/>
    <script type="text/javascript" src="../../common/js/sapar.js"></script>
    <script type="text/javascript" src="../../common/js/WdatePicker.js"></script>
    <title>新增用户</title>
</head>
<body>
<div>
    <div style="margin-left: 5%;margin-top: 5%">
        <div class="kv-item clearfix">
            <label>用户ID编号：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empID">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户姓名：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empName">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户性别：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empSex">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户生日：</label>
            <div class="time-select">
                <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                       placeholder="" name="birthdate" id="empBirth">
                <i class="date-icon"></i>
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户地址：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empAddress">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>身份证号：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empCode">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户学历：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empLearn">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户手机：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empPhone">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户邮箱：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empEmail">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户部门：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empDept">
            </div>
            <div class="kv-item-tip">请填写部门ID</div>
        </div>
        <div class="kv-item clearfix">
            <label>用户职位：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empJob">
            </div>
            <div class="kv-item-tip">请填写职位ID</div>
        </div>
        <div class="kv-item clearfix">
            <label>用户密码：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empPsw">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>用户级别：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="empLevel">
            </div>
        </div>
        <button class="sapar-btn sapar-btn-recom" value="" style="margin-left: 40%" onclick="modifyinfo()">确认增加</button>
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
                '${pageContext.request.contextPath}/user/addemp',
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
                        alert("添加用户成功");
                    }
                    else {
                        alert("添加用户失败");
                    }

                }
        )
    }

</script>
</html>

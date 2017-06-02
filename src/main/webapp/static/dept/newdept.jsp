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
    <title>新增部门</title>
</head>
<body>
<div>
    <div style="margin-left: 5%;margin-top: 5%">
        <div class="kv-item clearfix">
            <label>部门ID编号：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text"   id="deptID">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>部门名称：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="deptName">
            </div>
        </div>
        <div class="kv-item clearfix">
            <label>部门介绍：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="" id="deptText">
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
        var deptID = $('#deptID').val();
        var deptName = $('#deptName').val();
        var deptText = $('#deptText').val();
        $.post(
                '${pageContext.request.contextPath}/dept/adddept',
                {
                    deptName: deptName,
                    deptID: deptID,
                    deptText: deptText
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

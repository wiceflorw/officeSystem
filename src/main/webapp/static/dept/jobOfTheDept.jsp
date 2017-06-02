<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <link rel="stylesheet" type="text/css" href="../../common/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/user/css/user.css"/>

    <script type="text/javascript" src="../../common/js/jquery.js"></script>
    <script type="text/javascript" src="../../common/js/sapar.js"></script>
    <script type="text/javascript" src="../../common/js/WdatePicker.js"></script>
    <script type="text/javascript" src="../../js/jquery-3.1.1.js"></script>
    <%--iframe弹出效果--%>
    <script type="text/javascript" src="../../js/popwin.js"></script>
    <script type="text/javascript">
        //单个删除
        function deleteone(a) {
            var id = $(a).prop("name");
            if (confirm("确定要删除该职位吗？"))
            {
                $.post(
                        '${pageContext.request.contextPath}/dept/deljob',
                        {
                            id:id
                        },
                        function (text) {
                            if (text==1)
                            {
                                alert("删除成功");
                                //刷新页面
                                window.location.reload();
                            }
                            if (text==0)
                            {
                                alert("删除失败");
                            }
                        }
                )
            }
        }
        function manage(a) {
            var jobID = $(a).prop("name");
            var deptID = ${deptList.get(0).deptID}
            window.location.href="${pageContext.request.contextPath}/dept/managejob?deptID="+deptID+",jobID="+jobID;
        }
    </script>
    <title>常旅客管理</title>
</head>

<body>
<div id="saper-container">
    <div id="saper-hd"></div>
    <div id="saper-bd">
        <div class="subfiled clearfix">
            <h2>职位管理</h2>
        </div>
        <%--查询操作--%>
        <div class="subfiled-content">


            <!--表格开始-->
            <div class="table">
                <!--表格操作-->
                <div class="table-operate ue-clear">
                    <a href="javascript:;" class="add" onclick="adduser()">添加</a>
                </div>
                <!--表格具体内容-->
                <div class="table-box">
                    <table id="table2">
                        <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>部门名称</th>
                            <th>职位ID</th>
                            <th>职位</th>
                            <th>职位介绍</th>
                            <th>编辑职位</th>
                            <th>管理员工</th>
                            <th>删除</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr style="background-color: tomato;display: none">
                            <td><input type="checkbox"></td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                        </tr>
                        <c:forEach var="dep" items="${deptList}">
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>${dep.deptName}</td>
                                <td>${dep.job.jobID}</td
                                <td></td>
                                <td>${dep.job.jobName}</td>
                                <td>${dep.job.jobText}</td>
                                <td><input type="button" value="编辑职位" style="border: none;width: 70%;margin: 5% auto" onclick="modifyinfo(this)" name="${dep.job.jobID}">
                                </td>
                                <td><input type="button" value="管理员工" style="border: none;width: 70%;margin: 5% auto" onclick="manage(this)" name="${dep.job.jobID}">
                                <td><input type="button" value="删除" style="border: none" onclick="deleteone(this)" name="${dep.job.jobID}"></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div><!--表格结束-->
        </div>
    </div>
    <div id="saper-ft"></div>
</div>

</body>

<script type="text/javascript">
    $('select').iSelect();
    function modifyinfo(a) {
        var id = $(a).prop("name");
        popWin.showWin("500","300","编辑职位信息","${pageContext.request.contextPath}/dept/getjob?jobID="+id);
    }
    function adduser()
    {
        popWin.showWin("500","300","添加职位信息","${pageContext.request.contextPath}/dept/readyaddjob?deptID="+${deptList.get(0).deptID});
    }
</script>
</html>
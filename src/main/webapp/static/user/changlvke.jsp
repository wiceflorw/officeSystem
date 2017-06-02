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
        //查询
        function querry() {
            var level = $("#slct").val();
            var name = $("#name1").val();
            //判断之前是否有过查询，如果有则清除
            if ($("#tr1").length > 0) {
                $("#tr1").remove();
            }
            $.post(
                    '${pageContext.request.contextPath}/user/queryuser',
                    {
                        level: level,
                        name: name,
                    },
                    //接收返回来json数据动态打印一行tr  设置背景颜色
                    //json中有默认的NO
                    function (text, status) {
                        $("#table2 tbody").prepend('<tr style="background-color: tan"><td><input type="checkbox"></td><td>' + text.employeeID + '</td><td>' + text.employeeName + '</td><td>' + text.sex +
                                '</td><td>' + text.learn +
                                '</td><td>' + text.code +
                                '</td><td>' + text.mobile +
                                '</td><td>' + text.address +
                                '</td><td>' + text.birthday +
                                '</td><td>' + text.email +
                                '</td><td>' + text.jobID +
                                '</td><td>' + text.deptID +
                                '</td><td>' + text.workState +
                                '</td><td>' + text.pwd +
                                '</td><td>' + text.userLevel +
                                '</td><td>' + text.onLine +
                                '</td></tr>');
                    }
            )
        }
        //单个删除
        function deleteone(a) {
            var id = $(a).prop("name");
            if (confirm("确定要删除该员工吗？"))
            {
                $.post(
                        '${pageContext.request.contextPath}/user/delectuser',
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
    </script>
    <title>常旅客管理</title>
</head>

<body>
<div id="saper-container">
    <div id="saper-hd"></div>
    <div id="saper-bd">
        <div class="subfiled clearfix">
            <h2>常旅客管理</h2>
        </div>
        <%--查询操作--%>
        <div class="subfiled-content">
            <div class="search-box clearfix">
                <div class="kv-item clearfix">
                    <label>姓名：</label>
                    <div class="kv-item-content">
                        <input type="text" placeholder="姓名" id="name1">
                    </div>
                </div>
                <div class="kv-item clearfix">
                    <label>员工级别：</label>
                    <div class="kv-item-content" >
                        <select id="select">
                            <option value="0">全部</option>
                            <option value="3">高级用户</option>
                            <option value="2">中级用户</option>
                            <option value="1">普通用户</option>
                        </select>
                    </div>
                </div>
                <a onclick="querry()" class="sapar-btn sapar-btn-recom query-btn">查询</a>
            </div>


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
                            <th>员工ID</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>学历</th>
                            <th>身份证</th>
                            <th>手机</th>
                            <th>地址</th>
                            <th>生日</th>
                            <th>邮箱</th>
                            <th>职位</th>
                            <th>部门</th>
                            <th>状态</th>
                            <th>密码</th>
                            <th>用户级别</th>
                            <th>在线状态</th>
                            <th>详细信息</th>
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
                        </tr>
                        <c:forEach var="emp" items="${list}">
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>${emp.employeeID}</td>
                                <td>${emp.employeeName}</td>
                                <td>${emp.sex}</td>
                                <td>${emp.learn}</td>
                                <td>${emp.code}</td>
                                <td>${emp.mobile}</td>
                                <td>${emp.address}</td>
                                <td>
                                        ${emp.birthday}
                                        <%--<fmt:formatDate value="${emp.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/>--%>
                                </td>
                                <td>${emp.email}</td>
                                <td>${emp.jobID}</td>
                                <td>${emp.deptID}</td>
                                <td>${emp.workState}</td>
                                <td>${emp.pwd}</td>
                                <td>${emp.userLevel}</td>
                                <td>${emp.onLine}</td>
                                <td><input type="button" value="编辑员工" style="border: none;width: 70%;margin: 5% auto" onclick="modifyinfo(this)" name="${emp.employeeID}">
                                </td>
                                <td><input type="button" value="删除" style="border: none" onclick="deleteone(this)" name="${emp.employeeID}"></td>
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
        popWin.showWin("550","620","编辑用户信息","${pageContext.request.contextPath}/user/modifyempshow?empID="+id);
    }
    function adduser() {
        popWin.showWin("550","620","添加用户信息","${pageContext.request.contextPath}/static/user/newuser.jsp");
    }
</script>
</html>
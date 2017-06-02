<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.entity.Employees" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Employees employees = (Employees) session.getAttribute("em");
%>
<%--
    /**
     * 任务信息总览
     */
--%>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <link rel="stylesheet" type="text/css" href="../../common/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/system/css/system_index.css"/>
    <script type="text/javascript" src="../../common/js/jquery.js"></script>
    <title>系统首页</title>
    <script type="text/javascript">
         $(document).ready(function () {
            $("#taskID").change(function () {
                var taskID2 = $('#taskID').val();
                $.post(
                        '${pageContext.request.contextPath}/system/queryrepeat',
                        {
                            taskID:taskID2
                        },
                        function (text) {
                            if (text!=1)
                            {
                                $('#lb1').html("任务编号已存在!");
                            }
                            else
                            {
                                $('#lb1').html("");
                            }
                        }
                )
            })
         })
    </script>
</head>

<body>
<div>
    <div class="subfiled clearfix">
        <h2>我的任务</h2>
    </div>
    <div class="subfiled-content">
        <div class="tab-container" data-trigger="hover">
            <div class="tab">
                <%--a标签加上href="javascript:;"表示不执行--%>
                <a href="javascript:;" class="current">全部任务信息</a>
                <a href="javascript:;">我发布的任务</a>
                <a href="javascript:;">指向我的任务</a>
                <a href="javascript:;">添加新的任务</a>
            </div>
            <div class="tab-content">
                <div class="tab-content-item" style="">
                    <div class="row clearfix last-row">
                        <div class="sider-wrap" style="float: left;">
                            <div class="subfiled clearfix">
                                <h2>所有任务</h2>
                                <a href="javascript:;" class="more"></a>
                            </div>
                            <%--通过列表打印出所用任务信息--%>
                            <div class="subfiled-content">
                                <ul class="welcome_list">
                                    <c:forEach var="task2" items="${taskList}">
                                        <li class="notice">
                                                <%--点击后会显示具体任务信息的内容--%>
                                            <a href="javascript:;" title="点击查看详细信息"
                                               onclick="iframego1('${task2.taskID}')">${task2.taskName}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div style="margin-left: 270px;">
                            <iframe src="" style="width: 100%;height: 87%" id="iframe">

                            </iframe>
                        </div>
                    </div>
                    <div id="saper-ft"></div>
                </div>
                <div class="tab-content-item" style="">
                    <div class="row clearfix last-row">
                        <div class="sider-wrap" style="float: left;">
                            <div class="subfiled clearfix">
                                <h2>我发布的任务</h2>
                                <a href="javascript:;" class="more"></a>
                            </div>
                            <%--通过列表打印出所用任务信息--%>
                            <div class="subfiled-content">
                                <ul class="welcome_list">
                                    <c:forEach var="task2" items="${taskList}">
                                        <c:if test="${task2.employeeID==sessionScope.em.employeeID}">
                                            <li class="notice">
                                                    <%--点击后会显示具体任务信息的内容--%>
                                                <a href="javascript:;" title="点击查看详细信息"
                                                   onclick="iframego2('${task2.taskID}')">${task2.taskName}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div style="margin-left: 270px;">
                            <iframe src="" style="width: 100%;height: 87%" id="iframe2">

                            </iframe>
                        </div>
                    </div>
                    <div id="saper-ft2"></div>
                </div>
                <div class="tab-content-item" style="">
                    <div class="row clearfix last-row">
                        <div class="sider-wrap" style="float: left;">
                            <div class="subfiled clearfix">
                                <h2>指向我的任务</h2>
                                <a href="javascript:;" class="more"></a>
                            </div>
                            <%--通过列表打印出所用任务信息--%>
                            <div class="subfiled-content">
                                <ul class="welcome_list">
                                    <c:forEach var="task2" items="${taskList}">
                                        <c:if test="${task2.doID==sessionScope.em.employeeID}">
                                            <li class="notice">
                                                    <%--点击后会显示具体任务信息的内容--%>
                                                <a href="javascript:;" title="点击查看详细信息"
                                                   onclick="iframego3('${task2.taskID}')">${task2.taskName}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div style="margin-left: 270px;">
                            <iframe src="" style="width: 100%;height: 87%" id="iframe3">

                            </iframe>
                        </div>
                    </div>
                    <div id="saper-ft3"></div>
                </div>
                <div class="tab-content-item" style="">
                    <div class="row clearfix last-row" style="margin-left: 5%">
                        <div class="kv-item clearfix">
                            <label>任务编号：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                <input type="text" value="" id="taskID">
                            </div>
                            <div class="kv-item-tip"><label id="lb1" style="width: 8em"></label></div>
                        </div>

                        <div class="kv-item clearfix">
                            <label>任务名称：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                <input type="text" placeholder="" id="taskName">
                            </div>
                        </div>

                        <div class="kv-item clearfix">
                            <label>任务介绍：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                <input type="text" placeholder="" id="taskInfo">
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
                                <input type="text" placeholder="" id="taskState">
                            </div>
                        </div>

                        <div class="kv-item clearfix">
                            <label>任务添加人：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                <input type="text" value="<%=employees.getEmployeeID()%>" id="employeeID">
                            </div>
                        </div>

                        <div class="kv-item clearfix">
                            <label>任务执行者：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                <input type="text" placeholder="" id="doID">
                            </div>
                        </div>
                        <button class="sapar-btn sapar-btn-recom" value="" style="margin-left: 6%"
                                onclick="modifyinfo()">确认添加
                        </button>
                    </div>
                </div>
                <div id="saper-ft4"></div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
<script type="text/javascript" src="../../common/js/sapar.js"></script>
<script type="text/javascript" src="../../common/js/WdatePicker.js"></script>
<script type="text/javascript">
    $('select').iSelect();
    function iframego1(task) {
        $('#iframe').attr('src', '${pageContext.request.contextPath}/system/taskone?taskID=' + task);
    }
    function iframego3(task) {
        $('#iframe3').attr('src', '${pageContext.request.contextPath}/system/taskone?taskID=' + task);
    }
    function iframego2(task) {
        $('#iframe2').attr('src', '${pageContext.request.contextPath}/system/modifytaskshow?taskID=' + task);
    }
    function modifyinfo() {
        var taskID = $('#taskID').val();
        var taskName = $('#taskName').val();
        var taskInfo = $('#taskInfo').val();
        var nowTime = $('#nowTime').val();
        var taskState = $('#taskState').val();
        var employeeID = $('#employeeID').val();
        var doID = $('#doID').val();
        $.post(
                '${pageContext.request.contextPath}/system/addtask',
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
                        alert("添加成功");
                    }
                    else {
                        alert("添加失败");
                    }

                }
        )
    }
</script>
</html>

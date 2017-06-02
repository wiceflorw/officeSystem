<%@ page import="com.entity.Employees" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Employees employees = (Employees) session.getAttribute("em");
%>
<html>
<head>
    <link rel="stylesheet" href="common/css/sapar.css"/>
    <link rel="stylesheet" href="static/css/index.css"/>
    <script type="text/javascript" src="common/js/jquery.js"></script>
    <title>网络办公自动化系统</title>
    <script type="text/javascript">
        $(document).ready(function () {
            var s = <%=employees.getUserLevel()%>;
            if(s==1)
            {
                $('#aaa').hide();
                $('#bbb').hide();
            }
        })
    </script>
</head>

<body>
<div id="container">
    <div id="hd">
        <div class="hd-wrap clearfix">
            <div class="top-light"></div>
            <h1 class="logo"></h1>
            <ul class="main-nav clearfix">
                <li class="current" data-src="static/system/index.jsp"><a href="javascript:;">个人</a></li>
                <li data-src="static/notice/index.jsp"><a href="javascript:;">公告</a></li>
                <li data-src="static/user/index.jsp"><a href="javascript:;" id="aaa">员工</a></li>
                <li data-src="${pageContext.request.contextPath}/dept/info"><a href="javascript:;" id="bbb">部门</a></li>

            </ul>
            <div class="notice clearfix">
                <%--导航栏隔壁--%>
            </div>
            <div class="toolbar">
                <div class="login-info clearfix">
                    <div class="welcome clearfix"><span>欢迎您,</span><%=employees.getEmployeeName()%>
                    </div>
                    <div class="login-msg clearfix">

                    </div>
                </div>
                <div class="tool clearfix" style="float: right">
                    <a class="tips" href="javascript:;">合作须知</a>
                    <a href="javascript:;" class="quit-btn exit">退出</a>
                </div>
            </div>
        </div>
    </div>
    <div id="bd">
        <div class="wrap clearfix">
            <iframe src="static/system/index.jsp" id="iframe" width="100%" height="100%" frameborder="0"></iframe>
        </div>
    </div>
    <div id="ft" class="clearfix">
        <div class="ft-left">
            <span>Network office automation system</span>
            <em>Ten&nbsp;Group</em>
        </div>
        <div class="ft-right">
            <span>Automation</span>
            <em>V1.0&nbsp;2017</em>
        </div>
    </div>
</div>
<%--退出提醒--%>
<div class="exitDialog">
    <div class="dialog-content">
        <div class="ui-dialog-icon"></div>
        <div class="ui-dialog-text">
            <p class="dialog-content">你确定要退出系统？</p>
            <p class="tips">如果是请点击“确定”，否则点“取消”</p>

            <div class="buttons">
                <%--在这里跳到后台将session设置为空--%>
                <input type="button" class="button long2 ok" value="确定"/>
                <input type="button" class="button long2 normal" value="取消"/>
            </div>
        </div>
    </div>
</div>
</body>
<%--js放在底部可以减少加载时间--%>
<script type="text/javascript" src="common/js/sapar.js"></script>
<script type="text/javascript" src="static/js/index.js"></script>
</html>

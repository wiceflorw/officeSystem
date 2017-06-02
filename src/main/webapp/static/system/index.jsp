<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <link rel="stylesheet" href="../css/index_inner.css"/>
    <title>系统</title>
</head>

<body>
<div id="container">
    <div id="bd">
        <div class="wrap clearfix">
            <div class="sidebar">
                <h2 class="sidebar-header"><p>功能导航</p></h2>
                <ul class="nav">
                    <li class="gongwen">
                        <div class="nav-header"><a href="javascript:;" data-src="/system/info" class="clearfix"><span>我的资料</span><i
                                class="icon"></i></a></div>
                    </li>
                    <li class="gongwen">
                        <div class="nav-header"><a href="javascript:;" data-src="/system/taskinfo"
                                                   class="clearfix"><span>任务信息</span><i class="icon"></i></a></div>
                    </li>
                    <li class="email">
                        <div class="nav-header">
                            <a href="javascript:;"class="clearfix">
                                <span>我的邮件</span>
                                <i class="icon"></i>
                            </a>
                        </div>
                        <ul class="subnav">
                            <li><a href="javascript:;" data-src="email/email.jsp">发送邮件</a></li>
                            <li><a href="javascript:;" data-src="/email/querryall">接收的邮件</a></li>
                        </ul>
                    </li>
                    <li class="system">
                        <div class="nav-header"><a href="javascript:;" data-src="pwd_modify.jsp"
                                                   class="clearfix"><span>密码修改</span><i class="icon"></i></a></div>
                    </li>

                </ul>
            </div>
            <div class="content">
                <div class="topbar clearfix">
                    <ul class="user-msg clearfix">
                        <li><img src="../images/15435.png" alt=""><a href="http://www.baidu.com">天气预报</a></li>
                        <li><img src="../images/514958.png" alt="">[<a href="javascript:;">联系开发人员</a>]</li>
                    </ul>
                    <div class="contact clearfix">

                    </div>
                </div>
                <iframe src="/system/info" id="iframe" width="100%" height="100%" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../../common/js/jquery.js"></script>
<script type="text/javascript" src="../../common/js/sapar.js"></script>
<script type="text/javascript" src="../js/index_inner.js"></script>

</html>

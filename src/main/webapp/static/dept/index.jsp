<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <link rel="stylesheet" href="../css/index_inner.css"/>
    <title>用户</title>
</head>

<body>
<div id="container">
    <div id="bd">
        <div class="wrap clearfix">
            <div class="sidebar">
                <h2 class="sidebar-header"><p>功能导航</p></h2>
                <ul class="nav">
                    <li class="office current">
                        <div class="nav-header"><a href="javascript:;" data-src="/user/alluser" class="clearfix"><span>部门管理</span><i
                                class="icon"></i></a></div>
                    </li>
                    <li class="gongwen">
                        <div class="nav-header"><a href="javascript:;" data-src="/test/aa" class="clearfix"><span>常旅客管理</span><i
                                class="icon"></i></a></div>
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
                <iframe src="/user/alluser" id="iframe" width="100%" height="100%" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../../common/js/jquery.js"></script>
<script type="text/javascript" src="../../common/js/sapar.js"></script>
<script type="text/javascript" src="../js/index_inner.js"></script>

</html>

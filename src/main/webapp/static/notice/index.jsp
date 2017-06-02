<%@ page import="com.entity.Employees" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Employees employees = (Employees) session.getAttribute("em");
%>
<html>
<head>
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <script type="text/javascript" src="../../common/js/jquery.js"></script>
    <link rel="stylesheet" href="../css/index_inner.css"/>
    <title>短信</title>
    <script type="text/javascript">
        $(document).ready(function () {
            var s = <%=employees.getUserLevel()%>;
            if(s==1)
            {
                $('#aaa').hide();
            }
        })
    </script>
</head>

<body>
<div id="container">
    <div id="bd">
        <div class="wrap clearfix">
            <div class="sidebar">
                <h2 class="sidebar-header"><p>功能导航</p></h2>
                <ul class="nav">
                    <li class="office current">
                        <div class="nav-header"><a href="javascript:;" data-src="/notice/allrunnotice"
                                                   class="clearfix"><span>公告信息</span><i class="icon"></i></a></div>
                    </li>
                    <li class="gongwen">
                        <div class="nav-header"><a href="javascript:;" data-src="newnotice.jsp" class="clearfix"><span>新增公告</span><i
                                class="icon"></i></a></div>
                    </li>
                    <li class="gongwen" id="aaa">
                        <div class="nav-header"><a href="javascript:;" data-src="/notice/allhisnote"
                                                   class="clearfix"><span>审核公告</span><i class="icon"></i></a></div>
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
                <iframe src="/notice/allrunnotice" id="iframe" width="100%" height="100%" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../../common/js/sapar.js"></script>
<script type="text/javascript" src="../js/index_inner.js"></script>
</html>

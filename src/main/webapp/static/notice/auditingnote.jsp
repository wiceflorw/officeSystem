<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <link rel="stylesheet" type="text/css" href="../../common/css/common.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/system/css/system_index.css"/>
    <script type="text/javascript" src="../../common/js/jquery.js"></script>
    <script type="text/javascript" src="../../common/js/sapar.js"></script>
    <script type="text/javascript" src="../../common/js/WdatePicker.js"></script>
    <title>公告</title>
</head>

<body>
<div id="saper-container">
    <div id="saper-hd"></div>
    <div id="saper-bd">
        <div class="subfiled clearfix">
            <h2>公告信息查看</h2>
        </div>
        <div class="subfiled-content">
            <div class="tab-container" data-trigger="hover">
                <div class="tab">
                    <%--a标签加上href="javascript:;"表示不执行--%>
                    <a href="javascript:;" class="current">待审核公告</a>
                    <a href="javascript:;">审核通过公告</a>
                    <a href="javascript:;">已失效公告</a>
                </div>
                <div class="tab-content">
                    <div class="tab-content-item" style="">
                        <div class="row clearfix last-row">
                            <div class="sider-wrap" style="float: left;">
                                <div class="subfiled clearfix" style="width: 217px;">
                                    <h2 style="margin-left: 7px;">公告信息</h2>
                                    <a href="javascript:;" class="more"></a>
                                </div>
                                <%--通过列表打印出所用任务信息--%>
                                <div class="subfiled-content">
                                    <ul class="welcome_list">
                                        <c:forEach var="task2" items="${list}">
                                            <c:if test="${task2.status==0}">
                                                <li class="notice">
                                                        <%--点击后会显示具体任务信息的内容--%>
                                                    <a href="javascript:;" title="点击查看详细信息"
                                                       onclick="iframego1('${task2.noteID}')">${task2.noteName}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <div style="margin-left: 270px;">
                                <iframe src="" style="width: 100%;height: 87%" id="iframe1">

                                </iframe>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content-item" style="">
                        <div class="row clearfix last-row">
                            <div class="sider-wrap" style="float: left;">
                                <div class="subfiled clearfix" style="width: 217px;">
                                    <h2 style="margin-left: 7px;">公告信息</h2>
                                    <a href="javascript:;" class="more"></a>
                                </div>
                                <%--通过列表打印出所用任务信息--%>
                                <div class="subfiled-content">
                                    <ul class="welcome_list">
                                        <c:forEach var="task2" items="${list}">
                                            <c:if test="${task2.status==1}">
                                                <li class="notice">
                                                        <%--点击后会显示具体任务信息的内容--%>
                                                    <a href="javascript:;" title="点击查看详细信息"
                                                       onclick="iframego2('${task2.noteID}')">${task2.noteName}</a>
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
                    </div>
                    <div class="tab-content-item" style="">
                        <div class="row clearfix last-row">
                            <div class="sider-wrap" style="float: left;">
                                <div class="subfiled clearfix" style="width: 217px;">
                                    <h2 style="margin-left: 7px;">公告信息</h2>
                                    <a href="javascript:;" class="more"></a>
                                </div>
                                <%--通过列表打印出所用任务信息--%>
                                <div class="subfiled-content">
                                    <ul class="welcome_list">
                                        <c:forEach var="task2" items="${list}">
                                            <c:if test="${task2.status==3}">
                                                <li class="notice">
                                                        <%--点击后会显示具体任务信息的内容--%>
                                                    <a href="javascript:;" title="点击查看详细信息"
                                                       onclick="iframego3('${task2.noteID}')">${task2.noteName}</a>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    function iframego1(noticeID) {
        $('#iframe1').attr('src', '${pageContext.request.contextPath}/notice/throughnote?noticeID=' + noticeID);
    }
    function iframego2(noticeID) {
        $('#iframe2').attr('src', '${pageContext.request.contextPath}/notice/completenote?noticeID=' + noticeID);
    }
    function iframego3(noticeID) {
        $('#iframe3').attr('src', '${pageContext.request.contextPath}/notice/timeout?noticeID=' + noticeID);
    }
</script>
</html>
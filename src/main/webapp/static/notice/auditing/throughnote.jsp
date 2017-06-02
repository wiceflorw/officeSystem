<%--
  Created by IntelliJ IDEA.
  User: BF
  Date: 2017/5/19
  Time: 11:08
  To change this template use File | Settings | File Templates.
  审核未通过通过信息页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>公告信息</title>
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <link rel="stylesheet" type="text/css" href="../../common/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/my_info.css"/>
</head>
<body>
<div>
    <div class="kv-item clearfix">
        <label>活动编号：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <%--<c:out value="${employees.employeeName}"/>--%>
            ${notice.noteID}
        </div>
    </div>

    <div class="kv-item clearfix">
        <label>活动名称：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <%--<c:out value="${employees.employeeName}"/>--%>
            ${notice.noteName}
        </div>
    </div>

    <div class="kv-item clearfix">
        <label>活动添加人：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <%--<c:out value="${employees.employeeName}"/>--%>
            ${notice.employees.employeeName}
        </div>
    </div>

    <div class="kv-item clearfix">
        <label>添加任务时间：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <%--将从数据库中读取的日期由String格式转成date格式--%>
            <fmt:parseDate value="${notice.noteTime}" var="date1"/>
            <%--格式转换完成后用fromatDate输出--%>
            <fmt:formatDate value="${date1}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </div>
    </div>

    <div class="kv-item clearfix">
        <label>活动内容：</label>
        <div class="kv-item-content" style="line-height:30px;">
            ${notice.noteInfo}
        </div>
    </div>

    <div class="kv-item clearfix">
        <label>是否全局：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <c:if test="${notice.whetherGlobal==1}">
                是全局
            </c:if>
            <c:if test="${notice.whetherGlobal!=1}">
                不是全局
            </c:if>
        </div>
    </div>
    <div class="kv-item clearfix">
        <input type="button" class="sapar-btn sapar-btn-recom" onclick="nothrough('${notice.noteID}')"
               value="设置为审核通过"/>
        <input type="button" class="sapar-btn sapar-btn-recom" onclick="obsolete('${notice.noteID}')" value="设置为过时公告"
               style="margin-left: 1%"/>
    </div>
</div>
</body>
<script type="text/javascript" src="/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
    function nothrough(a) {
        $.post(
                '${pageContext.request.contextPath}/notice/through',
                {
                    noteID:a
                },
                function (text, status) {
                    if(text==1)
                    {
                        alert("该公告已设置为审核未通过");
                        parent.location.reload();
                    }
                    else {
                        alert("设置失败");
                    }
                }
        )
    }
    function obsolete(b) {
        $.post(
                '${pageContext.request.contextPath}/notice/timeout',
                {
                    noteID:b
                },
                function (text, status) {
                    if(text==1)
                    {
                        alert("该公告已设置为过时状态");
                        parent.location.reload();
                    }
                    else {
                        alert("设置失败");
                    }
                }
        )
    }
</script>
</html>

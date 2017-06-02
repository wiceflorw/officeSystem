<%--
  Created by IntelliJ IDEA.
  User: BF
  Date: 2017/5/26
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>收件箱</title>
    <link rel="stylesheet" href="/common/css/sapar.css"/>
    <script type="text/javascript" src="../../js/jquery-3.1.1.js"></script>
</head>
<body>
<div style="margin: 3% 2%">
    <div>
        <%--发件人--%>
        <div class="kv-item clearfix kv-item-content">
            <label>发件人：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${email.sender}" name="sender" id="sender" disabled>
            </div>
        </div>
        <%--发件人邮箱--%>
        <div class="kv-item clearfix">
            <label>发件人邮箱：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${email.senderemail}" name="sendermail" disabled id="senderemail">
            </div>
        </div>
    </div>
    <div>
        <%--收件人邮箱--%>
        <div class="kv-item clearfix kv-item-content">
            <label>收件人邮箱：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="${email.addressee}" name="comeemail" id="comeemail">
            </div>
        </div>
        <%--附件--%>
        <div class="kv-item clearfix">
            <label>附件：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <c:if test="${email.fileroad!=null}">
                    <a href="/email/download?file=${email.fileroad}">点击下载附件</a>
                </c:if>
                <c:if test="${email.fileroad==null}">
                    该邮件没有附件
                </c:if>
            </div>
        </div>
    </div>
    <%--标题--%>
    <div class="kv-item clearfix">
        <label>主题：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <input type="text" placeholder="${email.title}" name="theme" style="width: 591px" id="thema">
        </div>
    </div>
    <%--内容--%>
    <div class="kv-item clearfix">
        <div class="kv-item-content" style="line-height:30px;margin-left: 2.7%;">
            <textarea placeholder="${email.test}" id="text" style="width: 662px;height: 200px"></textarea>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
</script>
</html>

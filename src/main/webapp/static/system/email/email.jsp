<%@ page import="com.entity.Employees" %><%--
  Created by IntelliJ IDEA.
  User: BF
  Date: 2017/5/22
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Employees employees = (Employees) session.getAttribute("em");
%>
<html>
<head>
    <title>邮件收发</title>
    <link rel="stylesheet" href="/common/css/sapar.css"/>
    <script type="text/javascript" src="../../../js/jquery-3.1.1.js"></script>
</head>
<body>
<div style="margin: 3% 24%">
    <div>
        <%--发件人--%>
        <div class="kv-item clearfix kv-item-content">
            <label>发件人：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" value="<%=employees.getEmployeeName()%>" name="sender" id="sender" disabled>
            </div>
        </div>
        <%--发件人邮箱--%>
        <div class="kv-item clearfix">
            <label>发件人邮箱：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" value="<%=employees.getEmail()%>" name="sendermail" disabled id="senderemail">
            </div>
        </div>
    </div>
    <div>
        <%--收件人邮箱--%>
        <div class="kv-item clearfix kv-item-content">
            <label>收件人邮箱：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="text" placeholder="收件人的email地址" name="comeemail" id="comeemail">
            </div>
        </div>
        <%--附件--%>
        <div class="kv-item clearfix">
            <label>附件：</label>
            <div class="kv-item-content" style="line-height:30px;">
                <input type="file" name="file" style="border: 0" id="file">
            </div>
        </div>
    </div>
    <%--标题--%>
    <div class="kv-item clearfix">
        <label>主题：</label>
        <div class="kv-item-content" style="line-height:30px;">
            <input type="text" placeholder="邮件主题" name="theme" style="width: 591px" id="thema">
        </div>
    </div>
    <%--内容--%>
    <div class="kv-item clearfix">
        <div class="kv-item-content" style="line-height:30px;margin-left: 2.7%;">
            <textarea placeholder="邮件主体" id="text" style="width: 662px;height: 200px"></textarea>
        </div>
    </div>
    <button class="sapar-btn sapar-btn-recom" style="margin-left: 13%;width: 59%" onclick="sender()">发送</button>
</div>
</body>
<script type="text/javascript">
    function sender() {
        var sender = $('#sender').val();
        var senderemail = $('#senderemail').val();
        var comeemail = $('#comeemail').val();
        var title = $('#thema').val();
        var info = $('#text ').val();
        var formData = new FormData();
        formData.append("myfile", document.getElementById("file").files[0]);
        formData.append("sender", sender);
        formData.append("senderemail", senderemail);
        formData.append("comeemail", comeemail);
        formData.append("title", title);
        formData.append("info", info);
        $.ajax({
            url: '${pageContext.request.contextPath}/email/save',
            type: "POST",
            data: formData,
            /**
             *必须false才会自动加上正确的Content-Type
             */
            contentType: false,
            /**
             * 必须false才会避开jQuery对 formdata 的默认处理
             * XMLHttpRequest会对 formdata 进行正确的处理
             */
            processData: false,
            success: function (data) {
                if (data==1) {
                    alert("上传成功！");
                }
                if (data==2) {
                    alert("上传文件时候失败");
                }
            },
            error: function () {
                alert("发送邮件失败");
            }
        })
    }
</script>
</html>

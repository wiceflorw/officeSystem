<%@ page import="com.entity.Employees" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Employees employees = (Employees) session.getAttribute("em");
%>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <link rel="stylesheet" type="text/css" href="../../common/css/common.css"/>

    <script type="text/javascript" src="../../common/js/jquery.js"></script>
    <script type="text/javascript" src="../../common/js/sapar.js"></script>
    <script type="text/javascript" src="../../common/js/WdatePicker.js"></script>
    <script type="text/javascript" src="../../js/jquery-3.1.1.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            /**
             * 判断新密码是否合法
             **/
            $("#newpsw1").change(function () {
                var oldpsw22 = $('#oldpsw').val();
                var newpsw1 = $('#newpsw1').val();
                if (oldpsw22 == newpsw1) {
                    $("#sp1").html("您输入的新密码与旧密码相同，请重新输入");
                }
                else {
                    $("#sp1").html("");
                }
            })
            $("#newpsw2").change(function () {
                var newpsw1 = $('#newpsw1').val();
                var newpsw2 = $('#newpsw2').val();
                if (newpsw1 != newpsw2) {
                    $("#sp2").html("您两次输入的新密码不一致，请重新输入");
                }
                else {
                    $("#sp2").html("");
                }
            })
        })
        /**
         * 点击修改密码事件
         */
        function chang() {
            var oldpsw22 = $('#oldpsw').val();
            var newpsw = $('#newpsw1').val();
            var count = $('#count').val();
            $.ajax({
                url: '${pageContext.request.contextPath}/system/changepsw',
                type: "POST",
                dataType: "json",
                data: {
                    id: count,
                    oldpsw: oldpsw22,
                    newpsw: newpsw
                },
                success: function (data) {
                    if (data == 1) {
                        alert("修改密码成功");
                    }
                    else {
                        alert(data);
                        alert("旧密码与登录密码不匹配，修改密码失败!");
                    }
                },
                error: function (data) {
                    alert(data.status);
                }
            });
        }
        function test(data) {
            alert(data);
        }
    </script>
    <title>系统首页</title>
</head>
<body>
<div id="saper-container">
    <div id="saper-hd"></div>
    <div id="saper-bd">
        <div class="subfiled clearfix">
            <h2>修改密码</h2>
        </div>
        <div class="subfiled-content">
            <div class="saper-form">
                <div class="kv-item clearfix">
                    <label>用户账号：</label>
                    <div class="kv-item-content">
                        <div class="kv-item-content">
                            <input type="text" value="<%=employees.getEmployeeID()%>" disabled id="count">
                        </div>
                    </div>
                </div>
                <div class="kv-item clearfix">
                    <label><span class="impInfo">*</span>原密码：</label>
                    <div class="kv-item-content">
                        <input type="text" placeholder="原密码" id="oldpsw">
                    </div>
                </div>
                <div class="kv-item clearfix">
                    <label><span class="impInfo">*</span>新密码：</label>
                    <div class="kv-item-content">
                        <input type="text" placeholder="新密码" id="newpsw1">
                    </div>
                    <label style="width: 300px"><span class="impInfo" id="sp1"></span></label>
                </div>
                <div class="kv-item clearfix">
                    <label><span class="impInfo">*</span>确认密码：</label>
                    <div class="kv-item-content">
                        <input type="text" placeholder="确认密码" id="newpsw2">
                    </div>
                    <label style="width: 300px"><span class="impInfo" id="sp2"></span></label>
                </div>
                <div class="buttons">

                    <%--这里不可以使用a标签，否则它在进行ajax请求的时候会执行一遍href方法，即使href方法中没有值，它也会刷新页面--%>

                    <input type="button" class="sapar-btn sapar-btn-recom" onclick="chang()" value="确定"/>
                </div>
            </div>
        </div>
    </div>
    <div id="saper-ft"></div>
</div>

</body>

<script type="text/javascript"></script>
</html>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: BF
  Date: 2017/5/20
  Time: 16:28
  To change this template use File | Settings | File Templates.
  新增公告信息
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <link rel="stylesheet" type="text/css" href="../../common/css/common.css"/>
    <script type="text/javascript" src="../../common/js/jquery.js"></script>
    <script type="text/javascript" src="../../common/js/sapar.js"></script>
    <script type="text/javascript" src="../../common/js/WdatePicker.js"></script>
    <title>新增公告信息</title>
</head>
<body>
<div id="saper-container">
    <div id="saper-hd"></div>
    <div id="saper-bd">
        <div class="subfiled clearfix">
            <h2>添加新的公告信息</h2>
        </div>
        <div class="subfiled-content">
            <div class="saper-form">
                <div class="kv-item clearfix">
                    <label><span class="impInfo">*</span>公告编号：</label>
                    <div class="kv-item-content">
                        <input type="text" placeholder="公告编号" id="noteID">
                    </div>
                </div>
                <div class="kv-item clearfix">
                    <label><span class="impInfo">*</span>公告名称：</label>
                    <div class="kv-item-content">
                        <input type="text" placeholder="公告名称" id="notename">
                    </div>
                </div>
                <div class="kv-item clearfix">
                    <label><span class="impInfo">*</span>添加时间：</label>
                    <div class="kv-item-content">
                        <%
                            Date dt = new Date();//如果不需要格式,可直接用dt,dt就是当前系统时间
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置显示格式
                            String nowTime = "";
                            nowTime = df.format(dt);//用DateFormat的format()方法在dt中获取并以yyyy/MM/dd HH:mm:ss格式显示
                            System.out.println(nowTime);
                        %>
                        <input type="text" value="<%=nowTime%>" id="notetime" disabled>
                    </div>
                    <div class="kv-item-tip">任务时间由系统生成</div>

                </div>
                <div class="kv-item clearfix">
                    <label><span class="impInfo">*</span>公告添加人：</label>
                    <div class="kv-item-content">
                        <input type="text" placeholder="公告添加人" id="empyID">
                    </div>
                </div>
                <div class="kv-item clearfix">
                    <label><span class="impInfo">*</span>是否全局：</label>
                    <div class="kv-item-content">
                        <input type="text" placeholder="是否全局" id="global">
                    </div>
                    <div class="kv-item-tip">1代表全局，0代表非全局</div>
                </div>
                <div class="kv-item clearfix">
                    <label><span class="impInfo">*</span>公告内容：</label>
                    <div class="kv-item-content">
                        <textarea placeholder="公告内容" id="noteinfo"></textarea>
                    </div>
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
<script type="text/javascript">
    function chang() {
        var noteID = $('#noteID').val();
        var noteName = $('#notename').val();
        var notetime = $('#notetime').val();
        var empyID = $('#empyID').val();
        var global = $('#global').val();
        var noteinfo = $('#noteinfo').val();
        $.post(
            '${pageContext.request.contextPath}/notice/addnote',
                {
                    noteID:noteID,
                    noteName:noteName,
                    notetime:notetime,
                    empyID:empyID,
                    global:global,
                    noteinfo:noteinfo
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

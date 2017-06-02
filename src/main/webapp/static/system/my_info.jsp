<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../common/css/sapar.css"/>
    <link rel="stylesheet" type="text/css" href="../../common/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/my_info.css"/>
    <script type="text/javascript" src="../../common/js/jquery.js"></script>
    <script type="text/javascript" src="../../common/js/sapar.js"></script>
    <script type="text/javascript" src="../../common/js/WdatePicker.js"></script>
    <title>我的资料信息</title>
</head>
<%--通过el表达式直接取出传回来的对象信息 有两种方法--%>
<body>
<div id="saper-container">
    <div id="saper-hd"></div>
    <div id="saper-bd">
        <div class="subfiled clearfix">
            <h2>我的资料</h2>
        </div>
        <div class="subfiled-content">
            <div class="tab-container" data-trigger="hover">
                <div class="tab">
                    <%--a标签加上href="javascript:;"表示不执行--%>
                    <a href="javascript:;" class="current">基本信息</a>
                    <a href="javascript:;">修改信息</a>
                </div>
                <div class="tab-content">
                    <%--基本信息--%>
                    <div class="tab-content-item" style="margin-left: 5%">
                        <div class="kv-item clearfix">
                            <label>ID 编号：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                <%--<c:out value="${employees.employeeName}"/>--%>
                                ${employees.employeeID}
                            </div>
                        </div>
                        <div class="kv-item clearfix">
                            <label>姓 名：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                ${employees.employeeName}
                            </div>
                            <label>性 别：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                ${employees.sex}
                            </div>
                            <label>学 历：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                ${employees.learn}
                            </div>
                        </div>

                        <div class="kv-item clearfix">
                            <label></span>生日日期：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                ${employees.birthday}
                            </div>
                        </div>

                        <div class="kv-item address clearfix">
                            <label>详细地址：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                ${employees.address}
                            </div>
                        </div>
                        <div class="kv-item clearfix">
                            <div>
                                <label>手机号码：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.mobile}
                                </div>
                            </div>
                            <div style="margin-left: 12%">
                                <label>邮箱地址：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.email}
                                </div>
                            </div>
                        </div>
                        <div class="kv-item clearfix">
                            <label>身份证号：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                ${employees.code}
                            </div>
                        </div>

                        <div class="kv-item clearfix">
                            <div>
                                <label>所在部门：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.dept.deptName}
                                </div>
                            </div>
                            <div style="margin-left: 12%">
                                <label>所处职位：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.job.jobName}
                                </div>
                            </div>
                        </div>

                        <div class="kv-item clearfix">
                            <div>
                                <label>您的级别：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.userLevel}
                                </div>
                            </div>
                            <div style="margin-left: 12%">
                                <label>现时密码：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.pwd}
                                </div>
                            </div>
                        </div>
                        <div class="kv-item clearfix">
                            <div>
                                <label>在线状态：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.onLine}
                                </div>
                            </div>
                            <div style="margin-left: 12%">
                                <label>任务状态：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.workState}
                                </div>
                            </div>
                        </div>
                        <div class="kv-item clearfix">
                            <label>就职协议：</label>
                            <div class="kv-item-content" style="line-height:30px;">
                                <label></label>
                            </div>
                        </div>

                    </div>
                    <%--修改信息--%>
                    <%--显示之前的信息--%>
                    <div class="tab-content-item" style="margin-left: 5%">
                        <div style="float: left">
                            <div class="kv-item clearfix">
                                <label>ID 编号：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    <%--<c:out value="${employees.employeeName}"/>--%>
                                    ${employees.employeeID}
                                </div>
                            </div>
                            <div class="kv-item clearfix">
                                <label>姓 名：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.employeeName}
                                </div>
                                <label>性 别：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.sex}
                                </div>
                                <label>学 历：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.learn}
                                </div>
                            </div>

                            <div class="kv-item clearfix">
                                <label></span>生日日期：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.birthday}
                                </div>
                            </div>

                            <div class="kv-item address clearfix">
                                <label>详细地址：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.address}
                                </div>
                            </div>
                            <div class="kv-item clearfix">
                                <div>
                                    <label>手机号码：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        ${employees.mobile}
                                    </div>
                                </div>
                            </div>
                            <div class="kv-item clearfix">
                                <label>邮箱地址：</label>
                                <div class="kv-item-content" style="line-height:30px; ">
                                    ${employees.email}
                                </div>
                            </div>
                            <div class="kv-item clearfix">
                                <label>身份证号：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    ${employees.code}
                                </div>
                            </div>

                            <div class="kv-item clearfix">
                                <div>
                                    <label>所在部门：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        ${employees.dept.deptName}
                                    </div>
                                </div>
                                <div style="margin-left: 52%">
                                    <label>所处职位：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        ${employees.job.jobName}
                                    </div>
                                </div>
                            </div>

                            <div class="kv-item clearfix">
                                <div>
                                    <label>您的级别：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        ${employees.userLevel}
                                    </div>
                                </div>
                                <div style="margin-left: 52%">
                                    <label>现时密码：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        ${employees.pwd}
                                    </div>
                                </div>
                            </div>
                            <div class="kv-item clearfix">
                                <div>
                                    <label>在线状态：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        ${employees.onLine}
                                    </div>
                                </div>
                                <div style="margin-left: 52%">
                                    <label>任务状态：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        ${employees.workState}
                                    </div>
                                </div>
                            </div>
                            <div class="kv-item clearfix">
                                <label>就职协议：</label>
                                <div class="kv-item-content" style="line-height:30px;">
                                    <label></label>
                                </div>
                            </div>
                        </div>
                        <%--修改框--%>
                        <form action="${pageContext.request.contextPath}/system/upade" method="post">
                            <div style="float: left;margin-left: 20%">
                                <div class="kv-item clearfix">
                                    <label>ID 编号：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        <%--<c:out value="${employees.employeeName}"/>--%>
                                        <input type="text" placeholder="ID 编号" name="idnum">
                                    </div>
                                </div>
                                <div class="kv-item clearfix">
                                    <label>姓 名：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        <input type="text" placeholder="姓 名" name="name">
                                    </div>
                                    <label>性 别：</label>
                                    <div class="kv-item-content" style="line-height:30px;width: 60px">
                                        <select id="sle1" style="float: left" name="sle1">
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </div>
                                    <label>学 历：</label>
                                    <div class="kv-item-content" style="line-height:30px;width: 60px">
                                        <select id="sle2" name="sle2">
                                            <option value="大专">大专</option>
                                            <option value="本科">本科</option>
                                            <option value="研究生">研究生</option>
                                            <option value="博士生">博士生</option>
                                        </select>
                                    </div>
                                </div>
                                <%--<div class="kv-item clearfix">--%>
                                <%--<label>学 历：</label>--%>
                                <%--<div class="kv-item-content" style="line-height:30px;">--%>
                                <%--<input type="text" placeholder="学 历" name="learn">--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <div class="kv-item clearfix">
                                    <label></span>生日日期：</label>
                                    <div class="kv-item-content time-select-wrap">
                                        <div class="time-select">
                                            <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
                                                   placeholder="出生日期" name="birthdate">
                                            <i class="date-icon"></i>
                                        </div>
                                    </div>
                                </div>

                                <div class="kv-item address clearfix">
                                    <label>详细地址：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        <input type="text" placeholder="详细地址" name="address">
                                    </div>
                                </div>
                                <div class="kv-item clearfix">
                                    <div>
                                        <label>手机号码：</label>
                                        <div class="kv-item-content" style="line-height:30px;">
                                            <input type="text" placeholder="手机号码" name="phone">
                                        </div>
                                    </div>
                                </div>
                                <div class="kv-item clearfix">
                                    <div>
                                        <label>邮箱地址：</label>
                                        <div class="kv-item-content" style="line-height:30px;">
                                            <input type="text" placeholder="邮箱地址" name="email">
                                        </div>
                                    </div>
                                </div>
                                <div class="kv-item clearfix">
                                    <label>身份证号：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        <input type="text" placeholder="身份证号" name="code">
                                    </div>
                                </div>
                                <div class="kv-item clearfix">
                                    <div>
                                        <label>所在部门：</label>
                                        <div class="kv-item-content" style="line-height:30px;">
                                            <input type="text" placeholder="${employees.dept.deptName}" name="dept"
                                                   disabled>
                                        </div>
                                        <div class="kv-item-tip">如需修改所在部门请到员工管理处修改</div>
                                    </div>
                                </div>
                                <div class="kv-item clearfix">
                                    <div>
                                        <label>所处职位：</label>
                                        <div class="kv-item-content" style="line-height:30px;">
                                            <input type="text" placeholder="${employees.job.jobName}" name="job"
                                                   disabled>
                                        </div>
                                        <div class="kv-item-tip">如需修改所在职位请到员工管理处修改</div>
                                    </div>
                                </div>
                                <div class="kv-item clearfix">
                                    <div>
                                        <div class="kv-item-content" style="line-height:30px;">
                                            <input type="hidden" style="width: 5px;" value="${employees.userLevel}"
                                                   name="level">
                                            <%--<label name="level" style="width: 5px;">${employees.userLevel}</label>--%>
                                        </div>
                                        <div>
                                            <div class="kv-item-content" style="line-height:30px;">
                                                <input type="hidden" style="width: 5px;" value="${employees.onLine}"
                                                       name="online">
                                            </div>
                                        </div>
                                        <div style="margin-left: 12%">
                                            <div class="kv-item-content" style="line-height:30px;">
                                                <input type="hidden" style="width: 5px;" value="${employees.workState}"
                                                       name="workState">
                                            </div>
                                        </div>
                                        <div class="kv-item-tip">个人级别And任务状态And在线状态--不可由个人进行修改，请联系高级管理员</div>
                                    </div>
                                </div>
                                <div class="kv-item clearfix">
                                    <label>您的密码：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        <label name="psw" style="width: 5px;">${employees.pwd}</label>
                                    </div>
                                    <div class="kv-item-tip" style="margin-left: 42%">密码请在修改密码页面修改</div>
                                </div>
                                <div class="kv-item clearfix">
                                    <label>就职协议：</label>
                                    <div class="kv-item-content" style="line-height:30px;">
                                        <textarea placeholder=""></textarea>
                                    </div>
                                    <input type="submit" value="修改" class="sapar-btn sapar-btn-recom"
                                           style="margin-left: 30%;margin-top: 4%">
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="saper-ft"></div>
</div>

</body>

<script type="text/javascript">
    $('select').iSelect();
</script>
</html>
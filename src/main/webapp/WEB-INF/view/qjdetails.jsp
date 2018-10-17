<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北大青鸟办公自动化管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="top"><div class="global-width"><img src="images/logo.gif" class="logo" /></div></div>
<div class="status">
	<div class="global-width">
			<span class="usertype">【登录角色：${user.posn.pname}】</span>
			<span>${user.uname }</span>你好！欢迎访问青鸟办公管理系统！
			<a href="/jboa/tologin">注销</a>
	</div>
</div>
<div class="main"><div class="global-width">
	<div class="nav" id="nav">
    	<div class="t"></div>
    	<dl>
        	<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">报销单管理</dt>
            <dd><a href="/jboa/tobxlist" target="_self">查看报销单</a></dd>
			<dd><a href="/jboa/tobxadd" target="_self">添加报销单</a></dd>
        </dl>
        <dl class="open">
        	<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">请假管理</dt>
            <dd><a href="/jboa/toqjlist" target="_self">查看请假</a></dd>
		    <dd><a href="qjsave.html" target="_self">申请请假</a></dd>
        </dl>
        <dl>
        	<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">统计报表</dt>
            <dd>报销单月度统计</dd>
            <dd>报销单年度统计</dd>
        </dl>
        <dl>
        	<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息中心</dt>
            <dd>信心收件箱</dd>
            <dd>信心发件箱</dd>
        </dl>
    </div>
    <div class="action">
    	<div class="t">查看请假</div>
   		<div class="pages">
        	<!--增加报销单 区域 开始-->
                <table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
                  <caption>基本信息</caption>
                  
                  <tr>
                    <td width="50%">姓名：<span>${leave.user.uname }</span></td>
                    <td width="50%">部门：<span>${leave.dept.dname }</span></td>
                  </tr>
                  <tr>
                    <td>开始时间：<span><fmt:formatDate value="${leave.startdate }"/></span></td>
                    <td>结束时间：<span><fmt:formatDate value="${leave.startdate }"/></span></td>
                  </tr>
                  <tr>
                    <td>休假类型：<span>${leave.leavetype }</span></td>
                     <td>请假事由：<span>${leave.reason }</span></td>
                  </tr>
                  <tr>
                    <td colspan="2">审批状态：<span>${leave.statu.statu }</span></td>
                  </tr>
                  <tr>
                  	<td colspan="2"><p>----------------------------------------------------------------------------------------</p></td>
                  </tr>
                  <c:if test="${leave.lsid!=2}">
	                  <tr>
	                    <td>审批意见：</td>
	                  </tr>
	                  <tr>
	                    <td><span>${c.opinion}</span></td>
	                  </tr>
                  </c:if>
                </table>
                <table  width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-item">
                  <tr>
                    <td colspan="4" class="submit" style="text-align: left;">
                    	<input type="button" name="button" id="button" onclick="window.location.href='/jboa/toqjlist'" value="返回" class="submit_01" />
                    </td>
                  </tr>  
                </table>   
                
        </div>
    </div>
</div></div>

<div class="copyright">Copyright  &nbsp;   &copy;  &nbsp; 北大青鸟</div>
</body>
</html>
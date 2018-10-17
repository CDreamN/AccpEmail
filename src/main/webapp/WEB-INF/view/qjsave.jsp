<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北大青鸟办公自动化管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="top">
		<div class="global-width">
			<img src="images/logo.gif" class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			<span class="usertype">【登录角色：${user.pson.pname }】</span>
			${user.uname }你好！欢迎访问青鸟办公管理系统！
		</div>
		<a href="/jboa/tologin">注销</a>
	</div>
	<div class="main">
		<div class="global-width">
			<div class="nav" id="nav">
				<div class="t"></div>
				<dl>
					<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';"> 报销单管理</dt>
					<dd><a href="/jboa/tobxlist">查看报销单</a></dd>
					<dd><a href="/jboa/tobxadd">添加报销单</a></dd>
				</dl>
				<dl class="open">
		        	<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">请假管理</dt>
		            <dd><a href="/jboa/toqjlist" target="_self">查看请假</a></dd>
		            <dd><a href="qjsave.html" target="_self">申请请假</a></dd>
		            
		        </dl>
			</div>
			<form id="form1" name="form1" method="post" >
				<div class="action">
					<div class="t">请假申请</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
							<tr>
								<td width="50%">&nbsp;&nbsp;姓名：<span>渲染</span></td>
								<td width="50%">&nbsp;&nbsp;部门：<span>渲染</span></td>
							</tr>
							<tr>
								<td>开始时间：<input type="date"></td>
								<td>结束时间：<input type="date"></td>
							</tr>
							<tr>
								<td>请假天数：1（天）</td>
								<td>休假类型：<select><option>--请选择--</option><option>--事假--</option></select></td>
							</tr>
						</table>
						<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-item">
							<!--请假事由-->
							<tr>
								<td colspan="4" class="event">请假事由：<textarea name="leave.reason" id="textarea" cols="45" rows="5"></textarea></td>
							</tr>
							<tr>
								<td colspan="4"> 下一审批人：<span>上一级管理层</span> </td>
							</tr>
							<!--表单提交行-->
							<tr>
								<td style="text-align: left;" colspan="4" class="submit">
								<input type="submit" name="btnSave" id="btnSave" value="提交流程" class="submit_01" />
								<input type="button" name="cancel" id="cancel" value="取消" class="submit_01" />
							</tr>
						</table>
						<!--增加报销单 区域 结束-->
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp; 北大青鸟</div>
</body>
</html>

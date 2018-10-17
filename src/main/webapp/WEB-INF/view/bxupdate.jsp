<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
				<span class="usertype">【登录角色：${user.posn.pname}】</span>
				${user.uname }你好！欢迎访问青鸟办公管理系统！
				<a href="/jboa/tologin">注销</a>
			</div>
		</div>
		<div class="main">
			<div class="global-width">
				<div class="nav" id="nav">
					<div class="t"></div>
					<dl class="open">
						<dt onclick=""> 报销单管理</dt>
						<dd>
						<a href="/jboa/tobxlist" target="_self">查看报销单</a>
					</dd>
					<dd>
						<a href="/jboa/tobxadd" target="_self">添加报销单</a>
					</dd>
					</dl>
					<dl>
						<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">请假管理</dt>
						<dd>
							<a href="leaveQueryAction.action" target="_self">查看请假</a>
						</dd>
						<dd>
							<a href="leaveToAddAction.action" target="_self">申请请假</a>
						</dd>
					</dl>
					<dl>
						<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';"> 我要销售</dt>
						<dd>信心收件箱</dd>
						<dd>信心发件箱</dd>
					</dl>
					<dl>
						<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';"> 信息中心</dt>
						<dd>信心收件箱</dd>
						<dd>信心发件箱</dd>
					</dl>
				</div>
				<form id="form1" name="form1" method="post" action="claimVoucherAddAction.action">
					<input type="hidden" name="claimVoucher.opType" id="opType" />
					<div class="action">
						<div class="t">修改报销单</div>
						<div class="pages">
							<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
								<caption>基本信息</caption>
								<tr>
									<td width="25%">编&nbsp;&nbsp;号：<span>渲染</span></td>
									<td width="30%">填&nbsp;写&nbsp;人：<span>渲染</span></td>
									<td width="25%">部&nbsp;&nbsp;门：<span>渲染</span></td>
									<td>职&nbsp;&nbsp;位：<span>渲染</span></td>
								</tr>
								<tr>
									<td>总金额：￥<label id="sum"></label></td>
									<td>填报时间：2013-08-08 10:30:00<</td>
									<td>状态：新创建</td>
									<td>待处理人：张平</td>
								</tr>
							</table>
							<p>&nbsp;</p>
							<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-item" id="table">
								<thead>
									<tr>
										<td>项目</td>
										<td>金额</td>
										<td>费用说明</td>
										<td>票据</td>
										<td>&nbsp;</td>
									</tr>
								</thead>
								
								<tbody id="tb">
									<tr>
										<td>
											<span>城际交通费</span>			
										</td>
										<td>100</td>
										<td>费用</td>
										<td><img src="images/logo.gif" width="100" height="80"/></td>
										<td>
											<a href="#"><img src="images/delete.gif" class="del" width="16" height="16" /></a>
										</td>
									</tr>
								</tbody>
								
								<tr>
									<td width="25%">
										<select>
											<option>城际交通费</option>
											<option>餐饮费</option>
											<option>住宿费</option>
										</select>
									</td>
									<td width="30%"><input style="width: 80px;" type="text" name="money" id="money" class="input_01" />&nbsp;<span style="color: red;">*</span></td>
									<td width="25%"><input style="width: 80px;" type="text" name="description" id="textfield" class="input_01" />&nbsp;<span style="color: red;">*</span></td>
									<td width="25%"><input type="file" name="file" /></td>
									<td>
										<a href="#"><img src="images/add.gif" class="add" width="16" height="16" /></a>
									</td>
								</tr>
							</table>
							<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-item">
								<!--报销单事由-->
								<tr>
									<td colspan="4" class="event"><label> 事 由： </label>
										<textarea name="claimVoucher.event" id="textarea" cols="45" rows="5">拜访客户</textarea></td>
								</tr>
								<!--表单提交行-->
								<tr>
									<td colspan="4" class="submit">
										<input type="button" name="btnSave" id="btnSave" value="保 存" class="submit_01" />
										<input type="button" name="btnSaveAndSubmit" id="btnSaveAndSubmit" value="提交" class="submit_01" />
										<input type="button" name="button" id="butAdd" value="返回" class="submit_01" /></td>
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
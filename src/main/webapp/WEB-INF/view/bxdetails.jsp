<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd"><html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>北大青鸟办公自动化管理系统</title>
		<link href="/adminAccp/assets/css/style.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<div class="top">
			<div class="global-width"><img src="/adminAccp/assets/images/logo.gif" class="logo" /></div>
		</div>
		<div class="status">
			<div class="global-width">
				<span class="usertype">【登录角色：${user != null ? user.positionName:"未登录"}】</span>
				${user != null ? user.employeeName:"未登录" }你好！欢迎访问青鸟办公管理系统！
				<a href="/adminAccp/login.jsp">注销</a>
			</div>
		</div>
		<div class="main">
			<div class="global-width">

				<div class="nav" id="nav">
					<div class="t"></div>
				<dl class="open">
					<dt onclick="">报销单管理</dt>
					<dd>
						<a href="/adminAccp/reimburse/list" target="_self">查看报销单</a>
					</dd>
					<dd>
						<a href="/jboa/tobxadd" target="_self">添加报销单</a>
					</dd>
				</dl>
				<dl>
					<dt
						onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">请假管理</dt>
					<dd>
						<a href="qjlist.html" target="_self">查看请假</a>
					</dd>
					<dd>
						<a href="qjsave.html" target="_self">申请请假</a>
					</dd>
				</dl>
					<dl>
						<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">我要销售</dt>
						<dd>信心收件箱</dd>
						<dd>信心发件箱</dd>
					</dl>
					<dl>
						<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息中心</dt>
						<dd>信心收件箱</dd>
						<dd>信心发件箱</dd>
					</dl>
				</div>
				<div class="action">
					<div class="t">查看报销单</div>
						<div class="pages">
							<!--增加报销单 区域 开始-->
							<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
								<caption>基本信息</caption>

								<tr>
									<td width="25%">编&nbsp;&nbsp;号：${info.reimburseId}</td>
									<td width="30%">填&nbsp;写&nbsp;人：${info.createManName }</td>
									<td width="25%">部&nbsp;&nbsp;门：${info.departmentName }</td>
									<td>职&nbsp;&nbsp;位：${info.positionName}</td>
								</tr>
								<tr>
									<td>总 金 额：${info.totalCount }</td>
									<td>填报时间：<fmt:formatDate value="${info.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>状&nbsp;&nbsp;态：${info.statusName}</td>
									<td>待处理人：${info.nextDealManName }</td>
								</tr>

							</table>
							<hr/>
							<p>&nbsp;</p>
							<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-item">
								<thead>
									<tr>
										<td width="30%">项目</td>
										<td width="25%">金额</td>
										<td width="25%">费用说明</td>
										<td width="25%">票据</td>
										<td>&nbsp;</td>
									</tr>
								</thead>
								
								<c:forEach items="${list }" var="d">
									<tr>
										<td>${d.desc}</td>
										<td>￥${d.subTotal}</td>
										<td>${d.desc}</td>
										<td><img src="logo.gif" /></td>
									</tr>
								</c:forEach>
							</table>
							
							<c:if test="${info.departmentId!=2 }">
							<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-item">
								<p>-----------------------------------------------------------------------------------------------------------</p>
									<c:forEach items="${chelist }" var="c">
										<tr>
											<td width="20%">审 批 人：${c.checkManName }(${c.positionName})</td>
											<td width="20%">审批时间：<fmt:formatDate value="${c.checkTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
											<td width="20%">审核：<strong style="color:red;">${c.resultName }</strong></td>
										</tr>
										<tr>
											<td>审核意见：<strong style="color:black;">${c.checkComment}</strong></td>
										</tr>
									</c:forEach>
							</table>
							<p>-----------------------------------------------------------------------------------------------------------</p>
							</c:if>
							
							<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-item">
								<tr>
									<td colspan="4" class="submit" style="text-align: left;">
										<input type="button" name="button" id="button" value="返回" class="submit_01" onclick="document.location='/adminAccp/reimburse/list'" />
									</td>
								</tr>
							</table>

						</div>
					
				</div>
			</div>
		</div>

		<div class="copyright">Copyright &nbsp; &copy; &nbsp; 北大青鸟</div>
	</body>

</html>
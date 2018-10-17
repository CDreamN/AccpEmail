<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北大青鸟办公自动化管理系统</title>
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="top">
		<div class="global-width">
			<img src="images/logo.gif" class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			<span class="usertype">【登录角色：${user.posn.pname }】</span> ${user.uname }你好！欢迎访问青鸟办公管理系统！
			<a href="/jboa/tologin">注销</a>
		</div>
	</div>
	<div class="main">
		<div class="global-width">
			<div class="nav" id="nav">
				<div class="t"></div>
				<dl>
					<dt
						onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">报销单管理</dt>
					<dd>
						<a href="/jboa/tobxlist" target="_self">查看报销单</a>
					</dd>
					<dd>
						<a href="/jboa/tobxadd" target="_self">添加报销单</a>
					</dd>
				</dl>
				<dl class="open">
					<dt
						onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">请假管理</dt>
					<dd>
						<a href="/jboa/toqjlist" target="_self">查看请假</a>
					</dd>
					<dd>
						<a href="qjsave.html" target="_self">申请请假</a>
					</dd>

				</dl>
				<!--   <dl>
        	<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">统计报表</dt>
            <dd>报销单月度统计</dd>
            <dd>报销单年度统计</dd>
        </dl>
        <dl>
        	<dt onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息中心</dt>
            <dd>信心收件箱</dd>
            <dd>信心发件箱</dd>
        </dl> -->
			</div>
			<input type="hidden" name="curPage" value="1" id="curPage">
			<div class="action">
				<div class="t">请假列表</div>
				<div class="pages">
					开始时间：<input type="date"> 结束时间：<input type="date"> <input
						type="submit" value="查询">
					<!--增加报销单 区域 开始-->
					<table width="90%" border="0" cellspacing="0" cellpadding="0"
						class="list">
						<tr>
							<td>编号</td>
							<td>发起时间</td>
							<td>审批时间</td>
							<td>审批意见</td>
							<td>审批状态</td>
							<td>操作</td>
						</tr>

						<c:forEach items="${llist.list }" var="list">
							<tr>
								<td>${list.lid}</td>
								<td><span><fmt:formatDate
											value="${list.startdate }" /> </span></td>
								<td><span><fmt:formatDate
											value="${list.check.checkdate }" /></span></td>
								<td><span>${list.check.opinion }</span></td>
								<td><span>${list.statu.statu }</span></td>
								<td>
									<!--
                            	作者：offline
                            	时间：2018-06-06
                            	描述：根据权限和数据动态呈现
                            --> <a
									href="/jboa/toqjdetail?lid=${list.lid }"><img
										src="images/search.gif" width="16" height="15" /></a> <c:if
										test="${list.uid!=user.uid && list.nextapproverid==user.uid && list.lsid!=3 && list.lsid!=7}">
										<a href="/jboa/toqjcheck?lid=${list.lid}"><img src="images/sub.gif"
											width="16" height="16" /></a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="6" align="left"><a class="first"
								page="${llist.firstPage }"
								style="cursor: pointer; text-decoration: underline;">首页</a> <c:if
									test="${llist.isHasPreviousPage() }">
									<a class="prev" page="${llist.prePage }"
										style="cursor: pointer; text-decoration: underline;">上一页</a>
								</c:if> <c:if test="${llist.isHasNextPage() }">
									<a class="next" page="${llist.nextPage }"
										style="cursor: pointer; text-decoration: underline;">下一页</a>
								</c:if> <a class="last" page="${llist.lastPage }"
								style="cursor: pointer; text-decoration: underline;">末页</a></td>
						</tr>
					</table>
					<!--增加报销单 区域 结束-->
				</div>
			</div>
		</div>
	</div>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp; 北大青鸟</div>
</body>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function(){
		page();
	});
	
	function page() {
		$(".first").click(function() {
			var page = $(this).attr("page");
			window.location.href = "/jboa/toqjlist?dqym=" + page;
		});
		$(".prev").click(function() {
			var page = $(this).attr("page");
			window.location.href = "/jboa/toqjlist?dqym=" + page;
		});
		$(".next").click(function() {
			var page = $(this).attr("page");
			window.location.href = "/jboa/toqjlist?dqym=" + page;
		});
		$(".last").click(function() {
			var page = $(this).attr("page");
			window.location.href = "/jboa/toqjlist?dqym=" + page;
		});
	}
</script>
</html>
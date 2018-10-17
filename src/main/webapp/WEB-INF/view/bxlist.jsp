<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北大青鸟办公自动化管理系统</title>
<link href="/adminAccp/assets/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="top">
		<div class="global-width">
			<img src="/adminAccp/assets/images/logo.gif" class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			<span class="usertype">【登录角色：${user != null ? user.positionName:"未登录"}】</span> <span>${user != null ? user.employeeName:"未登录" }</span>你好！欢迎访问青鸟办公管理系统！
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
						<a href="/adminAccp/reimburse/add" target="_self">添加报销单</a>
					</dd>
				</dl>
				<dl>
					<dt
						onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">请假管理</dt>
					<dd>
						<a href="/jboa/toqjlist" target="_self">查看请假</a>
					</dd>
					<dd>
						<a href="" target="_self">申请请假</a>
					</dd>
				</dl>
			</div>
			<form action="claimVoucherQueryAction.action" id="myForm"
				method="post">
				<input type="hidden" name="curPage" value="1" id="curPage">
				<div class="action">
					<div class="t">查看报销单</div>
					<div class="pages">
						报销单状态: <select name="statu">
							<option value=0>--请选择--</option>
							<c:forEach items="${list }" var="s">
								<option value="${s.statusId }">${s.statusName }</option>
							</c:forEach>
						</select> 开始时间：<input type="date"> 结束时间：<input type="date">
						<input type="button" name="query" value="查询" />
						<!--增加报销单 区域 开始-->
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							class="list">
							<tr>
								<td>编号</td>
								<td>填报日期</td>
								<td>填报人</td>
								<td>总金额</td>
								<td>状态</td>
								<td>待处理人</td>
								<td>操作</td>
							</tr>
							<tbody id="tb">
								<c:forEach items="${page.list }" var="r">
									<tr>
										<td><span>${r.reimburseId}</span></td>
										<td><span><fmt:formatDate value="${r.createTime }"
													pattern="yyyy-MM-dd HH:mm:ss" /> </span></td>
										<td><span>${r.createManName  }</span></td>
										<td>￥<span>${r.totalCount }</span></td>
										<td><span>${r.statusName }</span></td>
										<td><span>${r.nextDealManName }</span></td>
										<td>
											<a href="/adminAccp/reimburse/queryOn?reimburseId=${r.reimburseId}"><img src="/adminAccp/assets/images/search.gif"	width="16" height="15" /></a>
											
											<c:if test="${r.createMan==user.employeeId && r.statusId == 2 }">
												<a href="/adminAccp/reimburse/add?reimburseId=${r.reimburseId }"><img src="/adminAccp/assets/images/edit.gif" width="16" height="16" /></a>
												<a class="del" rid=${r.reimburseId } style="cursor: pointer;"><img src="/adminAccp/assets/images/delete.gif" /></a> 
											</c:if>
											
											<c:if test="${(user.positionId == 3 && r.statusId == 1) || (user.positionId != 3 && user.employeeId == r.nextDealMan) }">
												<a href="/adminAccp/reimburse/adminbx?reimburseId=${r.reimburseId}"><img src="/adminAccp/assets/images/sub.gif" width="16" height="16" /></a>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<tr>
								<td colspan="6" align="left"><a class="first"
									page="${page.firstPage }"
									style="cursor: pointer; text-decoration: underline;">首页</a> <c:if
										test="${page.isHasPreviousPage() }">
										<a class="prev" page="${page.prePage }"
											style="cursor: pointer; text-decoration: underline;">上一页</a>
									</c:if> <c:if test="${page.isHasNextPage() }">
										<a class="next" page="${page.nextPage }"
											style="cursor: pointer; text-decoration: underline;">下一页</a>
									</c:if> <a class="last" page="${page.lastPage }"
									style="cursor: pointer; text-decoration: underline;">末页</a></td>
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

<script type="text/javascript" src="/adminAccp/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function() {
		query();
		page();
		del();
		fukuan();
	});
	
	function fukuan(){
		$(".fk").click(function(){
			var checkid=$(this).attr("checkid");
			if(confirm("确定付款?")){
				$.ajax("/jboa/checkfukuanbx?checkid="+checkid,{
					type:"Post",
					dataType:"text",
					success:function(data){
						if(data=="yes"){
							alert("付款成功!");
							window.location.href="/jboa/tobxlist";
						}else{
							alert("付款失败!");
						}
					}
				});
			}
		});
	}
	
	function del(){
		$(".del").click(function(){
			var rid=$(this).attr("rid");
			console.log(rid);
			if(confirm("确定删除此报销单?")){
				$.ajax("/jboa/delReim?rid="+rid,{
					type:"Post",
					dataType:"text",
					success:function(data){
						if(data=="yes"){
							alert("删除成功!");
							window.location.href="/jboa/tobxlist";
						}else{
							alert("删除失败!");
						}
					}
				});
			}
		});
	}
	

	function query() {
		$("[name=query]").click(function() {
			var statu = $("[name=statu]").val();
			window.location.href="/adminAccp/reimburse/list?statusId="+statu;
		});
	}

	function page() {
		$(".first").click(function() {
			var page = $(this).attr("page");
			window.location.href = "/adminAccp/reimburse/list?pageNum=" + page;
		});
		$(".prev").click(function() {
			var page = $(this).attr("page");
			window.location.href = "/adminAccp/reimburse/list?pageNum=" + page;
		});
		$(".next").click(function() {
			var page = $(this).attr("page");
			window.location.href = "/adminAccp/reimburse/list?pageNum=" + page;
		});
		$(".last").click(function() {
			var page = $(this).attr("page");
			window.location.href = "/adminAccp/reimburse/list?pageNum=" + page;
		});
	}
</script>
</html>
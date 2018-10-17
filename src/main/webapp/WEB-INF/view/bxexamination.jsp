<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北大青鸟办公自动化管理系统</title>
<link href="/adminAccp/assets/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="top">
		<div class="global-width">
			<img src="images/logo.gif" class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			<span class="usertype">【登录角色：${user != null ? user.positionName:"未登录"}】</span> ${user != null ? user.employeeName:"未登录" }你好！欢迎访问青鸟办公管理系统！<a
				href="/jboa/tologin">注销</a>
		</div>
	</div>
	<div class="main">
		<div class="global-width">
			<div class="nav" id="nav">
				<div class="t"></div>
				<dl class="open">
					<dt
						onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">报销单管理</dt>
					<dd>
						<a href="/jboa/tobxlist" target="_self">查看报销单</a>
					</dd>
					<dd>
						<a href="/jboa/tobxadd" target="_self">添加报销单</a>
					</dd>
				</dl>
				<dl>
					<dt
						onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">请假管理</dt>
					<dd>
						<a href="leaveQueryAction.action" target="_self">查看请假</a>
					</dd>
					<dd>
						<a href="leaveToAddAction.action" target="_self">申请请假</a>
					</dd>
				</dl>
			</div>
			<div class="action">
				<div class="t">审核报销单</div>
					<input type="hidden" name="claimVoucher.opType" id="opType" />
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							class="addform-base">
							<caption>基本信息</caption>

							<tr>
								<td width="25%">编&nbsp;&nbsp;号：${info.reimburseId }</td>
								<td width="30%">填&nbsp;写&nbsp;人：${info.createManName }</td>
								<td width="25%">部&nbsp;&nbsp;门：${info.departmentName }</td>
								<td>职&nbsp;&nbsp;位：${info.positionName}</td>
							</tr>
							<tr>
								<td>总 金 额：${info.totalCount }</td>
								<td>填报时间：<fmt:formatDate value="${info.createTime }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>状&nbsp;&nbsp;态：${info.statusName}</td>
								<td>待处理人：${info.nextDealManName }</td>
							</tr>

						</table>
						<hr />
						<p>&nbsp;</p>
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							class="addform-item">
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
						<p>-----------------------------------------------------------------------------------------------------------</p>

						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							class="addform-base">
							<tr>
								<td>审核意见：</td>
							</tr>
							<tr>
								<td><textarea name="checkResult.comment" id="textarea"
										cols="45" rows="5"></textarea></td>
							</tr>
							<tr>
								<td colspan="4" class="submit"><input checkid="${info.reimburseId }" type="button"
									name="btnPass" id="btnPass" value="审批通过" class="submit_01" />
									<input checkid="${info.reimburseId }" type="button" name="btnBack" id="btnBack" value="打回"
									class="submit_01" /> <input type="button" name="button"
									id="button" value="返回" class="submit_01"
									onclick="window.location.href='/adminAccp/reimburse/list'" /></td>
							</tr>

						</table>
					</div>
			</div>
		</div>
	</div>

	<div class="copyright">Copyright &nbsp; &copy; &nbsp; 北大青鸟</div>
</body>
<script type="text/javascript" src="/adminAccp/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function(){
		check();
	});

	function check(){
		//审核通过
		 $("#btnPass").click(function(){
			var opinion=$("#textarea").val();
			var checkid=$(this).attr("checkid");
			console.log(opinion+","+checkid);
			$.ajax("/adminAccp/reimburse/checkbx?checkResult=1&bizId="+checkid+"&checkComment="+opinion,{
				type:"POST",
				dataType:"json",
				success:function(data){
					if(data.code=="200"){
						alert("已同意")
						window.location.href="/adminAccp/reimburse/list";
					}else{
						alert("失败")
					}
				}
			});
		}); 
		
		//审核打回
		$("#btnBack").click(function(){
			var opinion=$("#textarea").val();
			var checkid=$(this).attr("checkid");
			console.log(opinion+","+checkid);
			$.ajax("/jboa/checkjujuebx?checkid="+checkid+"&opinion="+opinion,{
				type:"POST",
				dataType:"text",
				success:function(data){
					if(data=="yes"){
						alert("已打回")
						window.location.href="/jboa/tobxlist";
					}else{
						alert("失败")
					}
				}
			});
		});	
	}
</script>
</html>
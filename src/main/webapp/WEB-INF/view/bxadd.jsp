<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
			<span class="usertype">【登录角色：${user != null ? user.positionName:"未登录"}】</span> <span>${user != null ? user.employeeName:"未登录" }</span>你好！欢迎访问青鸟办公管理系统！<a
				href="/jboa/tologin">退出</a>
		</div>
	</div>
	<div class="main">
		<div class="global-width">
			<div class="nav" id="nav">
				<div class="t"></div>
				<dl class="open">
					<dt onclick="">报销单管理</dt>
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
						<a href="/jboa/toqjlist" target="_self">查看请假</a>
					</dd>
					<dd>
						<a href="qjsave.html" target="_self">申请请假</a>
					</dd>
				</dl>
			</div>
			<form id="form1" name="form1" method="post"
				action="claimVoucherAddAction.action">
				<input type="hidden" name="claimVoucher.opType" id="opType" />
				<div class="action">
					<div class="t">增加报销单</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							class="addform-base">
							<caption>基本信息</caption>
							<tr>
								<td width="25%">编&nbsp;&nbsp;号：<span>${info.reimburseId }</span></td>
								<td width="30%">填&nbsp;写&nbsp;人：<span>${info.createManName }</span></td>
								<td width="25%">部&nbsp;&nbsp;门：<span>${info.departmentName }</span></td>
								<td>职&nbsp;&nbsp;位：<span>${info.positionName}</span></td>
							</tr>
							<tr>
								<td>总金额：￥${info.totalCount }</td>
								<td>填报时间：<fmt:formatDate value="${info.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>状态：${info.statusName}</td>
								<td>待处理人：${info.nextDealManName }</td>
							</tr>
						</table>
						<p>&nbsp;</p>
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							class="addform-item" id="table">
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
								
							</tbody>

							<tr>
								<td width="25%"><select id="type">
										<option>城际交通费</option>
										<option>餐饮费</option>
										<option>住宿费</option>
								</select></td>
								<td width="30%"><input style="width: 80px;" type="text"
									name="money" id="money" class="input_01" />&nbsp;<span
									style="color: red;">*</span></td>
								<td width="25%"><input style="width: 80px;" type="text"
									name="description" id="textfield" class="input_01" />&nbsp;<span
									style="color: red;">*</span></td>
								<td width="25%"><input type="file" name="file" id="file" /></td>
								<td><a href="javascript:add()"><img src="/adminAccp/assets/images/add.gif" class="add"
										width="16" height="16" /></a></td>
							</tr>
						</table>
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							class="addform-item">
							<!--报销单事由-->
							<tr>
								<td colspan="4" class="event"><label> 事 由： </label> <textarea
										name="claimVoucher.event" id="textarea" cols="45" rows="5">拜访客户</textarea></td>
							</tr>
							<!--表单提交行-->
							<tr>
								<td colspan="4" class="submit"><input onclick="save()" type="button"
									name="btnSaveAndSubmit" id="btnSaveAndSubmit" value="保存并提交"
									class="submit_01" /> <input type="button" name="btnBack"
									id="btnBack" value="取消" class="submit_01" />
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
	var base64 = null;
	$(function(){
		$("#file").change(function() {
	    	var file = this.files[0];
	    	var reader = new FileReader();
	    	reader.readAsDataURL(file);//调用自带方法进行转换
	    	reader.onload = function(e) {
	    		base64 = this.result;
	    	};
		});
	});
	
	function getJson(){
		var Json = "";
		for(var i = 0;i < $("#tb tr").length;i++){
			Json += "{\"type\":\""+$($("#tb tr")[i]).find(".type").text()+"\",\"money\":\""+$($("#tb tr")[i]).find(".money").text()+"\",\"text\":\""+$($("#tb tr")[i]).find(".text").text()+"\",\"base64\":\""+$($("#tb tr")[i]).find("img").attr("src")+"\"}";
			if(i < $("#tb tr").length-1) Json += ",";
		}
		return "{"+Json+"}";
	}
	
	function save(){
		var json = getJson();
		alert(json);
		$.post("/adminAccp/reimburse/addDetail",{"imgjson":json},function(){
			
		},"json");
	}
	
	function add(){
		var type = $($("#type").find("option:selected")).text();
		var money = $("#money").val();
		var text = $("#textfield").val();
		if(base64 == null){
			alert("请先选择图片。");
			return;
		}
		var $tr = $("<tr class=\"tr\"><td><span class=\"type\">"+type+"</span></td><td class=\"money\">"+money+"</td><td class=\"text\">"+text+"</td>"+
				"<td><img src=\""+base64+"\" width=\"100\" height=\"80\" /></td>"+
				"<td><a href=\"javascript:void(0)\" onclick=\"remove(this)\"><img src=\"/adminAccp/assets/images/delete.gif\""+
				"class=\"del\" width=\"16\" height=\"16\" /></a></td></tr>");
		$("#tb").append($tr);
		base64 = null;
		$("#money").val("");
		$("#textfield").val("");
	}
	
	function remove(obj){
		$(obj).parents("tr").remove();
	}

</script>

</html>
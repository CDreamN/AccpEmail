<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/adminAccp/assets/css/style.css" rel="stylesheet" type="text/css" />
<style>
	.info-box{
		height:300px;
		position: relative;
	}
	.info-box > div{
		width:300px;
		height:20px;
		margin:auto;
		color:white;
		font-size:18px;
		text-align:center;
		padding:20px 10px;
		background-color:#4E93BB;
		position:absolute;
		bottom:0;
		right:0;
		left:0;
		top:0;
	}
</style>
</head>
<body>
<div class="top">
		<div class="global-width">
			<img src="/adminAccp/assets/images/logo.gif" class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			<span class="usertype">【登录角色：${user != null ? user.positionName:"未登录"}】</span> ${user != null ? user.employeeName:"未登录" }你好！欢迎访问青鸟办公管理系统！
			<a href="/jboa/tologin">注销</a>
		</div>
	</div>
	<div class="main">
		
	</div>
		<div class="info-box">
			<div>${MSG }<a href="/adminAccp/${URL }">${TEXT }</a></div>
		</div>
	
	<div class="copyright">Copyright &nbsp; &copy; &nbsp; 北大青鸟</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/index.css" />
<link rel="stylesheet" href="assets/css/boot.css" />
<style>
	.verCodeBox{
		padding:5px 0px 5px 120px;
	}
</style>
</head>
<body>
	<div class="wrap">
			<div class="wrap-box">
				<div id="logo">
					<span>北大青鸟办公管理系统</span>
				</div>
				<div id="login">
					<div class="login-box">
						<div class="box Verification">
							<div class="login-load">
								<div class="load-box">
									<div class="load">
										<i></i>
									</div>
									<div>登录中。。。</div>
								</div>
							</div>
							<div class="login-title">
								<h2>验证码</h2><a href="javascript:backLogin()">返回重新输入</a>
								<form action="Employee/login" name="login" method="post">
									<div class="context">
										<div class="input-text">
											<span>验证码：</span>
											<input type="text" name="VerCode" placeholder="请输入验证码"/>
											<input type="hidden" name="employeeId">
											<input type="hidden" name="password">
										</div>
									</div>
									<div class="verCodeBox"><img src="/adminAccp/code"></div>
									<div class="login-button"><input type="button" value="登录" onclick="GoLogin()"></div>
								</form>
							</div>
						</div>
						<div class="box login">
							<div class="login-title">
								<h2>登录</h2>
							</div>
							<form name="user">
								<div class="context">
									<div class="input-text">
										<span>工号：</span>
										<input type="text" name="employeeId" placeholder="请输入员工工号"/>
									</div>
									<div class="input-text">
										<span>密码：</span>
										<input type="password" name="password" placeholder="请输入员工密码" />
									</div>
								</div>
								<div class="login-button"><input type="button" value="登录" onclick="goVerification()"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript" src="/adminAccp/assets/js/jquery-3.3.1.js"></script>
<script>
	function goVerification(){
		$(".Verification").attr("style","animation: top 1.5s linear forwards;");
		$(".login").attr("style","animation: down 1.5s linear forwards;");
	}
	
	function backLogin(){
		$(".login").attr("style","animation: top 1.5s linear forwards;");
		$(".Verification").attr("style","animation: down 1.5s linear forwards;");
	}
	
	function loginLoad(){
		$(".login-load").show();
		$(".load-box>.load").attr("style","animation: login-load 1s linear infinite;");
	}
	
	function GoLogin(){
		loginLoad();
		document.login.employeeId.value = document.user.employeeId.value;
		document.login.password.value = document.user.password.value;
		setTimeout(function(){
			document.login.submit();
		},3000);
	}
</script>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>河北工程大学干部考评系统</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<!--[if lte IE 8.0]>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<![endif]-->
<!--[if gte IE 9.0]>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<![endif]-->
<!--[if !IE]>-->
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<!-- <![endif]-->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
body {
	background: #0066A8 url(img/login_bg.png) no-repeat center 0px;
}

.tit {
	margin: auto;
	margin-top: 170px;
	text-align: center;
	width: 350px;
	padding-bottom: 20px;
}

.login-wrap {
	width: 220px;
	padding: 30px 50px 0 330px;
	height: 245px;
	background: #fff url(img/20150212154319.jpg) no-repeat 30px 40px;
	margin: auto;
	overflow: hidden;
}

.login_input {
	display: block;
	width: 210px;
}

.login_user {
	background: url(img/input_icon_1.png) no-repeat 200px center;
	font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif
}

.login_password {
	background: url(img/input_icon_2.png) no-repeat 200px center;
	font-family: "Courier New", Courier, monospace
}

.btn-login {
	background: #40454B;
	box-shadow: none;
	text-shadow: none;
	color: #fff;
	border: none;
	height: 35px;
	line-height: 26px;
	font-size: 14px;
	font-family: "microsoft yahei";
}

.btn-login:hover {
	background: #333;
	color: #fff;
}

.copyright {
	margin: auto;
	margin-top: 10px;
	text-align: center;
	width: 370px;
	color: #CCC
}

@media ( max-height : 700px) {
	.tit {
		margin: auto;
		margin-top: 100px;
	}
}

@media ( max-height : 500px) {
	.tit {
		margin: auto;
		margin-top: 50px;
	}
}
</style>
<script language="JavaScript">
	$(document).ready(function(data) {
		var loginCheck = $("#loginCheck").val();
		if (loginCheck == "验证码错误") {
			alert("验证码错误");
		} else if (loginCheck == "用户名或密码错误") {
			alert("用户名或密码错误");
		} else if (loginCheck == "管理员已锁定") {
			alert("管理员已锁定");
		} else {
		}
	});
	function loginChecka() {
		//文本框格式验证（目前只验证非空）
		if (LoginForm.type.value == 4) {
			alert("请选择用户类型！");
			return false;
		}
		if (isNull(LoginForm.teacherId.value)) {
			alert("请输入用户名！");
			return false;
		}
		if (isNull(LoginForm.password.value)) {
			alert("请输入密码！");
			return false;
		}
		//根据登录角色不同调用不同的action
		if (LoginForm.type.value == 0 || LoginForm.type.value == 1) {
			document.getElementById("LoginForm").setAttribute("action",
					"adminLogin.action");
		} else if (LoginForm.type.value == 2) {
			document.getElementById("LoginForm").setAttribute("action",
					"teacherLogin.action");
		} else if (LoginForm.type.value == 3) {
			document.getElementById("LoginForm").setAttribute("action",
					"studentLogin.action");
		}
		document.getElementById("LoginForm").submit();
	}
	document.onkeydown = function(event) {
		var e = event || window.event || arguments.callee.caller.arguments[0];
		if (e && e.keyCode == 13) { // enter 键//要做的事情	
			if (LoginForm.type.value == 0 || LoginForm.type.value == 1) {
				document.getElementById("LoginForm").setAttribute("action",
						"adminLogin.action");
			} else if (LoginForm.type.value == 2) {
				document.getElementById("LoginForm").setAttribute("action",
						"teacherLogin.action");
			} else if (LoginForm.type.value == 3) {
				document.getElementById("LoginForm").setAttribute("action",
						"studentLogin.action");
			}
			document.getElementById("LoginForm").submit();
		}
	};
	function isNull(str) {
		if (str == "")
			return true;
		var regu = "^[ ]+$";
		var re = new RegExp(regu);
		return re.test(str);
	}
</script>
</head>
<body>
	<div class="tit">
		<img src="img/tit.png" alt="" />
	</div>
	<div class="login-wrap">
		<form name="LoginForm" id="LoginForm" method="post">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="25" valign="bottom">用户类型：</td>
				</tr>
				<tr>
					<td height="35"><select name="type" id="type"
						style="height:25px;width:218px;border:1px solid #CCC;box-shadow:0px 1px 1px rgba(0, 0, 0, 0.075) inset;transition:border 0.2s linear 0s, box-shadow 0.2s linear 0s;display:inline-block">
							<option value="0">系统管理员</option>
							<option value="1">管理员</option>
							<option value="2">教职工</option>
					</select></td>
				</tr>
				<tr>
					<td height="25" valign="bottom">用户名：</td>
				</tr>
				<tr>
					<td><input type="text" class="login_input login_user"
						name="teacherId" id="teacherId" /></td>
				</tr>
				<tr>
					<td height="35" valign="bottom">密 码：</td>
				</tr>
				<tr>
					<td><input type="password" class="login_input login_password"
						name="password" id="password" /></td>
				</tr>
				<tr>
					<td height="60" valign="bottom"><input type="button"
						onclick="loginChecka()" class="btn btn-block btn-login" value="登录" />
					</td>
				</tr>
				<tr style="display:none">
					<td><input id="loginCheck" value="${sessionScope.loginCheck}" />
						<input id="isFinished" name="isFinished" value="0" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
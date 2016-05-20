<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<title>河北工程大学组织干部考评系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="css/bootstrap.css" rel="stylesheet"></link>
<link type="text/css" href="css/laydate.css" rel="stylesheet"></link>
<link type="text/css" href="css/css.css" rel="stylesheet"></link>
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
<script type="text/javascript" src="js/laydate.js"></script>
<script language="JavaScript">
	function check() {
		url = "modifyPassword.action";
		params = {
			"cardId" : $("#cardId").val(),
			"password" : $("#password").val()
		};
		$.post(url, params, function(data) {
			if (data == "ok") {
				alert("修改成功，请返回登录");
				$("#modify").attr("value", "返回登录");
				$("#modify").attr("onclick", "goBack()");
			} else {
				alert("输入有误");
			}
		});
	}
	function goBack() {
		window.history.go(-1);
	}
	function modify() {
		if ($("#cardId").val() == "") {
			alert("请输入身份证号");
			return false;
		} else {
			if ($("#password").val() == "") {
				alert("请输入密码");
				return false;
			} else {
				if ($("#againpassword").val() == "") {
					alert("请再次输入密码");
					return false;
				} else {
					if ($("#password").val() != $("#againpassword").val()) {
						alert("两次输入密码不一致");
						return false;
					} else {
						check();
					}
				}
			}
		}
	}
</script>
</head>

<body>
<body style="background-color: white">
	<div
		style="width:100%;height:85px; margin-top:-5px;background: url(images/header_bg.jpg) repeat;text-align: right">
	</div>
	<div
		style="width:100%;height:80%;border-radius: 7px; background-color:white;margin-top:6px;">
		<table style="margin:auto;margin-top:20px;width:25%"
			class="table table-bordered">
			<thead>
				<tr>
					<td style="text-align: center;" colspan="2">请您修改密码!</td>
				</tr>
			</thead>
			<tbody style="text-align: left">
				<tr>
					<td align="center" bgcolor="#f1f1f1" nowrap="nowrap" width="10%">身份证号:</td>
					<td><input type="text" id="cardId" style="height:100%" /></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#f1f1f1" nowrap="nowrap" width="10%">新&nbsp;&nbsp;密&nbsp;&nbsp;码:</td>
					<td><input type="password" id="password" style="height:100%" /></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#f1f1f1" nowrap="nowrap" width="10%">再次输入:</td>
					<td><input type="password" name="againpassword"
						id="againpassword" style="height:100%" /></td>
				</tr>
			</tbody>
		</table>
		<table class="margin-bottom-20 table  no-border">
			<tbody>
				<tr>
					<td class="text-center"><input type="button" value="确认修改"
						onclick="modify()" id="modify" class="btn btn-info "
						style="width:80px;" type="submit" />
				</tr>
			</tbody>
		</table>
	</div>
	<div
		style="width:100%;background-color:white; height:30px;clear:both;border-radius: 7px;">
	</div>
</body>
</html>

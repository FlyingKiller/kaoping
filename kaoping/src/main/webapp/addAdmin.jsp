<%@ page language="java" import="java.util.*,java.text.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加管理员</title>
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
<script type="text/javascript">
	function goBack() {
		history.go(-1);
	}
	function addCheck() {
		//文本框非空验证
		if (isNull(AddAdminForm.teacherId.value)) {
			alert("请输入职工工号！");
			return false;
		} else {
			document.getElementById("AddAdminForm").setAttribute("action",
					"addAdmin.action");
			document.getElementById("AddAdminForm").submit();
		}
	}

	function isNull(str) {
		if (str == "")
			return true;
		var regu = "^[ ]+$";
		var re = new RegExp(regu);
		return re.test(str);
	}

	function inputName() {
		var url = "checkAdminName.action";
		var parmas = {
			teacherId : $("#teacherId").val()
		};
		$.post(url, parmas, function(data) {
			if ($("#teacherId").val() == "") {
				$("#result").html("");
				$("#refer").attr("onclick", "addCheck()");
				$("#refer").attr("value", "确认添加");
			} else {
				$("#result").html(data);
				if (data == "工号可用") {
					$("#result").css("color", "green");
					$("#refer").attr("onclick", "addCheck()");
					$("#refer").attr("value", "确认添加");
				} else {
					$("#result").css("color", "red");
					$("#refer").attr("onclick", "");
					$("#refer").attr("value", "无法添加");
				}
			}
		});
	}
	$(function() {
		$("#teacherId").blur(function() {
			inputName();
		});
		$("#passwordfail").hide();
	});
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div id="middle">
		<%@include file="menu.jsp"%>
		<div class="right" id="mainFrame">
			<div class="right_cont">
				<ul class="breadcrumb">
					当前位置： ${sessionScope.index}
					<span class="divider">/</span>添加管理员
				</ul>
				<div class="title_right">
					<strong> 添加管理员 </strong>
				</div>
			</div>
			<div style="width: 900px; margin: auto;">
				<form name="AddAdminForm" id="AddAdminForm" method="post">
					<table class="table table-bordered"
						style="width: 100%; margin-left: auto; margin-right: auto; margin-top: 0px">
						<tbody>
							<tr>
								<td align="left" bgcolor="#f1f1f1" nowrap="nowrap">职工工号:</td>
								<td><input type="text" id="teacherId" name="teacherId"
									onkeyup="inputName()" /><span id="result"></span></td>

							</tr>
						</tbody>
					</table>
					<table class="margin-bottom-20 table  no-border">
						<tbody>
							<tr>
								<td class="text-center"><input value="确认添加"
									class="btn btn-info " style="width: 80px;" type="button"
									onclick="addCheck()" id="refer" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div><%@include file="foot.jsp"%>
	</div>
</body>
</HTML>

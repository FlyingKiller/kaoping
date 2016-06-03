<%@ page language="java" import="java.util.*,java.text.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加教职工</title>
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
	function sureAdd() {
		if ($("#name").val() == "") {
			alert("姓名不能为空");
		} else if ($("#teacherId").val() == "") {
			alert("工号不能为空");
		} else if ($("#academy").val() == "") {
			alert("所在部门不能为空");
		}
		var url = "addTeacher.action";
		var params = {
			"name" : $("#name").val(),
			"sex" : $('input:radio:checked').val(),
			"nation" : $("#nation").val(),
			"status" : $("#status").val(),
			"degree" : $("#degree").val(),
			"dignity" : $("#dignity").val(),
			"level" : $("#level").val(),
			"positional" : $("#positional").val(),
			"positionalLevel" : $("#positionalLevel").val(),
			"positionalSery" : $("#positionalSery").val(),
			"teacherId" : $("#teacherId").val(),
			"academy" : $("#academy").val(),
			"cardId" : $("#cardId").val(),
			"password" : $("#passWord").val(),
		};
		$.post(url, params, function(data) {
			alert(data);
		});
	}
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
					<span class="divider">/</span>添加教职工
				</ul>
				<div class="title_right">
					<strong>添加教职工</strong>
				</div>
			</div>
			<div style="width: 900px; margin: auto">
				<form action="addTeacher" method="post">
					<table class="table table-bordered ">
						<tbody>
							<tr align="center">
								<td width="10%" bgcolor="#f1f1f1" nowrap="nowrap">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
								<td width="25%" align="left"><input type="text" name="name"
									id="name" /></td>
								<td width="10%" bgcolor="#f1f1f1" nowrap="nowrap">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
								<td width="25%" align="left"><input type="radio" name="sex" 
									value="男" />&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;<input
									type="radio" name="sex"  value="女" />&nbsp;&nbsp;&nbsp;女</td>
							</tr>
							<tr align="center">
								<td bgcolor="#f1f1f1" nowrap="nowrap">民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</td>
								<td align="left"><input type="text" name="nation"
									id="nation" /></td>
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">职工工号：</td>
								<td align="left"><input type="text" name="teacherId"
									id="teacherId" /></td>
							</tr>
							<tr align="center">
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">政治面貌：</td>
								<td align="left"><input type="text" name="status"
									id="status" /></td>
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：</td>
								<td align="left"><input type="text" name="degree"
									id="degree" /></td>
							</tr>
							<tr align="center">
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">个人身份：</td>
								<td align="left"><input type="text" name="dignity"
									id="dignity" /></td>
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
								<td align="left" colspan="3"><input type="text"
									name="passWord" id="passWord" /></td>
							</tr>
							<tr align="center">
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
								<td align="left"><input type="text" name="level" id="level" /></td>
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
								<td align="left"><input type="text" name="positional" id="positional" /></td>
							</tr>
							<tr align="center">
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">职称级别：</td>
								<td align="left"><input type="text" name="positionalLevel"
									id="positionalLevel" /></td>
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">职称系列：</td>
								<td align="left"><input type="text" name="positionalSery"
									id="positionalSery" /></td>
							</tr>
							<tr align="center">
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">所在单位：</td>
								<td align="left"><input type="text" name="academy"
									id="academy" /></td>
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">身&nbsp;&nbsp;份&nbsp;&nbsp;证：</td>
								<td align="left"><input type="text" name="cardId"
									id="cardId" /></td>
							</tr>
						</tbody>
					</table>
					<table class="margin-bottom-20 table  no-border">
						<tbody>
							<tr>
								<td class="text-center"><input type="hidden"
									value="${session.updateTeacher.id}" name="id" /><input
									type="hidden" value="${sessionScope.currentUser.academy}"
									name="adminAcademy" /><input value="确定添加"
									class="btn btn-info " style="width: 80px;" type="button"
									onclick="sureAdd()" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
		<%@include file="foot.jsp"%>
	</div>
</body>
</html>
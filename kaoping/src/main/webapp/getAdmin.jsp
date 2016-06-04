<%@ page language="java" import="java.util.*,java.text.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看管理员</title>
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

	$(function() {
		$("[id=delete]").click(function() {
			var message = $(this).next(":hidden").val();
			var flag = confirm("确定删除管理员     " + message + "    吗?");
			if (flag) {
				var url = this.href;
				var $tr = $(this).parent().parent();
				var params = {
					time : new Date()
				};
				$.post(url, params, function(data) {
					alert(data);
					$tr.remove();
				});
			}
			return false;
		});
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
					<span class="divider">/</span>查看管理员
				</ul>
				<div class="title_right">
					<strong>查看管理员</strong>
				</div>
			</div>
			<div style="width: 900px; margin: auto">
				<s:if test="%{#session.adminList!=null}">
					<table class="table table-bordered table-hover table-striped">
						<tbody>
							<tr align="center">
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">工号</td>
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">姓名</td>
								<td width="13%" bgcolor="#f1f1f1" nowrap="nowrap">创建时间</td>
								<td width="7%" bgcolor="#f1f1f1" nowrap="nowrap">所在单位</td>
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">状态</td>
								<td width="7%" bgcolor="#f1f1f1" nowrap="nowrap">登录次数</td>
								<td width="5%" bgcolor="#f1f1f1" nowrap="nowrap">删除</td>
							</tr>
							<s:iterator value="%{#session.adminList}">
								<tr align="center">
									<td><s:property value="teacherId" /></td>
									<td><s:property value="name" /></td>
									<td><s:date format="yyyy年MM月dd日" name="createTime" /></td>
									<td><s:property value="academy" /></td>
									<td><s:property value="enabled==1?'激活':'锁定'" /></td>
									<td><s:property value="loginNum" /></td>
									<td><a
										href="deleteAdmin.action?teacherId=<s:property value='teacherId' />"
										id="delete">删除</a><input type="hidden"
										value="<s:property value='name' />" /></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</s:if>
			</div>
		</div>
		<%@include file="foot.jsp"%>
	</div>
</body>
</html>
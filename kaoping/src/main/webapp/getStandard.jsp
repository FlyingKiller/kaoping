<%@ page language="java" import="java.util.*,java.text.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看标准</title>
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
	$(function() {
		$(".delete").click(function() {
			var message = $(this).next(":hidden").val();
			var flag = confirm("删除     " + message + "    吗?");
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
					<span class="divider">/</span>查看标准
				</ul>
				<div class="title_right">
					<strong>查看标准</strong>
				</div>
			</div>
			<div style="width: 900px; margin: auto">
				<s:if test="%{#session.standardList.size==0}">
					<table class="table table-bordered table-hover table-striped">
						<tbody>
							<tr align="center">
								<td width="5%">本部门没有标准</td>
							</tr>
						</tbody>
					</table>
				</s:if>
				<s:else>
					<table class="table table-bordered table-hover table-striped">
						<tbody>
							<tr align="center">
								<td width="5%">标准名称</td>
								<td width="5%">创建管理员</td>
								<td width="5%">所属单位</td>
								<td width="13%">创建时间</td>
								<td width="7%">详情</td>
								<td width="5%">删除</td>
							</tr>
							<s:iterator value="%{#session.standardList}">
								<tr align="center">
									<td width="10%"><s:property value="name" /></td>
									<td width="10%"><s:property value="teacherId" /></td>
									<td width="10%"><s:property value="academy" /></td>
									<td width="15%"><s:date format="yyyy年MM月dd日"
											name="createTime" /></td>
									<td width="5%"><a
										href="getStandardDetail.action?standardId=<s:property value='standardId' />">详情</a></td>
									<td width="5%"><a
										href="deleteStandard.action?standardName=<s:property value='name' />&nowPage=1&academy=${sessionScope.currentUser.academy}"
										class="delete">删除</a><input type="hidden"
										value="<s:property value='name' />" /></td>
								</tr>
							</s:iterator>
							<s:if test="%{#session.standardPage.pageNum>1}">
								<tr align="center" style="background-color: #F1F1F1">
									<td colspan="8"><s:if
											test="%{#session.standardPage.nowPage==1}">
										</s:if> <s:else>
											<a
												href="getStandard.action?nowPage=${sessionScope.standardPage.nowPage-1}"
												style="text-decoration: none">上一页</a>
										</s:else> <s:if
											test="%{#session.standardPage.nowPage==#session.standardPage.pageNum }">
										</s:if> <s:else>
											<a
												href="getgetStandard.action?nowPage=${sessionScope.standardPage.nowPage+1}"
												style="text-decoration: none">下一页</a>
										</s:else> 当前&nbsp;&nbsp;<font color="red">${sessionScope.standardPage.nowPage}/${sessionScope.standardPage.pageNum}
											页</font></td>
								</tr>
							</s:if>
						</tbody>
					</table>
				</s:else>
			</div>
		</div>
		<%@include file="foot.jsp"%>
	</div>
</body>
</html>
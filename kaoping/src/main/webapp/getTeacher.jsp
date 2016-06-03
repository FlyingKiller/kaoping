<%@ page language="java" import="java.util.*,java.text.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查询教职工</title>
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
	// 	$(document).ready(function() {
	// 		var url = "getDeparetmentAndLevel.action";
	// 		var params = {
	// 			"academy" : $("#academy").val()
	// 		};
	// 		$.post(url, params, function(data) {
	// 			if (data == "success")
	// 				window.location.reload();
	// 		});
	// 	});
	function getTeacherByName() {
		if ($("#teacherName").val() == "") {
			alert("请输入姓名");
		} else {
			$("#getForm").submit();
		}
	}
	function next() {
		var url = "getTeacher.action";
		var params = {
			"departmentName" : $("#departmentName").val(),
			"levelName" : $("#levelName").val(),
			"nowPage" : $("#nextPage").val()
		};
		$.post(url, params, function(data) {
			if (data == "success") {
				window.location.reload();
			} else {
				window.location.reload();
			}
		});
	}
	function up() {
		var url = "getTeacher.action";
		var params = {
			"departmentName" : $("#departmentName").val(),
			"levelName" : $("#levelName").val(),
			"nowPage" : $("#upPage").val()
		};
		$.post(url, params, function(data) {
			if (data == "success") {
				window.location.reload();
			} else {
				window.location.reload();
			}
		});
	}
	function Change() {
		var url = "getTeacher.action";
		var params = {
			"departmentName" : $("#departmentName").val(),
			"levelName" : $("#levelName").val(),
			"nowPage" : 1
		};
		$.post(url, params, function(data) {
			if (data == "success") {
				window.location.reload();
			} else {
				window.location.reload();
			}
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
					<span class="divider">/</span>查询教职工
				</ul>
				<div class="title_right">
					<strong>查询教职工</strong>
				</div>
			</div>
			<div style="width: 900px; margin: auto">
				<form action="getTeacherByName" method="post" id="getForm">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td align="center" bgcolor="#f1f1f1" nowrap="nowrap" width="10%">所在单位:</td>
								<td><s:if test="%{#session.currentUser.academy!='超级管理员'}">
										<select id="departmentName" name="departmentName"
											style="height: 27px;"><option
												value="${sessionScope.currentUser.academy}">${sessionScope.currentUser.academy}</option>
										</select>
									</s:if> <s:else>
										<select id="departmentName" name="departmentName"
											style="height: 27px;" onchange="Change()"><s:if
												test="%{#session.nowDepartment==null||#session.nowDepartment==''}">
												<option value="">不限</option>
												<c:forEach var="dm"
													items="${sessionScope.academyDepartment}">
													<option value="${dm}">${dm}</option>
												</c:forEach>
											</s:if>
											<s:else>
												<option value="${sessionScope.nowDepartment}">${sessionScope.nowDepartment}</option>
												<option value="">不限</option>
												<c:forEach var="dm"
													items="${sessionScope.academyDepartment}">
													<option value="${dm}">${dm}</option>
												</c:forEach>
											</s:else>
										</select>
									</s:else></td>
								<td align="center" bgcolor="#f1f1f1" nowrap="nowrap" width="10%">级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
								<td><select id="levelName" name="levelName"
									style="height: 27px;" onchange="Change()"><s:if
											test="%{#session.nowLevelName==null||#session.nowLevelName==''}">
											<option value="">不限</option>
											<c:forEach var="level" items="${sessionScope.level}">
												<option value="${level.levelName}">${level.levelName}</option>
											</c:forEach>
										</s:if>
										<s:else>
											<option value="${sessionScope.nowLevelName}">${sessionScope.nowLevelName}</option>
											<option value="">不限</option>
											<c:forEach var="level" items="${sessionScope.level}">
												<option value="${level.levelName}">${level.levelName}</option>
											</c:forEach>
										</s:else>
								</select></td>
								<td align="center" bgcolor="#f1f1f1" nowrap="nowrap" width="10%">输入姓名:</td>
								<td><input type="text" name="teacherName" id="teacherName" /></td>
								<td align="center"><input value="查询" class="btn btn-info "
									id="getTeacher" style="width: 80px;" type="button"
									onclick="getTeacherByName()" /><input type="hidden"
									name="academy" id="academy" value="${sessionScope.test.test}" /></td>
							</tr>
						</tbody>
					</table>
				</form>
				<s:if
					test="%{#session.evaTeacherList==null||#session.evaTeacherList.size==0}">
					<table class="table table-bordered table-hover table-striped">
						<tbody>
							<tr align="center">
								<td>教师不存在</td>
							</tr>
						</tbody>
					</table>
				</s:if>
				<s:else>
					<table class="table table-bordered table-hover table-striped">
						<tbody>
							<tr align="center">
								<td width="7%"><strong>姓名</strong></td>
								<td width="5%"><strong>性别</strong></td>
								<td width="5%"><strong>民族</strong></td>
								<td width="8%"><strong>政治面貌</strong></td>
								<td width="8%"><strong>党政级别</strong></td>
								<td width="8%"><strong>职称</strong></td>
								<td width="8%"><strong>职称级别</strong></td>
								<td width="5%"><strong>工号</strong></td>
								<td width="15%"><strong>所在单位</strong></td>
								<td width=""><strong>身份证</strong></td>
								<td width="5%"><strong>密码</strong></td>
								<td width="5%"><strong>修改</strong></td>
								<td width="5%"><strong>删除</strong></td>
							</tr>
							<s:iterator value="%{#session.evaTeacherList}">
								<tr align="center">
									<td><s:property value="name" /></td>
									<td><s:property value="sex" /></td>
									<td><s:property value="nation" /></td>
									<td><s:property value="status" /></td>
									<td><s:property value="level" /></td>
									<td><s:property value="positional" /></td>
									<td><s:property value="positionalLevel" /></td>
									<td><s:property value="teacherId" /></td>
									<td><s:property value="academy" /></td>
									<td><s:property value="cardId" /></td>
									<td><s:property value="password" /></td>
									<td><a
										href="updateTeacher.action?teacherId=<s:property value='teacherId' />">修改</a></td>
									<td><a
										href="deleteAdmin.action?teacherId=${admin.teacherId}"
										id="delete">删除</a><input type="hidden" value="${admin.name}" /></td>
								</tr>
							</s:iterator>
							<s:if test="%{#session.evaTeacherPage.pageNum>1}">
								<tr align="center" style="background-color: #F1F1F1">
									<td colspan="19"><s:if
											test="%{#session.evaTeacherPage.nowPage==1}">
										</s:if> <s:else>
											<a href="#" style="text-decoration: none" onclick="up()">上一页</a>
											<input type="hidden"
												value="${sessionScope.evaTeacherPage.nowPage-1}"
												id="upPage" />
										</s:else> <s:if
											test="%{#session.evaTeacherPage.nowPage==#session.evaTeacherPage.pageNum }">
										</s:if> <s:else>
											<a href="#" style="text-decoration: none" onclick="next()">下一页</a>
											<input type="hidden"
												value="${sessionScope.evaTeacherPage.nowPage+1}"
												id="nextPage" />
										</s:else> 当前&nbsp;&nbsp;<font color="red">${sessionScope.evaTeacherPage.nowPage}/${sessionScope.evaTeacherPage.pageNum}
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
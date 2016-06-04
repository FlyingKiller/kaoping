<%@ page language="java" import="java.util.*,java.text.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>修改教师信息</title>
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
					<span class="divider">/</span>修改教师信息
				</ul>
				<div class="title_right">
					<strong>修改教师信息</strong>
				</div>
			</div>
			<div style="width:900px; margin:auto">
				<form action="updateTeacher" method="post">
					<table class="table table-bordered table-hover table-striped">
						<tbody>
							<tr align="center">
								<td width="10%">姓名</td>
								<td width="25%">${session.updateTeacher.name}</td>
								<td width="80%"><input type="text"
									value="${session.updateTeacher.name}" name="name" /></td>
							</tr>
							<tr align="center">
								<td width="5%">性别</td>
								<td width="5%">${session.updateTeacher.sex}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.sex}" name="sex" /></td>
							</tr>
							<tr align="center">
								<td width="5%">民族</td>
								<td width="5%">${session.updateTeacher.nation}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.nation}" name="nation" /></td>
							</tr>
							<tr align="center">
								<td width="5%">政治面貌</td>
								<td width="5%">${session.updateTeacher.status}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.status}" name="status" /></td>
							</tr>
							<tr align="center">
								<td width="5%">学位</td>
								<td width="5%">${session.updateTeacher.degree}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.degree}" name="degree" /></td>
							</tr>
							<tr align="center">
								<td width="5%">个人身份</td>
								<td width="5%">${session.updateTeacher.dignity}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.dignity}" name="dignity" /></td>
							</tr>
							<tr align="center">
								<td width="5%">级别</td>
								<td width="5%">${session.updateTeacher.level}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.level}" name="level" /></td>
							</tr>
							<tr align="center">
								<td width="5%">职称</td>
								<td width="5%">${session.updateTeacher.positional}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.positional}" name="positional" /></td>
							</tr>
							<tr align="center">
								<td width="5%">职称级别</td>
								<td width="5%">${session.updateTeacher.positionalLevel}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.positionalLevel}"
									name="positionalLevel" /></td>
							</tr>
							<tr align="center">
								<td width="5%">职称系列</td>
								<td width="5%">${session.updateTeacher.positionalSery}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.positionalSery}"
									name="positionalSery" /></td>
							</tr>
							<tr align="center">
								<td width="5%">职工工号</td>
								<td width="5%">${session.updateTeacher.teacherId}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.teacherId}" name="teacherId" /></td>
							</tr>
							<tr align="center">
								<td width="5%">所在单位</td>
								<td width="5%">${session.updateTeacher.academy}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.academy}" name="academy" /></td>
							</tr>
							<tr align="center">
								<td width="5%">身份证</td>
								<td width="5%">${session.updateTeacher.cardId}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.cardId}" name="cardId" /></td>
							</tr>
							<tr align="center">
								<td width="5%">密码</td>
								<td width="5%">${session.updateTeacher.password}</td>
								<td width="5%"><input type="text"
									value="${session.updateTeacher.password}" name="password" /></td>
							</tr>
						</tbody>
					</table>
					<table class="margin-bottom-20 table  no-border">
						<tbody>
							<tr>
								<td class="text-center"><input type="hidden"
									value="${session.updateTeacher.id}" name="id" /><input
									type="hidden" value="${sessionScope.currentUser.academy}"
									name="adminAcademy" /><input value="确定修改" class="btn btn-info "
									style="width:80px;" type="submit" /></td>
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
<%@ page language="java" import="java.util.*,java.text.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>考评标准添加成功</title>
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
	
</script>
</head>
<body style="background-color: white">
	<%@include file="header.jsp"%>
	<div id="middle">
		<%@include file="menu.jsp"%>
		<div class="right" id="mainFrame">
			<div class="right_cont">
				<ul class="breadcrumb">
					当前位置： ${sessionScope.index}
					<span class="divider">/</span>考评标准添加成功
				</ul>
				<div class="title_right">
					<strong>考评标准添加成功</strong>
				</div>
			</div>
			<div style="width:900px; margin:auto;">
				<table style="margin:auto;width:85.5%;margin-top:20px;"
					class="table table-bordered">
					<tbody>
						<tr align="center">
							<td width="50%" bgcolor="#f1f1f1" nowrap="nowrap">标准项名</td>
							<td bgcolor="#f1f1f1" nowrap="nowrap">分数</td>
						</tr>
						<c:forEach items="${sessionScope.content}" var="con">
							<tr align="center">
								<td>${con.name}</td>
								<td>${con.percent}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table style="margin:auto;width:85.5%;margin-top:20px;"
					class="table table-bordered">
					<tbody align="center">
						<tr align="center">
							<td width="50%" bgcolor="#f1f1f1" nowrap="nowrap">比重名称</td>
							<td bgcolor="#f1f1f1" nowrap="nowrap">比重</td>
						</tr>
						<tr>
							<td>优&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;秀</td>
							<td>${sessionScope.standardSuccess.excellent}&nbsp;%</td>
						</tr>
						<tr>
							<td>称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职</td>
							<td>${sessionScope.standardSuccess.eligibility}&nbsp;%</td>
						</tr>
						<tr>
							<td>基本称职</td>
							<td>${sessionScope.standardSuccess.jeligibility}&nbsp;%</td>
						</tr>
						<tr>
							<td>不&nbsp;&nbsp;称&nbsp;&nbsp;职</td>
							<td>${sessionScope.standardSuccess.beligibility}&nbsp;%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div><%@include file="foot.jsp"%>
	</div>
</body>
</HTML>

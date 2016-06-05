<%@ page language="java" import="java.util.*,java.text.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>标准信息</title>
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
					<span class="divider">/</span>
					<a href="getStandard.jsp">查看标准</a>
					<span class="divider">/</span>标准信息
				</ul>
				<div class="title_right">
					<strong>${sessionScope.standardContentList[0].standardName}</strong>
				</div>
			</div>
			<div style="width:900px; margin:auto;">
				<table style="margin:auto;width:85.5%;margin-top:20px;"
					class="table table-bordered table-hover table-striped">
					<tbody align="center">
						<tr align="center">
							<td width="50%" bgcolor="#f1f1f1" nowrap="nowrap">标准项名称</td>
							<td bgcolor="#f1f1f1" nowrap="nowrap">分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数</td>
						</tr>
						<c:forEach var="sc" items="${sessionScope.standardContentList}">
							<tr>
								<td>${sc.contentName}</td>
								<td>${sc.percent}&nbsp;&nbsp;分</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="table table-bordered table-hover table-striped"
					style="margin:auto;width:85.5%;margin-top:20px;">
					<tbody>
						<tr align="center">
							<td width="5%">权重名称</td>
							<td width="5%">权重</td>
						</tr>
						<tr align="center">
							<td width="5%">领导</td>
							<td width="5%">${sessionScope.standardBList.schoolweight}</td>
						</tr>
						<tr align="center">
							<td width="5%">同级</td>
							<td width="5%">${sessionScope.standardBList.sameweight}</td>
						</tr>
						<tr align="center">
							<td width="5%">下级</td>
							<td width="5%">${sessionScope.standardBList.sameacademyweight}</td>
						</tr>
					</tbody>
				</table>
				<table class="table table-bordered table-hover table-striped"
					style="margin:auto;width:85.5%;margin-top:20px;">
					<tbody>
						<tr align="center">
							<td width="5%">比重名称</td>
							<td width="5%">比重</td>
						</tr>
						<tr align="center">
							<td width="5%">优秀</td>
							<td width="5%">${sessionScope.standardBList.excellent/100}</td>
						</tr>
						<tr align="center">
							<td width="5%">称职</td>
							<td width="5%">${sessionScope.standardBList.eligibility/100}</td>
						</tr>
						<tr align="center">
							<td width="5%">基本称职</td>
							<td width="5%">${sessionScope.standardBList.jeligibility/100}</td>
						</tr>
						<tr align="center">
							<td width="5%">不称职</td>
							<td width="5%">${sessionScope.standardBList.beligibility/100}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div><%@include file="foot.jsp"%>
	</div>
</body>
</HTML>

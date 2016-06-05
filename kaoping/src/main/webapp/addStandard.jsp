<%@ page language="java" import="java.util.*,java.text.*"
	pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新建标准</title>
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
	$(function() {
		$("form")
				.submit(
						function(e) {
							if ((parseFloat($("#sameweight").val())
									+ parseFloat($("#sameacademyweight").val()) + parseFloat($(
									"#schoolweight").val())) != 1) {
								alert("权重相加必须为1");
								e.preventDefault();
							} else if ($("#standardName").val() == "") {
								alert("标准名不能为空");
								e.preventDefault();
							} else {
							}
						});
		$("#standardName").blur(function() {
			checkStandardName();
		});
	});
	var i = 1;
	window.onload = function() {
		var b1 = document.getElementById("add");
		var b2 = document.getElementById("delete");
		b1.onclick = function() {
			add();
		};
		b2.onclick = function() {
			remove();
		};
	};

	function add() {
		var content = "content[" + i + "].name";
		var percent = "content[" + i + "].percent";
		var addn = document.getElementById("d1");
		var addp = document.getElementById("d2");
		var inpn = document.createElement("input");
		inpn.setAttribute("type", "text");
		inpn.setAttribute("name", content);
		inpn.setAttribute("id", content);
		inpn.setAttribute("style", "margin-top:5px");
		inpn.setAttribute("style", "width:98%");
		var inpp = document.createElement("input");
		inpp.setAttribute("type", "text");
		inpp.setAttribute("name", percent);
		inpp.setAttribute("id", percent);
		inpp.setAttribute("style", "margin-top:5px");
		inpp.setAttribute("style", "width:98%");
		if (addn.getElementsByTagName("input").length < 10) {
			addn.appendChild(inpn);
			addp.appendChild(inpp);
			i++;
		} else {
			alert("超出上限");
		}
	}
	function remove() {
		var content = "content[" + i + "].name";
		var percent = "content[" + i + "].percent";
		var addn = document.getElementById("d1");
		var addp = document.getElementById("d2");
		if (addn.getElementsByTagName("input").length > 1) {
			addn.removeChild(addn.lastChild);
			addp.removeChild(addp.lastChild);
			i--;
		} else {
		}
	}
	function checkStandardName() {
		var url = "checkStandardName.action";
		var params = {
			standardName : $("#standardName").val()
		};
		$.post(url, params, function(data) {
			// 			alert(data);
			$("#result").html(data);
			$("#result").css("color", "red");
		});
	}

	// 	function sureButton() {
	// 	}
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
					<span class="divider">/</span>新建标准
				</ul>
				<div class="title_right">
					<strong>新建标准 </strong>
				</div>
			</div>
			<div style="width:900px; margin:auto;">
				<form action="addStandard" method="post">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td colspan="1" align="center" bgcolor="#f1f1f1" nowrap="nowrap">标准名称：</td>
								<td colspan="7"><input style="width:15%"
									name="standardName" id="standardName" type="text"
									onkeyup="checkStandardName()" /><span id="result"></span></td>
							</tr>
							<tr>
								<td width="10%" align="center" bgcolor="#f1f1f1" nowrap="nowrap">优&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;秀：</td>
								<td><input type="text" name="excellent" style="width:94%" /></td>
								<td width="10%" align="center" bgcolor="#f1f1f1" nowrap="nowrap">称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职：</td>
								<td><input type="text" name="eligibility" style="width:94%" /></td>
								<td width="10%" align="center" bgcolor="#f1f1f1" nowrap="nowrap">基本称职：</td>
								<td><input type="text" name="jeligibility"
									style="width:94%" /></td>
								<td width="10%" align="center" bgcolor="#f1f1f1" nowrap="nowrap">不称职：</td>
								<td><input type="text" name="beligibility"
									style="width:94%" /></td>
							</tr>
							<tr>
								<td align="center" bgcolor="#f1f1f1" nowrap="nowrap">校级权重：</td>
								<td><input type="text" name="schoolweight"
									style="width:94%" id="schoolweight" /></td>
								<td align="center" bgcolor="#f1f1f1" nowrap="nowrap">同级权重：</td>
								<td><input type="text" name="sameweight" style="width:94%"
									id="sameweight" /></td>
								<td align="center" bgcolor="#f1f1f1" nowrap="nowrap">下级权重：</td>
								<td><input type="text" name="sameacademyweight"
									style="width:94%" id="sameacademyweight" /></td>
								<td colspan="2"><span style="color:red">请填写小数，如 0.9</span></td>
							</tr>
							<tr>
								<td colspan="4"><div style="" id="d1">
										<input type="text" name="content[0].name" id="content[0].name"
											style="width:98%" />
									</div></td>
								<td colspan="4"><div style="" id="d2">
										<input type="text" name="content[0].percent"
											id="content[0].percent" style="width:98%" />
									</div></td>
							</tr>
							<tr>
								<td colspan="4"><input type="button" id="add" value="添加"
									style="width:100%" class="btn btn-info " /></td>
								<td colspan="4"><input type="button" id="delete" value="删除"
									style="width:100%" class="btn btn-info " /></td>
							</tr>
							<tr style="display:none">
								<td><input type="text" name="academy" id="academy"
									value="${sessionScope.currentUser.academy}" /></td>
								<td><input type="text" name="teacherId" id="teacherId"
									value="${sessionScope.currentUser.teacherId}" /></td>
							</tr>
						</tbody>
					</table>
					<table class="margin-bottom-20 table  no-border">
						<tbody>
							<tr>
								<td class="text-center"><input value="确定"
									class="btn btn-info " style="width:80px;" type="submit"
									id="sure" onclick="sureButton()" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div><%@include file="foot.jsp"%>
	</div>
</body>
</HTML>

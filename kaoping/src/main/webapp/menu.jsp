<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="js/sdmenu.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var myMenu;
		myMenu = new SDMenu("my_menu");
		myMenu.init();
	});
</script>
<div class="left">
	<div id="my_menu" class="sdmenu">
		<s:if test="%{#session.currentUser.type==0}">
			<div>
				<span>管理员管理</span> <a href="addAdmin.jsp">添加管理员</a> <a
					href="getAdmin.action">查看管理员</a>
			</div>
		</s:if>
		<div class="collapsed">
			<span>教职工管理</span><a href="getDeparetmentAndLevel.action?nowPage=1">查询教职工</a>
			<a href="addTeacher.jsp">添加教职工</a>
		</div>
		<div class="collapsed">
			<span>考评标准</span><a href="addStandard.jsp">新建标准</a> <a
				href="getStandard.action?nowPage=1">查看标准</a>
		</div>
		<div class="collapsed">
			<span>考评管理</span> <a href="addEvaluation.jsp">新建干部考评</a>
			<s:if test="%{#session.currentUser.type==0}">
				<a
					href="getEvaluation.action?academy=${sessionScope.currentUser.academy}&isFinished=0">未结束考评</a>
				<a
					href="getEvaluation.action?academy=${sessionScope.currentUser.academy}&isFinished=1">已结束考评</a>
			</s:if>
		</div>
	</div>
</div>
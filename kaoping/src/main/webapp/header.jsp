<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<script type="text/javascript">
	!function() {
		laydate.skin('molv');
		laydate({
			elem : '#Calendar'
		});
	}();
</script>
	<div class="header">
		<div class="logo">
			<img src="img/logo.png" />
		</div>
		<div class="header-right">
			<i class="icon-user icon-white"></i> <span
				style="color:white;font-size:13px">${sessionScope.currentName}</span>
			&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-off icon-white"></i> <a
				id="modal-973558" href="#modal-container-973558" role="button"
				data-toggle="modal">注销</a>
			<div id="modal-container-973558" class="modal hide fade"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
				style="width:300px; margin-left:-150px; top:30%">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">注销系统</h3>
				</div>
				<div class="modal-body">
					<p>您确定要注销退出系统吗？</p>
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary" style="line-height:20px;"
						href="exit.action">确定退出</a>
					<button class="btn" data-dismiss="modal" aria-hidden="true"
						style="width:30%">关闭</button>
				</div>
			</div>
		</div>
	</div>
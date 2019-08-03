<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/js/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form','layer'], function() {
		var form = layui.form,
		layer= layui.layer;
	});
	
</script>
</head>
<body style="padding-top: 50px">
	 <form class="layui-form" action="" method="post">

		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-inline">
				<input type="text" name="name" required lay-verify="required"
					placeholder="请输入姓名" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block">
				<input type="radio" name="gender" value="男" title="男">
				<input type="radio" name="gender" value="女" title="女" checked>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">电话</label>
			<div class="layui-input-inline">
				<input type="text" name="tel" required lay-verify="required"
					placeholder="请输电话号码" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮件</label>
			<div class="layui-input-inline" style="width: 300px">
				<input type="text" name="email" required lay-verify="required"
					placeholder="请输入邮件" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">生日</label>
			<div class="layui-input-inline">
				<input type="date" name="bir" required lay-verify="required"
					placeholder="请选择出生日期" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">地址</label>
			<div class="layui-input-inline" style="width: 300px">
				<input type="text" name="address" required lay-verify="required"
					placeholder="请输入邮件" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">备注</label>
			<div class="layui-input-inline" style="width: 300px">
				<textarea name="remark" placeholder="请输入备注" class="layui-textarea"></textarea>
			</div>
		</div>
	</form>
</body>
</html>
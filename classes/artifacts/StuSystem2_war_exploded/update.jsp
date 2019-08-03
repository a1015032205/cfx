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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/script.js"></script>
<script type="text/javascript">
	layui.use([ 'form', 'layer','jquery' ], function() {
		var form = layui.form, 
		layer = layui.layer,
		$ = jQuery = layui.$;
		
		form.on('submit(*)',function(){
			$.ajax({
				url:"stu?method=update",
				type:"post",
				data:$("#myfrm").serialize(),
				success:function(){
					//修改完成，刷新父窗口,一刷新弹出层会自动关闭
					window.parent.location.reload();	
				}
			});
			
			//忽略掉提交事件
			return false;
		});
	});
	
	
	//点击，关闭弹出层，不刷新页面
	function myclose(){
		//alert("####");
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
	}

</script>

</head>
<body style="padding-top: 10px">
	<form class="layui-form" method="post" id="myfrm">
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-inline">
				<input type="hidden" name="id" /> <input type="text" name="name"
					required lay-verify="required" placeholder="请输入姓名"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block">
				<input type="radio" name="gender" value="男" title="男"> <input
					type="radio" name="gender" value="女" title="女" checked>
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
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit   lay-filter="*">立即修改</button>
				<button type="button" class="layui-btn layui-btn-primary" onclick="myclose()">关闭</button>
			</div>
		</div>
	</form>
</body>
</html>
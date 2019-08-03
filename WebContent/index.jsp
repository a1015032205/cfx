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
</head>
<body>
	<!-- 你的HTML代码 -->
	<script>
		//一般直接写在一个js文件中
		layui.use('layer', function() {
			var layer = layui.layer;

			layer.msg('Hello World');
		});
	</script>
</body>
</html>
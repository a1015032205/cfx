<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/js/layui/css/layui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/layui/layui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/my.js"></script>
</head>
<body>

	<table id="demo" lay-filter="test"></table>
	<script type="text/html" id="barDemo">
  		<a class="layui-btn layui-btn-sm " lay-event="detail">查看</a>
  		<a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
  		<a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
	</script>
</body>
</html>
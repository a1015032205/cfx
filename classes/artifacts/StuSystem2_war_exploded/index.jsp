<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/jquery-1.12.4.js"></script>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/js/layui/css/layui.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/layui/layui.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/script.js"></script>

</head>

<body style="margin-top: 20px;">

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/html" id="toolbarDemo">
    <button class="layui-btn layui-btn-sm layui-btn-primary" id="addBtn">
        <i class="layui-icon">&#xe654;新增</i>
    </button>
</script>

<div class="demoTable">
    <div class="layui-inline">
        <input class="layui-input" name="name" id="name" placeholder="要搜索的姓名"
               autocomplete="off">
    </div>
    <div class="layui-inline">
        <input class="layui-input" name="address" id="address"
               placeholder="要搜索的地址" autocomplete="off">
    </div>
    <button class="layui-btn" id="search" data-type="reload">搜索</button>
    <button class="layui-btn" id="reset" data-type="reload">重置</button>
</div>

<table id="mytab" lay-filter="test"></table>


</body>
</html>
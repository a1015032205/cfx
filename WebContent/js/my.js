layui.use('table',function(){
	
	var table = layui.table;
	
	table.render({
		
	    elem: '#demo'  //此处，对应的是jsp页面table的id名称
	    ,height: "full"  //它指定数据表格的高度,如果要占满整个高度,改为full即可
	    ,url: 'ajax?method=load' // 发出ajax请求，访问哪一个地址，请求json格式的数据
	    ,page: true // 开启分页
	    ,limits:[1,2,3,5,10,20,30,50]
		,toolbar:"default"  //工具栏
		,skin:"sm"//小尺寸
		,even: true //开启隔行背景
	    ,cols: [[ // 表头
	      {field: 'id', title: '编号',type:"checkbox", width:"5%", sort: true,align:"center"}
	      ,{field: 'name', title: '姓名', width:"15%", sort: true,align:"center"}
	      ,{field: 'gender', title: '性别', width:"10%", sort: true,align:"center"}
	      ,{field: 'clazz', title: '班级', width:"15%", sort: true,align:"center"} 
	      ,{field: 'tel', title: '电话', width:"13%",align:"center"}
	      ,{field: 'score', title: '成绩', width: "10%", sort: true,align:"center"}
	      ,{field: 'bir', title: '出生日期', width: "15%", sort: true,align:"center"}
	      ,{field: 'op', title: '操作', width: "15%", sort: true,align:"center",toolbar:"#barDemo"}
	    ]]
	  });
});
